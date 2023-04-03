Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBD6D3E8F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 10:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FDC10E266;
	Mon,  3 Apr 2023 08:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A7E10E266
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 08:02:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A9B2219E9;
 Mon,  3 Apr 2023 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680508975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFZ7quOifp4g1vCUBY4cHG7Gzb9r0mqxTr4kn7Wk1tc=;
 b=XGwyVw5vcNlClhFDfwptGHs4g22VIoSZrrO27YeP90RjPs5oH7iIur6gglPx/iJjEiaAXm
 pirHUiqv/s6ExtVi9/HnHiNIqjkbEp3dsrI3/WBdgVp8oiEnrBZroM2s3sEVFvQSj66ffz
 YZUz21ruGxO7E4wSz+oQBHTyF+t1zzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680508975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFZ7quOifp4g1vCUBY4cHG7Gzb9r0mqxTr4kn7Wk1tc=;
 b=ZeQixqU7QyTv3JrBJolyJjK/GwVnu0y67c4udLmaj8cXoiuvSDyLRFC7lBWkg0viO83Ncs
 W5l+1UCKga50uoAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1E1C1331A;
 Mon,  3 Apr 2023 08:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sA2DLi6IKmTeMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 08:02:54 +0000
Message-ID: <321a3874-3504-9dec-cb5a-7a8394be46b1@suse.de>
Date: Mon, 3 Apr 2023 10:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/vblank: Fix for drivers that do not drm_vblank_init()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230401153802.1066072-1-robdclark@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230401153802.1066072-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LtYdBgNLup5rLDUU0qOYNau8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LtYdBgNLup5rLDUU0qOYNau8
Content-Type: multipart/mixed; boundary="------------xHDy00R0ff56eNjO5oZ80b5j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Nathan Chancellor
 <nathan@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Message-ID: <321a3874-3504-9dec-cb5a-7a8394be46b1@suse.de>
Subject: Re: [PATCH] drm/vblank: Fix for drivers that do not drm_vblank_init()
References: <20230401153802.1066072-1-robdclark@gmail.com>
In-Reply-To: <20230401153802.1066072-1-robdclark@gmail.com>

