Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25767E98BB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BDA10E2FD;
	Mon, 13 Nov 2023 09:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1A910E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:18:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3871218FC;
 Mon, 13 Nov 2023 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699867097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vYmhqq41xi2L4zlAr3r6o16JyhXR1oNfGkk+j0pi+Y0=;
 b=gpAI7aSJk7J0Tjs6CVTpjdyKe7TgUCIt510WZECYCAmWdPIVrWRo6Bs/7bc65ZksmOhV/T
 wJtAUnY3VLEtOAW4/SVNMD8xDDl8gCNK4PbDnsIdPFEnot2DTp6eMZxRDLTrSJlw4sh90f
 yHszInSwjNHV3Tn+ZpQFeyPMpumTK3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699867097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vYmhqq41xi2L4zlAr3r6o16JyhXR1oNfGkk+j0pi+Y0=;
 b=f82Gk8i1R1fVXqfbMyx/zxzEWFAT5E90zWskg3yRe6TWz4jmgBGraPMHGWqYvNpb0FJ9sz
 UidFIlLVPYA17EBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86FAD13398;
 Mon, 13 Nov 2023 09:18:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lD9oHNnpUWVlCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:18:17 +0000
Message-ID: <9f3d3c8d-fbf1-485b-9c2a-4d442733954d@suse.de>
Date: Mon, 13 Nov 2023 10:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231113085305.1823455-1-javierm@redhat.com>
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
In-Reply-To: <20231113085305.1823455-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K9cslAEsMxNnkCHgehuhkXzy"
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
Cc: Sergio Lopez <slp@redhat.com>, devicetree@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K9cslAEsMxNnkCHgehuhkXzy
Content-Type: multipart/mixed; boundary="------------u7OL1tOLRbRPsGZEaEj90vgk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrew Worsley <amworsley@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sergio Lopez <slp@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Message-ID: <9f3d3c8d-fbf1-485b-9c2a-4d442733954d@suse.de>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
References: <20231113085305.1823455-1-javierm@redhat.com>
In-Reply-To: <20231113085305.1823455-1-javierm@redhat.com>

