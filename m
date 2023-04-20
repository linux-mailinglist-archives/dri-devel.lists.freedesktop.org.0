Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9006E9232
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6496010E062;
	Thu, 20 Apr 2023 11:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046E10E062
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 11:10:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B0F6219C9;
 Thu, 20 Apr 2023 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681989036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=87bCnKHZgHCqKUbW1GM1B1++Jl0CmcT5Ix2jgEz2ud8=;
 b=fL/C8Sr4LkktXslGzN9Yq6J98UMB/WmY38EVeLD39vFmo5NcBcYzGfhzSsDjJYBtNhh3Zz
 4S/AJLt8nztc6LLiVNizNSm65fylqbtIldbsRpKOqfqISJlFq4AnHUGHScbXoPRr08wg5N
 2QdCXXINxsCDrFIQAjrKFe7Elp0FlgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681989036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=87bCnKHZgHCqKUbW1GM1B1++Jl0CmcT5Ix2jgEz2ud8=;
 b=vzgucqLVTppaHH3t3MA+WUcoV/okrDoJry7Kq5AghmKZ77PMC5EGPB43G/CIxP11d1yb5E
 nbajkbePtZkJm5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C358913584;
 Thu, 20 Apr 2023 11:10:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +o3eLqsdQWRoSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 11:10:35 +0000
Message-ID: <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
Date: Thu, 20 Apr 2023 13:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
 <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T73U97w4DKfFyB4LYy0jSttm"
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
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T73U97w4DKfFyB4LYy0jSttm
Content-Type: multipart/mixed; boundary="------------wZTu9SsP2f3Rtcb1u2kr0OKl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
 <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
In-Reply-To: <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>