--------------xHDy00R0ff56eNjO5oZ80b5j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDQuMjMgdW0gMTc6Mzggc2NocmllYiBSb2IgQ2xhcms6DQo+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gDQo+IFRoaXMgc2hvdWxk
IGZpeCBhIGNyYXNoIHRoYXQgd2FzIHJlcG9ydGVkIG9uIGFzdCAoYW5kIHBvc3NpYmx5IG90
aGVyDQo+IGRyaXZlcnMgd2hpY2ggZG8gbm90IGluaXRpYWxpemUgdmJsYW5rKS4NCj4gDQo+
ICAgICBmYmNvbjogVGFraW5nIG92ZXIgY29uc29sZQ0KPiAgICAgVW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAw
MDAwMDAwMDAwMDAwMDc0DQo+ICAgICBNZW0gYWJvcnQgaW5mbzoNCj4gICAgICAgRVNSID0g
MHgwMDAwMDAwMDk2MDAwMDA0DQo+ICAgICAgIEVDID0gMHgyNTogREFCVCAoY3VycmVudCBF
TCksIElMID0gMzIgYml0cw0KPiAgICAgICBTRVQgPSAwLCBGblYgPSAwDQo+ICAgICAgIEVB
ID0gMCwgUzFQVFcgPSAwDQo+ICAgICAgIEZTQyA9IDB4MDQ6IGxldmVsIDAgdHJhbnNsYXRp
b24gZmF1bHQNCj4gICAgIERhdGEgYWJvcnQgaW5mbzoNCj4gICAgICAgSVNWID0gMCwgSVNT
ID0gMHgwMDAwMDAwNA0KPiAgICAgICBDTSA9IDAsIFduUiA9IDANCj4gICAgIHVzZXIgcGd0
YWJsZTogNGsgcGFnZXMsIDQ4LWJpdCBWQXMsIHBnZHA9MDAwMDA4MDAwOWQxNjAwMA0KPiAg
ICAgWzAwMDAwMDAwMDAwMDAwNzRdIHBnZD0wMDAwMDAwMDAwMDAwMDAwLCBwNGQ9MDAwMDAw
MDAwMDAwMDAwMA0KPiAgICAgSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDAwMDAwMDAwOTYwMDAw
MDQgWyMxXSBTTVANCj4gICAgIE1vZHVsZXMgbGlua2VkIGluOiBpcDZ0YWJsZV9uYXQgdHVu
IG5mdF9maWJfaW5ldCBuZnRfZmliX2lwdjQgbmZ0X2ZpYl9pcHY2IG5mdF9maWIgbmZ0X3Jl
amVjdF9pbmV0IG5mX3JlamVjdF9pcHY0IG5mX3JlamVjdF9pcHY2IG5mdF9yZWplY3QgbmZ0
X2N0IG5mdF9jaGFpbl9uYXQgbmZfbmF0IG5mX2Nvbm50cmFjayBuZl9kZWZyYWdfaXB2NiBu
Zl9kZWZyYWdfaXB2NCByZmtpbGwgaXBfc2V0IG5mX3RhYmxlcyBuZm5ldGxpbmsgcXJ0ciBz
dW5ycGMgYmluZm10X21pc2MgdmZhdCBmYXQgeGZzIHNuZF91c2JfYXVkaW8gc25kX2h3ZGVw
IHNuZF91c2JtaWRpX2xpYiBzbmRfc2VxIHNuZF9wY20gc25kX3Jhd21pZGkgc25kX3RpbWVy
IHNuZF9zZXFfZGV2aWNlIHNuZCBzb3VuZGNvcmUgam95ZGV2IG1jIGlwbWlfc3NpZiBpcG1p
X2RldmludGYgaXBtaV9tc2doYW5kbGVyIGFybV9zcGVfcG11IGFybV9jbW4gYXJtX2RzdV9w
bXUgYXJtX2RtYzYyMF9wbXUgY3BwY19jcHVmcmVxIGxvb3AgenJhbSBjcmN0MTBkaWZfY2Ug
cG9seXZhbF9jZSBudm1lIHBvbHl2YWxfZ2VuZXJpYyBnaGFzaF9jZSBzYnNhX2d3ZHQgaWdi
IG52bWVfY29yZSBhc3QgbnZtZV9jb21tb24gaTJjX2FsZ29fYml0IHhnZW5lX2h3bW9uIGdw
aW9fZHdhcGIgc2NzaV9kaF9yZGFjIHNjc2lfZGhfZW1jIHNjc2lfZGhfYWx1YSBpcDZfdGFi
bGVzIGlwX3RhYmxlcyBkbV9tdWx0aXBhdGggZnVzZQ0KPiAgICAgQ1BVOiAxMiBQSUQ6IDQ2
OSBDb21tOiBrd29ya2VyLzEyOjEgTm90IHRhaW50ZWQgNi4zLjAtcmMyLTAwMDA4LWdkMzll
NDhjYTgwYzAgIzENCj4gICAgIEhhcmR3YXJlIG5hbWU6IEFETElOSyBBVkEgRGV2ZWxvcGVy
IFBsYXRmb3JtL0FWQSBEZXZlbG9wZXIgUGxhdGZvcm0sIEJJT1MgVGlhbm9Db3JlIDIuMDQu
MTAwLjA3IChTWVM6IDIuMDYuMjAyMjAzMDgpIDA5LzA4LzIwMjINCj4gICAgIFdvcmtxdWV1
ZTogZXZlbnRzIGZiY29uX3JlZ2lzdGVyX2V4aXN0aW5nX2Zicw0KPiAgICAgcHN0YXRlOiAy
MDQwMDAwOSAobnpDdiBkYWlmICtQQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0p
DQo+ICAgICBwYyA6IGRybV9jcnRjX25leHRfdmJsYW5rX3N0YXJ0KzB4MmMvMHg5OA0KPiAg
ICAgbHIgOiBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9mZW5jZXMrMHg5MC8weDI0MA0K
PiAgICAgc3AgOiBmZmZmODAwMDBkNTgzOTYwDQo+ICAgICB4Mjk6IGZmZmY4MDAwMGQ1ODM5
NjAgeDI4OiBmZmZmMDdmZjhmYzE4N2IwIHgyNzogMDAwMDAwMDAwMDAwMDAwMA0KPiAgICAg
eDI2OiBmZmZmMDdmZjk5YzA4YzAwIHgyNTogMDAwMDAwMDAwMDAwMDAzOCB4MjQ6IGZmZmYw
N2ZmOTljMGMwMDANCj4gICAgIHgyMzogMDAwMDAwMDAwMDAwMDAwMSB4MjI6IDAwMDAwMDAw
MDAwMDAwMzggeDIxOiAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgICB4MjA6IGZmZmYwN2ZmOTY0
MGEyODAgeDE5OiAwMDAwMDAwMDAwMDAwMDAwIHgxODogZmZmZmZmZmZmZmZmZmZmZg0KPiAg
ICAgeDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogZmZmZmIyNGQyZWVjZTFjMCB4MTU6IDAw
MDAwMDMwMzgzMDMxNzgNCj4gICAgIHgxNDogMzAzMjM5MzEwMDAwMDA0OCB4MTM6IDAwMDAw
MDAwMDAwMDAwMDAgeDEyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgICB4MTE6IDAwMDAwMDAw
MDAwMDAwMDAgeDEwOiAwMDAwMDAwMDAwMDAwMDAwIHg5IDogZmZmZmIyNGQyZWVlYWNhMA0K
PiAgICAgeDggOiBmZmZmODAwMDBkNTgzNjI4IHg3IDogMDAwMDA4MDA3Nzc4MzAwMCB4NiA6
IDAwMDAwMDAwMDAwMDAwMDANCj4gICAgIHg1IDogZmZmZjgwMDAwZDU4NDAwMCB4NCA6IGZm
ZmYwN2ZmOTljMGMwMDAgeDMgOiAwMDAwMDAwMDAwMDAwMTMwDQo+ICAgICB4MiA6IDAwMDAw
MDAwMDAwMDAwMDAgeDEgOiBmZmZmODAwMDBkNTgzOWMwIHgwIDogZmZmZjA3ZmY5OWMwY2Mw
OA0KPiAgICAgQ2FsbCB0cmFjZToNCj4gICAgICBkcm1fY3J0Y19uZXh0X3ZibGFua19zdGFy
dCsweDJjLzB4OTgNCj4gICAgICBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9mZW5jZXMr
MHg5MC8weDI0MA0KPiAgICAgIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCsweGIwLzB4MTg4
DQo+ICAgICAgZHJtX2F0b21pY19jb21taXQrMHhiMC8weGYwDQo+ICAgICAgZHJtX2NsaWVu
dF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMrMHgyMTgvMHgyODANCj4gICAgICBkcm1fY2xpZW50
X21vZGVzZXRfY29tbWl0X2xvY2tlZCsweDY0LzB4MWEwDQo+ICAgICAgZHJtX2NsaWVudF9t
b2Rlc2V0X2NvbW1pdCsweDM4LzB4NjgNCj4gICAgICBfX2RybV9mYl9oZWxwZXJfcmVzdG9y
ZV9mYmRldl9tb2RlX3VubG9ja2VkKzB4YjAvMHhmOA0KPiAgICAgIGRybV9mYl9oZWxwZXJf
c2V0X3BhcisweDQ0LzB4ODgNCj4gICAgICBmYmNvbl9pbml0KzB4MWUwLzB4NGE4DQo+ICAg
ICAgdmlzdWFsX2luaXQrMHhiYy8weDExOA0KPiAgICAgIGRvX2JpbmRfY29uX2RyaXZlci5p
c3JhLjArMHgxOTQvMHgzYTANCj4gICAgICBkb190YWtlX292ZXJfY29uc29sZSsweDUwLzB4
NzANCj4gICAgICBkb19mYmNvbl90YWtlb3ZlcisweDc0LzB4ZjgNCj4gICAgICBkb19mYl9y
ZWdpc3RlcmVkKzB4MTNjLzB4MTU4DQo+ICAgICAgZmJjb25fcmVnaXN0ZXJfZXhpc3Rpbmdf
ZmJzKzB4NzgvMHhjMA0KPiAgICAgIHByb2Nlc3Nfb25lX3dvcmsrMHgxZWMvMHg0NzgNCj4g
ICAgICB3b3JrZXJfdGhyZWFkKzB4NzQvMHg0MTgNCj4gICAgICBrdGhyZWFkKzB4ZWMvMHgx
MDANCj4gICAgICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KPiAgICAgQ29kZTogZjk0MDAw
MDQgYjk0MDkwMTMgZjk0MGEwODIgOWJhMzBhNzMgKGI5NDA3NjYyKQ0KPiAgICAgLS0tWyBl
bmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IA0KPiBSZXBvcnRlZC1ieTogTmF0
aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KPiBGaXhlczogZDM5ZTQ4Y2E4
MGMwICgiZHJtL2F0b21pYy1oZWxwZXI6IFNldCBmZW5jZSBkZWFkbGluZSBmb3IgdmJsYW5r
IikNCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
Pg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMTAgKysrKysr
KystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMNCj4gaW5kZXggMjk5ZmEyYTE5YTkwLi5l
OThlM2NlZmJhM2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5r
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYw0KPiBAQCAtOTk2LDEw
ICs5OTYsMTYgQEAgRVhQT1JUX1NZTUJPTChkcm1fY3J0Y192YmxhbmtfY291bnRfYW5kX3Rp
bWUpOw0KPiAgIGludCBkcm1fY3J0Y19uZXh0X3ZibGFua19zdGFydChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsIGt0aW1lX3QgKnZibGFua3RpbWUpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBp
bnQgcGlwZSA9IGRybV9jcnRjX2luZGV4KGNydGMpOw0KPiAtCXN0cnVjdCBkcm1fdmJsYW5r
X2NydGMgKnZibGFuayA9ICZjcnRjLT5kZXYtPnZibGFua1twaXBlXTsNCj4gLQlzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9ICZ2YmxhbmstPmh3bW9kZTsNCj4gKwlzdHJ1Y3Qg
ZHJtX3ZibGFua19jcnRjICp2Ymxhbms7DQo+ICsJc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGU7DQo+ICAgCXU2NCB2Ymxhbmtfc3RhcnQ7DQo+ICAgDQo+ICsJaWYgKCFjcnRjLT5k
ZXYtPnZibGFuaykNCg0KUmF0aGVyIHVzZQ0KDQogICBpZiAoIWRybV9kZXZfaGFzX3ZibGFu
aygpKQ0KDQpmb3IgdGhpcyB0ZXN0Lg0KDQpXaXRoIHRoYXQgZml4ZWQNCg0KUmV2aWV3ZWQt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJdmJsYW5r
ID0gJmNydGMtPmRldi0+dmJsYW5rW3BpcGVdOw0KPiArCW1vZGUgPSAmdmJsYW5rLT5od21v
ZGU7DQo+ICsNCj4gICAJaWYgKCF2YmxhbmstPmZyYW1lZHVyX25zIHx8ICF2YmxhbmstPmxp
bmVkdXJfbnMpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------xHDy00R0ff56eNjO5oZ80b5j--