--------------u7OL1tOLRbRPsGZEaEj90vgk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEzLjExLjIzIHVtIDA5OjUxIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBTb21lIERUIHBsYXRmb3JtcyB1c2UgRUZJIHRvIGJvb3QgYW5kIGluIHRoaXMg
Y2FzZSB0aGUgRUZJIEJvb3QgU2VydmljZXMNCj4gbWF5IHJlZ2lzdGVyIGEgRUZJX0dSQVBI
SUNTX09VVFBVVF9QUk9UT0NPTCBoYW5kbGUsIHRoYXQgd2lsbCBsYXRlciBiZQ0KPiBxdWVy
aWVkIGJ5IHRoZSBMaW51eCBFRkkgc3R1YiB0byBmaWxsIHRoZSBnbG9iYWwgc3RydWN0IHNj
cmVlbl9pbmZvIGRhdGEuDQo+IA0KPiBUaGUgZGF0YSBpcyB1c2VkIGJ5IHRoZSBHZW5lcmlj
IFN5c3RlbSBGcmFtZWJ1ZmZlcnMgKHN5c2ZiKSBmcmFtZXdvcmsgdG8NCj4gYWRkIGEgcGxh
dGZvcm0gZGV2aWNlIHdpdGggcGxhdGZvcm0gZGF0YSBhYm91dCB0aGUgc3lzdGVtIGZyYW1l
YnVmZmVyLg0KPiANCj4gQnV0IGlmIHRoZXJlIGlzIGEgInNpbXBsZS1mcmFtZWJ1ZmZlciIg
bm9kZSBpbiB0aGUgRFQsIHRoZSBPRiBjb3JlIHdpbGwNCj4gYWxzbyBkbyB0aGUgc2FtZSBh
bmQgYWRkIGFub3RoZXIgZGV2aWNlIGZvciB0aGUgc3lzdGVtIGZyYW1lYnVmZmVyLg0KPiAN
Cj4gVGhpcyBjb3VsZCBsZWFkIGZvciBleGFtcGxlLCB0byB0d28gcGxhdGZvcm0gZGV2aWNl
cyAoInNpbXBsZS1mcmFtZWJ1ZmZlciINCj4gYW5kICJlZmktZnJhbWVidWZmZXIiKSB0byBi
ZSBhZGRlZCBhbmQgbWF0Y2hlZCB3aXRoIHRoZWlyIGNvcnJlc3BvbmRpbmcNCj4gZHJpdmVy
cy4gU28gYm90aCBlZmlmYiBhbmQgc2ltcGxlZHJtIHdpbGwgYmUgcHJvYmVkLCBsZWFkaW5n
IHRvIGZvbGxvd2luZzoNCj4gDQo+IFsgICAgMC4wNTU3NTJdIGVmaWZiOiBmcmFtZWJ1ZmZl
ciBhdCAweGJkNThkYzAwMCwgdXNpbmcgMTYwMDBrLCB0b3RhbCAxNjAwMGsNCj4gWyAgICAw
LjA1NTc1NV0gZWZpZmI6IG1vZGUgaXMgMjU2MHgxNjAweDMyLCBsaW5lbGVuZ3RoPTEwMjQw
LCBwYWdlcz0xDQo+IFsgICAgMC4wNTU3NThdIGVmaWZiOiBzY3JvbGxpbmc6IHJlZHJhdw0K
PiBbICAgIDAuMDU1NzU5XSBlZmlmYjogVHJ1ZWNvbG9yOiBzaXplPTI6MTA6MTA6MTAsIHNo
aWZ0PTMwOjIwOjEwOjANCj4gLi4uDQo+IFsgICAgMy4yOTU4OTZdIHNpbXBsZS1mcmFtZWJ1
ZmZlciBiZDU4ZGMwMDAuZnJhbWVidWZmZXI6IFtkcm1dICpFUlJPUioNCj4gY291bGQgbm90
IGFjcXVpcmUgbWVtb3J5IHJhbmdlIFs/Pz8gMHhmZmZmNzlmMzBhMjllZTQwLTB4MmE1MDAw
MDAxYTcNCj4gZmxhZ3MgMHgwXTogLTE2DQo+IFsgICAgMy4yOTgwMThdIHNpbXBsZS1mcmFt
ZWJ1ZmZlcjogcHJvYmUgb2YgYmQ1OGRjMDAwLmZyYW1lYnVmZmVyDQo+IGZhaWxlZCB3aXRo
IGVycm9yIC0xNg0KPiANCj4gVG8gcHJldmVudCB0aGUgaXNzdWUsIG1ha2UgdGhlIE9GIGNv
cmUgdG8gZGlzYWJsZSBzeXNmYiBpZiB0aGVyZSBpcyBhIG5vZGUNCj4gd2l0aCBhICJzaW1w
bGUtZnJhbWVidWZmZXIiIGNvbXBhdGlibGUuIFRoYXQgd2F5IG9ubHkgdGhpcyBkZXZpY2Ug
d2lsbCBiZQ0KPiByZWdpc3RlcmVkIGFuZCBzeXNmYiB3b3VsZCBub3QgYXR0ZW1wdCB0byBy
ZWdpc3RlciBhbm90aGVyIG9uZSB1c2luZyB0aGUNCj4gc2NyZWVuX2luZm8gZGF0YSBldmVu
IGlmIHRoaXMgaGFzIGJlZW4gZmlsbGVkLg0KPiANCj4gVGhpcyBzZWVtcyB0aGUgY29ycmVj
dCB0aGluZyB0byBkbyBpbiB0aGlzIGNhc2UgYmVjYXVzZToNCj4gDQo+IGEpIE9uIGEgRFQg
cGxhdGZvcm0sIHRoZSBEVEIgaXMgdGhlIHNpbmdsZSBzb3VyY2Ugb2YgdHJ1dGggc2luY2Ug
aXMgd2hhdA0KPiAgICAgZGVzY3JpYmVzIHRoZSBoYXJkd2FyZSB0b3BvbG9neS4gRXZlbiBp
ZiBFRkkgQm9vdCBTZXJ2aWNlcyBhcmUgdXNlZCB0bw0KPiAgICAgYm9vdCB0aGUgbWFjaGlu
ZS4NCj4gDQo+IGIpIFRoZSBvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlX2luaXQoKSBm
dW5jdGlvbiBpcyBjYWxsZWQgaW4gdGhlDQo+ICAgICBhcmNoX2luaXRjYWxsX3N5bmMoKSBp
bml0Y2FsbCBsZXZlbCB3aGlsZSB0aGUgc3lzZmJfaW5pdCgpIGZ1bmN0aW9uDQo+ICAgICBp
cyBjYWxsZWQgbGF0ZXIgaW4gdGhlIHN1YnN5c19pbml0Y2FsbCgpIGluaXRjYWxsIGxldmVs
Lg0KPiANCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBXb3JzbGV5IDxhbXdvcnNsZXlAZ21haWwu
Y29tPg0KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTExMTA0
MjkyNi41Mjk5MC0yLWFtd29yc2xleUBnbWFpbC5jb20NCj4gU2lnbmVkLW9mZi1ieTogSmF2
aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0N
Cj4gDQo+ICAgZHJpdmVycy9vZi9wbGF0Zm9ybS5jIHwgMTggKysrKysrKysrKysrKysrKy0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wbGF0Zm9ybS5jIGIvZHJpdmVycy9v
Zi9wbGF0Zm9ybS5jDQo+IGluZGV4IGYyMzVhYjU1YjkxZS4uMGE2OTJmZGZlZjU5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL29mL3BsYXRmb3JtLmMNCj4gKysrIGIvZHJpdmVycy9vZi9w
bGF0Zm9ybS5jDQo+IEBAIC0yMCw2ICsyMCw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L29m
X2lycS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zeXNm
Yi5oPg0KPiAgIA0KPiAgICNpbmNsdWRlICJvZl9wcml2YXRlLmgiDQo+ICAgDQo+IEBAIC02
MjEsOCArNjIyLDIxIEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRf
cG9wdWxhdGVfaW5pdCh2b2lkKQ0KPiAgIAkJfQ0KPiAgIA0KPiAgIAkJbm9kZSA9IG9mX2dl
dF9jb21wYXRpYmxlX2NoaWxkKG9mX2Nob3NlbiwgInNpbXBsZS1mcmFtZWJ1ZmZlciIpOw0K
PiAtCQlvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5vZGUsIE5VTEwsIE5VTEwpOw0KPiAt
CQlvZl9ub2RlX3B1dChub2RlKTsNCj4gKwkJaWYgKG5vZGUpIHsNCj4gKwkJCS8qDQo+ICsJ
CQkgKiBTaW5jZSBhICJzaW1wbGUtZnJhbWVidWZmZXIiIGRldmljZSBpcyBhbHJlYWR5IGFk
ZGVkDQo+ICsJCQkgKiBoZXJlLCBkaXNhYmxlIHRoZSBHZW5lcmljIFN5c3RlbSBGcmFtZWJ1
ZmZlcnMgKHN5c2ZiKQ0KPiArCQkJICogdG8gcHJldmVudCBpdCBmcm9tIHJlZ2lzdGVyaW5n
IGFub3RoZXIgZGV2aWNlIGZvciB0aGUNCj4gKwkJCSAqIHN5c3RlbSBmcmFtZWJ1ZmZlciBs
YXRlciAoZS5nOiB1c2luZyB0aGUgc2NyZWVuX2luZm8NCj4gKwkJCSAqIGRhdGEgdGhhdCBt
YXkgaGFkIGJlZW4gZmlsbGVkIGFzIHdlbGwpLg0KPiArCQkJICoNCj4gKwkJCSAqIFRoaXMg
Y2FuIGhhcHBlbiBmb3IgZXhhbXBsZSBvbiBEVCBzeXN0ZW1zIHRoYXQgZG8gRUZJDQo+ICsJ
CQkgKiBib290aW5nIGFuZCBtYXkgcHJvdmlkZSBhIEdPUCBoYW5kbGUgdG8gdGhlIEVGSSBz
dHViLg0KPiArCQkJICovDQo+ICsJCQlzeXNmYl9kaXNhYmxlKCk7DQo+ICsJCQlvZl9wbGF0
Zm9ybV9kZXZpY2VfY3JlYXRlKG5vZGUsIE5VTEwsIE5VTEwpOw0KPiArCQkJb2Zfbm9kZV9w
dXQobm9kZSk7DQo+ICsJCX0NCj4gICANCj4gICAJCS8qIFBvcHVsYXRlIGV2ZXJ5dGhpbmcg
ZWxzZS4gKi8NCj4gICAJCW9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGUoTlVMTCwgTlVM
TCwgTlVMTCk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------u7OL1tOLRbRPsGZEaEj90vgk--