--------------wZTu9SsP2f3Rtcb1u2kr0OKl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjMgdW0gMTI6MDQgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
DQo+IA0KPiBPbiAyMDIzLzQvMjAgMTU6MDcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+PiBBbSAyMC4wNC4yMyB1bSAwOTowNCBzY2hyaWViIFRob21hcyBaaW1t
ZXJtYW5uOg0KPj4+IEhpLA0KPj4+DQo+Pj4gdGhpcyBwYXRjaCBsb29rcyB0byBtZSBnb29k
IGFuZCBJJ2QgbGlrZSB0byBtZXJnZSBpdCwgaWYgbm8gb25lIG9iamVjdHMuDQo+Pg0KPj4g
UmVyZWFkaW5nIGl0LCBJIG1pZ2h0IGhhdmUgYmVlbiB0b28gZWFnZXIuIFdoYXQgaGFwcGVu
ZWQgdG8gdGhlIA0KPj4gc2V0dGluZyBvZiBzY3JlZW5fc2l6ZSA9IGJ1ZmZlci0+Z2VtLT5z
aXplID/CoCBJdCBpcyBub3QgcmVsZXZhbnQ/DQo+Pg0KPiBTaG9ydCBhbnN3ZXIgaXMgdGhh
dCBpdCBpcyBub3QgcmVsZXZhbnQuDQo+IA0KPiBBcyBsb25nIGFzIHRoZSBjb21wdXRlZCBk
YW1hZ2UgcmVjdGFuZ2xlIGlzIHNhbmUsIGl0J3MgT0sgdG8gYWxsb2NhdGUgYSANCj4gYml0
IG1vcmUgdGhhbiBuZWVkZWQuDQo+IA0KPiBJIHRoaW5rIGl0J3MgdHVybiBvdXQgdG8gYmUg
KmNvcnJlY3QqLCBpZiBub3QgZXh0cmVtZWx5Lg0KPiANCj4gQmVjYXVzZSBpdCBpcyBwYWdl
IHNpemUgYWxpZ25lZCzCoCB3cml0aW5nIHRvIGludmlzaWJsZSBhcmVhIGZvciBzb21lIA0K
PiBjYXNlIGlzIG5vdCBhIHNlcnZlIGlzc3VlLg0KPiANCj4gSXQgYWxzbyBndWFyYW50ZWUg
dGhhdCB0aGUgc2l6ZSBvZiBzaGFkb3cgc2NyZWVuIGJ1ZmZlciBpcyBleGFjdGx5IHRoZSAN
Cj4gc2FtZSBzaXplIHdpdGggaXRzIEdFTSBjb3VudGVycGFydC4NCg0KVGhhdCdzIGdvb2Qg
ZW5vdWdoIGZvciBtZS4gOikNCg0KPiANCj4gDQo+IE90aGVyd2lzZSBJIGhhdmUgdG8gYW5z
d2VyIHRoZSBxdWVzdGlvbg0KPiANCj4gV2hhdCB3aWxsIGhhcHBlbiBpZiB0aGUgJ3NjcmVl
bl9zaXplJyBpcyBub3QgcGFnZV9zaXplIGFsaWduZWQgYW5kIG1tYXAgDQo+IHdpbGwgbWFw
cGluZyBpbiB0aGUgZ3JhbnVsYXJpdHkgb2YgcGFnZXMgPw0KDQpZb3UgbmVlZCB0byBtYXAg
YXQgcGFnZSBncmFudWxhcml0eS4gSWYgc2NyZWVuX3NpemUgaXMgbm90IHBhZ2Utc2l6ZSAN
CmFsaWduZWQsIHRoZXJlJ3MgdGhpcyB0cmFpbGluZyBidWZmZXIgdGhhdCBpcyBhY2Nlc3Np
YmxlLCBidXQgY2Fubm90IGJlIA0KZGlzcGxheWVkLiBCdXQgdXNlcnNwYWNlIGhhcyBubyBk
aXJlY3Qgd2F5IG9mIGtub3dpbmcgdGhhdCwgc28gbGV0J3MgDQppZ25vcmUgdGhhdCBwcm9i
bGVtIGZvciBub3cuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiBJIHNl
ZSBlZmlmYiBhbHNvIGFsaWduIHRoZSBidWZmZXIgZ29pbmcgdG8gYmUgbWFwcGVkIHdpdGgg
cGFnZSBzaXplLg0KPiANCj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+
Pg0KPj4+IEluIHRoZSBuZWFyIGZ1dHVyZSwgYWZ0ZXIgaTkxNSBoYXMgc3dpdGNoZWQgdG8g
c3RydWN0IGRybV9jbGllbnQsIEkgDQo+Pj4gaW50ZW5kIHRvIG1vdmUgRFJNJ3MgZGVmZXJy
ZWQtSS9PIGhlbHBlcnMgaW50byBmYmRldi1nZW5lcmljIGFuZCANCj4+PiBpOTE1LiBUaG9z
ZSBhcmUgdGhlIHR3byB1c2VycywgYnV0IHRoZXkgYXJlIGZhaXJseSBkaWZmZXJlbnQuIFRo
ZXkgDQo+Pj4gY2FuIHRoZW4gYm90aCBoYXZlIHNvbWV0aGluZyB0YWlsb3JlZCB0b3dhcmRz
IHRoZWlyIG5lZWRzLg0KPj4+DQo+Pj4gQmVzdCByZWdhcmRzDQo+Pj4gVGhvbWFzDQo+Pj4N
Cj4+PiBBbSAyMC4wNC4yMyB1bSAwNTowNSBzY2hyaWViIFN1aSBKaW5nZmVuZzoNCj4+Pj4g
VGhlIGZiZGV2IHRlc3Qgb2YgSUdUIG1heSB3cml0ZSBhZnRlciBFT0YsIHdoaWNoIGxlYWQg
dG8gb3V0LW9mLWJvdW5kDQo+Pj4+IGFjY2VzcyBmb3IgZHJtIGRyaXZlcnMgaGlyZSBmYmRl
di1nZW5lcmljLiBGb3IgZXhhbXBsZSwgcnVuIGZiZGV2IHRlc3QNCj4+Pj4gb24gYSB4ODYr
YXN0MjQwMCBwbGF0Zm9ybSwgd2l0aCAxNjgweDEwNTAgcmVzb2x1dGlvbiwgd2lsbCBjYXVz
ZSB0aGUNCj4+Pj4gbGludXgga2VybmVsIGhhbmcgd2l0aCB0aGUgZm9sbG93aW5nIGNhbGwg
dHJhY2U6DQo+Pj4+DQo+Pj4+IMKgwqAgT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIFBU
SQ0KPj4+PiDCoMKgIFtJR1RdIGZiZGV2OiBzdGFydGluZyBzdWJ0ZXN0IGVvZg0KPj4+PiDC
oMKgIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9mYl9oZWxwZXJfZGFtYWdlX3dvcmsgW2RybV9r
bXNfaGVscGVyXQ0KPj4+PiDCoMKgIFtJR1RdIGZiZGV2OiBzdGFydGluZyBzdWJ0ZXN0IG51
bGxwdHINCj4+Pj4NCj4+Pj4gwqDCoCBSSVA6IDAwMTA6bWVtY3B5X2VybXMrMHhhLzB4MjAN
Cj4+Pj4gwqDCoCBSU1A6IDAwMTg6ZmZmZmExN2Q0MDE2N2Q5OCBFRkxBR1M6IDAwMDEwMjQ2
DQo+Pj4+IMKgwqAgUkFYOiBmZmZmYTE3ZDRlYjdmYTgwIFJCWDogZmZmZmExN2Q0MGUwYWE4
MCBSQ1g6IDAwMDAwMDAwMDAwMDE0YzANCj4+Pj4gwqDCoCBSRFg6IDAwMDAwMDAwMDAwMDFh
NDAgUlNJOiBmZmZmYTE3ZDQwZTBiMDAwIFJESTogZmZmZmExN2Q0ZWI4MDAwMA0KPj4+PiDC
oMKgIFJCUDogZmZmZmExN2Q0MDE2N2UyMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBm
ZmZmODk1MjJlY2ZmOGMwDQo+Pj4+IMKgwqAgUjEwOiBmZmZmYTE3ZDRlNGM1MDAwIFIxMTog
MDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmZhMTdkNGViN2ZhODANCj4+Pj4gwqDCoCBSMTM6
IDAwMDAwMDAwMDAwMDFhNDAgUjE0OiAwMDAwMDAwMDAwMDAwNDFhIFIxNTogZmZmZmExN2Q0
MDE2N2UzMA0KPj4+PiDCoMKgIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZm
Zjg5NTI1NzM4MDAwMCgwMDAwKSANCj4+Pj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4+
PiDCoMKgIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUw
MDMzDQo+Pj4+IMKgwqAgQ1IyOiBmZmZmYTE3ZDQwZTBiMDAwIENSMzogMDAwMDAwMDFlYWVj
YTAwNiBDUjQ6IDAwMDAwMDAwMDAxNzA2ZTANCj4+Pj4gwqDCoCBDYWxsIFRyYWNlOg0KPj4+
PiDCoMKgwqAgPFRBU0s+DQo+Pj4+IMKgwqDCoCA/IGRybV9mYmRldl9nZW5lcmljX2hlbHBl
cl9mYl9kaXJ0eSsweDIwNy8weDMzMCBbZHJtX2ttc19oZWxwZXJdDQo+Pj4+IMKgwqDCoCBk
cm1fZmJfaGVscGVyX2RhbWFnZV93b3JrKzB4OGYvMHgxNzAgW2RybV9rbXNfaGVscGVyXQ0K
Pj4+PiDCoMKgwqAgcHJvY2Vzc19vbmVfd29yaysweDIxZi8weDQzMA0KPj4+PiDCoMKgwqAg
d29ya2VyX3RocmVhZCsweDRlLzB4M2MwDQo+Pj4+IMKgwqDCoCA/IF9fcGZ4X3dvcmtlcl90
aHJlYWQrMHgxMC8weDEwDQo+Pj4+IMKgwqDCoCBrdGhyZWFkKzB4ZjQvMHgxMjANCj4+Pj4g
wqDCoMKgID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4+Pj4gwqDCoMKgIHJldF9mcm9t
X2ZvcmsrMHgyYy8weDUwDQo+Pj4+IMKgwqDCoCA8L1RBU0s+DQo+Pj4+IMKgwqAgQ1IyOiBm
ZmZmYTE3ZDQwZTBiMDAwDQo+Pj4+IMKgwqAgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAw
MDAwMCBdLS0tDQo+Pj4+DQo+Pj4+IFRoZSBpcyBiZWNhdXNlIGRhbWFnZSByZWN0YW5nbGVz
IGNvbXB1dGVkIGJ5DQo+Pj4+IGRybV9mYl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAo
KSBmdW5jdGlvbiBkb2VzIG5vdCBndWFyYW50ZWVkIHRvIGJlDQo+Pj4+IGJvdW5kIGluIHRo
ZSBzY3JlZW4ncyBhY3RpdmUgZGlzcGxheSBhcmVhLiBQb3NzaWJsZSByZWFzb25zIGFyZToN
Cj4+Pj4NCj4+Pj4gMSkgQnVmZmVycyBhcmUgYWxsb2NhdGVkIGluIHRoZSBncmFudWxhcml0
eSBvZiBwYWdlIHNpemUsIGZvciBtbWFwIA0KPj4+PiBzeXN0ZW0NCj4+Pj4gwqDCoMKgIGNh
bGwgc3VwcG9ydC4gVGhlIHNoYWRvdyBzY3JlZW4gYnVmZmVyIGNvbnN1bWVkIGJ5IGZiZGV2
IA0KPj4+PiBlbXVsYXRpb24gbWF5DQo+Pj4+IMKgwqDCoCBhbHNvIGNob29zZWQgYmUgcGFn
ZSBzaXplIGFsaWduZWQuDQo+Pj4+DQo+Pj4+IDIpIFRoZSBESVZfUk9VTkRfVVAoKSB1c2Vk
IGluIGRybV9mYl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKQ0KPj4+PiDCoMKgwqAg
d2lsbCBpbnRyb2R1Y2Ugb2ZmLWJ5LW9uZSBlcnJvci4NCj4+Pj4NCj4+Pj4gRm9yIGV4YW1w
bGUsIG9uIGEgMTZLQiBwYWdlIHNpemUgc3lzdGVtLCBpbiBvcmRlciB0byBzdG9yZSBhIDE5
MjB4MTA4MA0KPj4+PiBYUkdCIGZyYW1lYnVmZmVyLCB3ZSBuZWVkIGFsbG9jYXRlIDUwNyBw
YWdlcy4gVW5mb3J0dW5hdGVseSwgdGhlIHNpemUNCj4+Pj4gMTkyMCoxMDgwKjQgY2FuIG5v
dCBiZSBkaXZpZGVkIGV4YWN0bHkgYnkgMTZLQi4NCj4+Pj4NCj4+Pj4gwqAgMTkyMCAqIDEw
ODAgKiA0ID0gODI5NDQwMCBieXRlcw0KPj4+PiDCoCA1MDYgKiAxNiAqIDEwMjQgPSA4Mjkw
MzA0IGJ5dGVzDQo+Pj4+IMKgIDUwNyAqIDE2ICogMTAyNCA9IDgzMDY2ODggYnl0ZXMNCj4+
Pj4NCj4+Pj4gwqAgbGluZV9sZW5ndGggPSAxOTIwKjQgPSA3NjgwIGJ5dGVzDQo+Pj4+DQo+
Pj4+IMKgIDUwNyAqIDE2ICogMTAyNCAvIDc2ODAgPSAxMDgxLjYNCj4+Pj4NCj4+Pj4gwqAg
b2ZmIC8gbGluZV9sZW5ndGggPSA1MDcgKiAxNiAqIDEwMjQgLyA3NjgwID0gMTA4MQ0KPj4+
PiDCoCBESVZfUk9VTkRfVVAoNTA3ICogMTYgKiAxMDI0LCA3NjgwKSB3aWxsIHllaWxkIDEw
ODINCj4+Pj4NCj4+Pj4gbWVtY3B5X3RvaW8oKSB0eXBpY2FsbHkgaXNzdWUgdGhlIGNvcHkg
bGluZSBieSBsaW5lLCB3aGVuIGNvcHkgdGhlIGxhc3QNCj4+Pj4gbGluZSwgb3V0LW9mLWJv
dW5kIGFjY2VzcyB3aWxsIGJlIGhhcHBlbi4gQmVjYXVzZToNCj4+Pj4NCj4+Pj4gwqAgMTA4
MiAqIGxpbmVfbGVuZ3RoID0gMTA4MiAqIDc2ODAgPSA4MzA5NzYwLCBhbmQgODMwOTc2MCA+
IDgzMDY2ODgNCj4+Pj4NCj4+Pj4gTm90ZSB0aGF0IHVzZXJzcGFjZSBtYXkgc3RpbCB3cml0
ZSB0byB0aGUgaW52aXNpYWJsZSBhcmVhIGlmIGEgbGFyZ2VyDQo+Pj4+IGJ1ZmZlciB0aGFu
IHdpZHRoIHggc3RyaWRlIGlzIGV4cG9zZWQuIEJ1dCBpdCBpcyBub3QgYSBiaWcgaXNzdWUg
YXMNCj4+Pj4gbG9uZyBhcyB0aGVyZSBzdGlsbCBoYXZlIG1lbW9yeSByZXNvbHZlIHRoZSBh
Y2Nlc3MgaWYgbm90IGRyYWZ0aW5nIHNvDQo+Pj4+IGZhci4NCj4+Pj4NCj4+Pj4gwqAgLSBB
bHNvIGxpbWl0IHRoZSB5MSAoRGFuaWVsKQ0KPj4+PiDCoCAtIGtlZXAgZml4IHBhdGNoIGl0
IHRvIG1pbmltYWwgKERhbmllbCkNCj4+Pj4gwqAgLSBzY3JlZW5fc2l6ZSBpcyBwYWdlIHNp
emUgYWxpZ25lZCBiZWNhdXNlIG9mIGl0IG5lZWQgbW1hcCAoVGhvbWFzKQ0KPj4+PiDCoCAt
IEFkZGluZyBmaXhlcyB0YWcgKFRob21hcykNCj4+Pj4NCj4+Pj4gRml4ZXM6IGFhMTVjNjc3
Y2MzNCAoImRybS9mYi1oZWxwZXI6IEZpeCB2ZXJ0aWNhbCBkYW1hZ2UgY2xpcHBpbmciKQ0K
Pj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdmZW5nQGxv
b25nc29uLmNuPg0KPj4+PiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+Pj4+IFRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4+Pj4gTGluazogDQo+Pj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9hZDQ0ZGYyOS0zMjQxLTBkOWUtZTcwOC1iMDMzOGJm
M2M2MjNAMTg5LmNuLw0KPj4+PiAtLS0NCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9m
Yl9oZWxwZXIuYyB8IDE2ICsrKysrKysrKysrKy0tLS0NCj4+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIA0KPj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4gaW5kZXggNjQ0NTg5ODJiZTQwLi42
YmIxYjhiMjdkN2EgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0K
Pj4+PiBAQCAtNjQxLDE5ICs2NDEsMjcgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9k
YW1hZ2Uoc3RydWN0IA0KPj4+PiBkcm1fZmJfaGVscGVyICpoZWxwZXIsIHUzMiB4LCB1MzIg
eSwNCj4+Pj4gwqAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9f
Y2xpcChzdHJ1Y3QgZmJfaW5mbyANCj4+Pj4gKmluZm8sIG9mZl90IG9mZiwgc2l6ZV90IGxl
biwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPj4+PiDCoCB7DQo+Pj4+ICvC
oMKgwqAgdTMyIGxpbmVfbGVuZ3RoID0gaW5mby0+Zml4LmxpbmVfbGVuZ3RoOw0KPj4+PiAr
wqDCoMKgIHUzMiBmYl9oZWlnaHQgPSBpbmZvLT52YXIueXJlczsNCj4+Pj4gwqDCoMKgwqDC
oCBvZmZfdCBlbmQgPSBvZmYgKyBsZW47DQo+Pj4+IMKgwqDCoMKgwqAgdTMyIHgxID0gMDsN
Cj4+Pj4gLcKgwqDCoCB1MzIgeTEgPSBvZmYgLyBpbmZvLT5maXgubGluZV9sZW5ndGg7DQo+
Pj4+ICvCoMKgwqAgdTMyIHkxID0gb2ZmIC8gbGluZV9sZW5ndGg7DQo+Pj4+IMKgwqDCoMKg
wqAgdTMyIHgyID0gaW5mby0+dmFyLnhyZXM7DQo+Pj4+IC3CoMKgwqAgdTMyIHkyID0gRElW
X1JPVU5EX1VQKGVuZCwgaW5mby0+Zml4LmxpbmVfbGVuZ3RoKTsNCj4+Pj4gK8KgwqDCoCB1
MzIgeTIgPSBESVZfUk9VTkRfVVAoZW5kLCBsaW5lX2xlbmd0aCk7DQo+Pj4+ICsNCj4+Pj4g
K8KgwqDCoCAvKiBEb24ndCBhbGxvdyBhbnkgb2YgdGhlbSBiZXlvbmQgdGhlIGJvdHRvbSBi
b3VuZCBvZiBkaXNwbGF5IA0KPj4+PiBhcmVhICovDQo+Pj4+ICvCoMKgwqAgaWYgKHkxID4g
ZmJfaGVpZ2h0KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgeTEgPSBmYl9oZWlnaHQ7DQo+Pj4+
ICvCoMKgwqAgaWYgKHkyID4gZmJfaGVpZ2h0KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgeTIg
PSBmYl9oZWlnaHQ7DQo+Pj4+IMKgwqDCoMKgwqAgaWYgKCh5MiAtIHkxKSA9PSAxKSB7DQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IFdlJ3ZlIG9ubHkgd3JpdHRlbiB0byBhIHNpbmdsZSBzY2FubGluZS4gVHJ5IHRvIHJlZHVj
ZQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBudW1iZXIgb2YgaG9yaXpvbnRh
bCBwaXhlbHMgdGhhdCBuZWVkIGFuIHVwZGF0ZS4NCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKi8NCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIG9mZl90IGJpdF9vZmYgPSAob2ZmICUgaW5m
by0+Zml4LmxpbmVfbGVuZ3RoKSAqIDg7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBvZmZfdCBi
aXRfZW5kID0gKGVuZCAlIGluZm8tPmZpeC5saW5lX2xlbmd0aCkgKiA4Ow0KPj4+PiArwqDC
oMKgwqDCoMKgwqAgb2ZmX3QgYml0X29mZiA9IChvZmYgJSBsaW5lX2xlbmd0aCkgKiA4Ow0K
Pj4+PiArwqDCoMKgwqDCoMKgwqAgb2ZmX3QgYml0X2VuZCA9IChlbmQgJSBsaW5lX2xlbmd0
aCkgKiA4Ow0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeDEgPSBiaXRfb2ZmIC8gaW5mby0+
dmFyLmJpdHNfcGVyX3BpeGVsOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeDIgPSBESVZf
Uk9VTkRfVVAoYml0X2VuZCwgaW5mby0+dmFyLmJpdHNfcGVyX3BpeGVsKTsNCj4+Pg0KPj4N
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------wZTu9SsP2f3Rtcb1u2kr0OKl--