--------------LtYdBgNLup5rLDUU0qOYNau8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQqiC4FAwAAAAAACgkQlh/E3EQov+BS
ChAAvAGAQLfPbanZnuZ+JXlVeQDN3aZjeyzsSB66m8Q8H/5n7tTrh5AdS/RDNpSHhvmUXwC7CXKz
H9L0Qe0QdWeseJlsilPpF+52Fq8ZGzuN8Nf2TiknyYDEeS79mCby7SwBlmHSQBe7HSh7l149CWQ3
iatuc+IYonk8G59z32e73axEIpKZkdMYAnTlD0JXJVeAdRSvJTSlXp9GjbFQXqDFiSbSoA8jhS1R
x+ftzj/8G2IE7pRaXCPsQeJ5LcaolrObvjLejlywmoxxcnwJhii9O4iEX1vPyG7Xg6LNeXZpIR+R
AU214t2VYz7S/+EGl4bY/YRdxNuRvispYoDoYyLGmqy2YJ0ooKiwrqfeVHBRW53aLnypR6KzuG/J
1l5AdW3wKqL4jnRQA06wWRClnIaNmkiBhWkY65pf2FUTeeh9VgDwEvZdNDDAfVC/MJMxRJiwfkRa
5q4saeLMKfkFe3B87LJRPHs99FM27tf/6OHXZIbmOdBDrqln8oQx4/VO4P4NRnQZy0rtqYCB5uAY
VAz+6EuCu2vZnwPoeCJ98LevF15BeP7XYefycqVJDGeUiQm4bLJMk5yAK1bNmvHXNKCrVsJZQT91
jJDiOgUBr22PDy3r4MiURem4CFRrEcbJzyLxKOazpFIqhz+ic2o1MIoi9KO4uhEWJ7BxDs5o/nZE
ckI=
=0rmk
-----END PGP SIGNATURE-----

--------------LtYdBgNLup5rLDUU0qOYNau8--