--------------K9cslAEsMxNnkCHgehuhkXzy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVR6dgFAwAAAAAACgkQlh/E3EQov+Ct
rg/+K68Yc6cHe9H8EyVBfDHJuRhyQ/WO42E+L+GfA+s8yBe3sKS8nEBX1b+0cFe/4uC8B9y9qnWH
WOJxZuMSmhjTK5l1iu3CuawDHcMdbJbeOuE9Ax85C746bn2fwIgSDZnLdNbfn08yMZ3Arc67MiAs
ZHnoIHw4u8JRJV7SvY2wlGJKgKW5sRvxp0r4rCIBf96V0L4F5xRYNWNpGDsw5W0b/dHbOVNMRSlg
CoHCjms7nFhYiSmggc99r9F4llXdVH/MaTWqdGpr6A4CSKl0qTOUcG54UMFOyQtNoKlU9aeYS2W/
XTg5n7uADnugSiSvFpXx52KeDedOozFUoPHYdig9fvQSEKB4l9WRtWO62U1DcAgFBA9FncCdO/4K
BZGHIZDnvf7aEUHmBG3JCkbhgEfEx8NMpZBZv4DDowIy5RbdT8gqi0OZamZiJU4Ci1/7as9MR6IP
tYQN6cZl6GbgfbsbE6dIsdozsJArzHhToX1mezK+Wx0+l/q9ppTWF2d0c6N6oJDxuoTZr45Obv6r
u0nvXVQmgN2/d6KDI4DivpD/rJfM0x5nK7EULgUhM5FLDqUHuWJ8MmbZHxxGCtOJa5S1skgz7iTQ
Ah1qaOtVxv57oZn0amANYtE26IEcQ/u1U2AIa27e7fVsf5y48dpJGOIfwY2THlAFjn+KBdGspif+
PIY=
=esaD
-----END PGP SIGNATURE-----

--------------K9cslAEsMxNnkCHgehuhkXzy--