--------------T73U97w4DKfFyB4LYy0jSttm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRBHasFAwAAAAAACgkQlh/E3EQov+AE
Qw/+Jpd+9o0DCQndIWwwOBBa59Q2GfJdMtHB2v1bz2y/rn5RzC55T8YFUK2I9JPZFf2tq1BT8ZU3
GFikZrKj3wHLql4FpSbtYJ6sdbOqhqjr3P7Yvx0SEbByk1WSFnuNQmCLeemVXupAZWABGNp3Oi/G
O1+pHqIbVtguoSwAfYzIOqkK0IPp5QvCFCGSXTmxwiRlxTd6H1fg4qGR2Jn8h8JIfJLar4JMi3Ie
iUEKpbBkpHthu1Z3Hbfp2Q3HK2wI2oK3xk0lkb5RlnZm1R8a9PnBtYF4AKg1CuLnb+loD0vSo3oY
F2hvIwUrmGUCZfCAQl5VEY91wMzI/OR/6jKRtAjVT1Ndt5WlbokwFATFJpzIvcL1mp3xOINgY1YZ
GY84gz8pso1clvRlH0tLWgWZZqFvpv1b6GxE5zeNlI25pIwSK2n99e9RzhBSWbgE4Bgt1GDqEPwd
i86RHywAClHg6L7gZPfLHPDGNGWL0UvzOLU4i7angXBuOxgpCQ7Jfugiks6Qn2Ocmgwr4qUNNbPD
cZiMq41ZdZ+qVkA5/5HJmKjuCZmvAJJCrcDrkQYX6miNGZkL7Z3tbCRlmc6aYofjeMM6dxkK//0m
ApFRjT5tnbzhV9tziaXG5Osnlyi/mDiTpOCmBQ4WU0/p3HvaT9yMKHBCYF8lPBFvm9wnVRCWzqL8
a5o=
=Av7D
-----END PGP SIGNATURE-----

--------------T73U97w4DKfFyB4LYy0jSttm--
