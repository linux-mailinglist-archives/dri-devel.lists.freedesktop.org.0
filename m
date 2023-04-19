Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E06E7ED2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 17:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E1010EA08;
	Wed, 19 Apr 2023 15:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB13710E9F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:47:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 90C79219A7;
 Wed, 19 Apr 2023 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681919219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzg0yyEK/G+AHP6c27ETXi5WurpAVzxvxrhky/Hvm6Y=;
 b=pjiogoJSl1wJlxjqn+EnOwbhAEMumAbx+Q5mfAgc0sMD7Ad8eUs6xufNy1iZfei3bggmM5
 pv2THX9AmeYDJbO2uPiB9otkQBCzkyyHNmDocD/L0xXEkmaCKeR/mMXOOJlfIYpJlnKrzA
 kmV872//Ckc2mWaGHnlSVDirmk6IUgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681919219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzg0yyEK/G+AHP6c27ETXi5WurpAVzxvxrhky/Hvm6Y=;
 b=/RXcW+rhFPsbT0VT+hakdNG16nxX6DgUH/bTloVMNEOCCuCV+U0p4jojGH1giORKLdGdBf
 wGNldvvkSSvzDUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 510F41390E;
 Wed, 19 Apr 2023 15:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z72tEvMMQGQSHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Apr 2023 15:46:59 +0000
Message-ID: <59dff860-9d1f-ec66-cd87-28693aa1fad2@suse.de>
Date: Wed, 19 Apr 2023 17:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <15330273260@189.cn>
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
 <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
 <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aUupdK3iiU9kA09uMon7zmMw"
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Li Yi <liyi@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aUupdK3iiU9kA09uMon7zmMw
Content-Type: multipart/mixed; boundary="------------vsDmT30ohTb5iq0hp9vs5VPf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <15330273260@189.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Message-ID: <59dff860-9d1f-ec66-cd87-28693aa1fad2@suse.de>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
 <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
 <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
In-Reply-To: <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>

--------------vsDmT30ohTb5iq0hp9vs5VPf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDQuMjMgdW0gMTc6MDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUdWUsIDE4IEFwciAyMDIzIGF0IDIwOjE2LCBTdWkgSmluZ2ZlbmcgPDE1MzMwMjczMjYw
QDE4OS5jbj4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gT24gMjAyMy80LzE5IDAxOjUy
LCBTdWkgSmluZ2Zlbmcgd3JvdGU6DQo+Pj4gSGksDQo+Pj4NCj4+PiBPbiAyMDIzLzQvMTgg
MTY6MzIsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgQXByIDE3LCAyMDIz
IGF0IDA3OjMyOjE5UE0gKzA4MDAsIFN1aSBKaW5nZmVuZyB3cm90ZToNCj4+Pj4+IFRoZSBm
YmRldiB0ZXN0IG9mIElHVCBtYXkgd3JpdGUgYWZ0ZXIgRU9GLCB3aGljaCBsZWFkIHRvIG91
dC1vZi1ib3VuZA0KPj4+Pj4gYWNjZXNzIGZvciB0aGUgZHJtIGRyaXZlcnMgdXNpbmcgZmJk
ZXYtZ2VuZXJpYy4gRm9yIGV4YW1wbGUsIG9uIGEgeDg2DQo+Pj4+PiArIGFzcGVlZCBibWMg
Y2FyZCBwbGF0Zm9ybSwgd2l0aCBhIDE2ODB4MTA1MCByZXNvbHV0aW9uIGRpc3BsYXksDQo+
Pj4+PiBydW5uaW5nDQo+Pj4+PiBmYmRldiB0ZXN0IGlmIElHVCB3aWxsIGNhdXNlIHRoZSBs
aW51eCBrZXJuZWwgaGFuZyB3aXRoIHRoZSBmb2xsb3dpbmcNCj4+Pj4+IGNhbGwgdHJhY2U6
DQo+Pj4+Pg0KPj4+Pj4gICAgIE9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkNCj4+
Pj4+ICAgICBbSUdUXSBmYmRldjogc3RhcnRpbmcgc3VidGVzdCBlb2YNCj4+Pj4+ICAgICBX
b3JrcXVldWU6IGV2ZW50cyBkcm1fZmJfaGVscGVyX2RhbWFnZV93b3JrIFtkcm1fa21zX2hl
bHBlcl0NCj4+Pj4+ICAgICBbSUdUXSBmYmRldjogc3RhcnRpbmcgc3VidGVzdCBudWxscHRy
DQo+Pj4+Pg0KPj4+Pj4gICAgIFJJUDogMDAxMDptZW1jcHlfZXJtcysweGEvMHgyMA0KPj4+
Pj4gICAgIFJTUDogMDAxODpmZmZmYTE3ZDQwMTY3ZDk4IEVGTEFHUzogMDAwMTAyNDYNCj4+
Pj4+ICAgICBSQVg6IGZmZmZhMTdkNGViN2ZhODAgUkJYOiBmZmZmYTE3ZDQwZTBhYTgwIFJD
WDogMDAwMDAwMDAwMDAwMTRjMA0KPj4+Pj4gICAgIFJEWDogMDAwMDAwMDAwMDAwMWE0MCBS
U0k6IGZmZmZhMTdkNDBlMGIwMDAgUkRJOiBmZmZmYTE3ZDRlYjgwMDAwDQo+Pj4+PiAgICAg
UkJQOiBmZmZmYTE3ZDQwMTY3ZTIwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IGZmZmY4
OTUyMmVjZmY4YzANCj4+Pj4+ICAgICBSMTA6IGZmZmZhMTdkNGU0YzUwMDAgUjExOiAwMDAw
MDAwMDAwMDAwMDAwIFIxMjogZmZmZmExN2Q0ZWI3ZmE4MA0KPj4+Pj4gICAgIFIxMzogMDAw
MDAwMDAwMDAwMWE0MCBSMTQ6IDAwMDAwMDAwMDAwMDA0MWEgUjE1OiBmZmZmYTE3ZDQwMTY3
ZTMwDQo+Pj4+PiAgICAgRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4OTUy
NTczODAwMDAoMDAwMCkNCj4+Pj4+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4+Pj4+ICAg
ICBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+
Pj4+PiAgICAgQ1IyOiBmZmZmYTE3ZDQwZTBiMDAwIENSMzogMDAwMDAwMDFlYWVjYTAwNiBD
UjQ6IDAwMDAwMDAwMDAxNzA2ZTANCj4+Pj4+ICAgICBDYWxsIFRyYWNlOg0KPj4+Pj4gICAg
ICA8VEFTSz4NCj4+Pj4+ICAgICAgPyBkcm1fZmJkZXZfZ2VuZXJpY19oZWxwZXJfZmJfZGly
dHkrMHgyMDcvMHgzMzAgW2RybV9rbXNfaGVscGVyXQ0KPj4+Pj4gICAgICBkcm1fZmJfaGVs
cGVyX2RhbWFnZV93b3JrKzB4OGYvMHgxNzAgW2RybV9rbXNfaGVscGVyXQ0KPj4+Pj4gICAg
ICBwcm9jZXNzX29uZV93b3JrKzB4MjFmLzB4NDMwDQo+Pj4+PiAgICAgIHdvcmtlcl90aHJl
YWQrMHg0ZS8weDNjMA0KPj4+Pj4gICAgICA/IF9fcGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8w
eDEwDQo+Pj4+PiAgICAgIGt0aHJlYWQrMHhmNC8weDEyMA0KPj4+Pj4gICAgICA/IF9fcGZ4
X2t0aHJlYWQrMHgxMC8weDEwDQo+Pj4+PiAgICAgIHJldF9mcm9tX2ZvcmsrMHgyYy8weDUw
DQo+Pj4+PiAgICAgIDwvVEFTSz4NCj4+Pj4+ICAgICBDUjI6IGZmZmZhMTdkNDBlMGIwMDAN
Cj4+Pj4+ICAgICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4+Pj4+
DQo+Pj4+PiBUaGUgZGlyZWN0IHJlYXNvbiBpcyB0aGF0IGRhbWFnZSByZWN0YW5nZSBjb21w
dXRlZCBieQ0KPj4+Pj4gZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9fY2xpcCgpIGRv
ZXMgbm90IGd1YXJhbnRlZWQgdG8gYmUNCj4+Pj4+IGluLWJvdW5kLg0KPj4+Pj4gSXQgaXMg
YWxyZWFkeSByZXN1bHRzIGluIHdvcmthcm91bmQgY29kZSBwb3B1bGF0ZSB0byBlbHNld2hl
cmUuIEFub3RoZXINCj4+Pj4+IHJlYXNvbiBpcyB0aGF0IGV4cG9zaW5nIGEgbGFyZ2VyIGJ1
ZmZlciBzaXplIHRoYW4gdGhlIGFjdHVhbCBuZWVkZWQNCj4+Pj4+IGhlbHANCj4+Pj4+IHRv
IHRyaWdnZXIgdGhpcyBidWcgaW50cmluc2ljIGluIGRybV9mYl9oZWxwZXJfbWVtb3J5X3Jh
bmdlX3RvX2NsaXAoKS4NCj4+Pj4+DQo+Pj4+PiBPdGhlcnMgZmJkZXYgZW11bGF0aW9uIHNv
bHV0aW9ucyB3cml0ZSB0byB0aGUgR0VNIGJ1ZmZlciBkaXJlY3RseSwgdGhleQ0KPj4+Pj4g
d29uJ3QgcmVwcm9kdWNlIHRoaXMgYnVnIGJlY2F1c2UgdGhlIC5mYl9kaXJ0eSBmdW5jdGlv
biBjYWxsYmFjayBkbyBub3QNCj4+Pj4+IGJlaW5nIGhvb2tlZCwgc28gbm8gY2hhbmNlIGlz
IGdpdmVuIHRvDQo+Pj4+PiBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlwKCkN
Cj4+Pj4+IHRvIGdlbmVyYXRlIGEgb3V0LW9mLWJvdW5kIHdoZW4gZHJtX2ZiX2hlbHBlcl9z
eXNfd3JpdGUoKSBpcyBjYWxsZWQuDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBwYXRjaCBicmVhayB0
aGUgdHJpZ2dlciBjb25kaXRpb24gb2YgdGhpcyBidWcgYnkgc2hyaW5raW5nIHRoZQ0KPj4+
Pj4gc2hhZG93DQo+Pj4+PiBidWZmZXIgc2l6ZSB0byBzaXplcy0+c3VyZmFjZV9oZWlnaHQg
KiBidWZmZXItPmZiLT5waXRjaGVzWzBdLg0KPj4+Pj4NCj4+Pj4+IEZpeGVzOiAnOGZiYzlh
ZjU1ZGUwICgiZHJtL2ZiZGV2LWdlbmVyaWM6IFNldCBzY3JlZW4gc2l6ZSB0byBzaXplIG9m
DQo+Pj4+PiBHRU0NCj4+Pj4+IGJ1ZmZlciIpJw0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+Pj4+PiAtLS0N
Cj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIHwgMiArLQ0K
Pj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZf
Z2VuZXJpYy5jDQo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5j
DQo+Pj4+PiBpbmRleCA4ZTUxNDhiZjQwYmIuLmIwNTdjZmJiYTkzOCAxMDA2NDQNCj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+Pj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+Pj4gQEAgLTk0LDcg
Kzk0LDcgQEAgc3RhdGljIGludA0KPj4+Pj4gZHJtX2ZiZGV2X2dlbmVyaWNfaGVscGVyX2Zi
X3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsDQo+Pj4+PiAgICAgICAg
ZmJfaGVscGVyLT5idWZmZXIgPSBidWZmZXI7DQo+Pj4+PiAgICAgICAgZmJfaGVscGVyLT5m
YiA9IGJ1ZmZlci0+ZmI7DQo+Pj4+PiAgICAtICAgIHNjcmVlbl9zaXplID0gYnVmZmVyLT5n
ZW0tPnNpemU7DQo+Pj4+PiArICAgIHNjcmVlbl9zaXplID0gc2l6ZXMtPnN1cmZhY2VfaGVp
Z2h0ICogYnVmZmVyLT5mYi0+cGl0Y2hlc1swXTsNCj4+Pj4gU28gSSByZWFkIGNvcmUgc29t
ZSBtb3JlIGFuZCBzdHVtYmxlZCBvdmVyIGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oKS4N
Cj4+Pj4gV2hpY2ggaGFzIGFsbCB0aGUgY29kZSBhbmQgY29tbWVudHMgYWJvdXQgdGhpcywg
aW5jbHVkaW5nIGxpbWl0aW5nLg0KPj4+Pg0KPj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNs
ZWFyZXIgaWYgd2UgZml4IHRoZSBpc3N1ZSB0aGVyZSwgaW5zdGVhZCBvZg0KPj4+PiBwYXNz
aW5nDQo+Pj4+IGxpbWl0cyBhcm91bmQgaW4gb2JzY3VyZSBwbGFjZXMgdGhhdCB0aGVuIGFn
YWluIGdldCBicm9rZW4/DQo+Pj4NCj4+PiBObywgaXQgaXMgbW9yZSBvYnNjdXJlIGRvaW5n
IHRoYXQgd2F5Li4uDQo+Pj4NCj4+Pg0KPj4+IEFzIHRoZSBzaXplIG9mIHRoZSBzaGFkb3cg
c2NyZWVuIGJ1ZmZlciB3aWxsIGJlIGV4cG9zZWQgdG8gdXNlcnNwYWNlLg0KPj4+DQo+Pj4g
VGhlIHNpemUgJ2hlbHBlci0+ZmItPmhlaWdodCAqIGhlbHBlci0+ZmItPnBpdGNoZXNbMF0n
IGlzIGENCj4+PiBleGFjdGx5KGJlc3QpIGZpdCwNCj4+Pg0KPj4+IFlvdSBhcmUgZ3VhcmFu
dGVlZCB0byB3YXN0ZSBhdCBsZWFzZSBvbmUgYnl0ZSBieSBpbmNyZWFzaW5nIG9uZSBieXRl
LA0KPj4+DQo+Pj4gYW5kIGNhbiBub3Qgc3RvcmUgYWxsIHBpeGVscyBieSBkZWNyZWFzaW5n
IG9uZSBieXRlIChJbiB0aGUgY2FzZSB3aGVyZQ0KPj4+IGBoZWxwZXItPmZiLT5waXRjaGVz
WzBdID0gaGVscGVyLT5mYi0+d2lkdGggKiA0YCkuDQo+Pj4NCj4+PiBJdCBpbXBsaWNpdGx5
IHRlbGwgdGhlIHVzZXJzcGFjZSBkbyBub3QgZ28gYmV5b25kIHRoYXQgYm91bmRhcnkuDQo+
Pj4NCj4+PiBhbHRob3VnaCB1c2Vyc3BhY2UgcHJvZ3JhbSBjYW4gc3RpbGwgY2hvb3NlIHRv
IHdyaXRlICBhZnRlciBFT0YsDQo+Pj4NCj4+PiBCdXQgaXQgaXMgZm9yIHRlc3QgcHVycG9z
ZSwgdG8gdGVzdCB0aGUga2VybmVsIGlmIGl0IGNhbiByZXR1cm4gYQ0KPj4+IC1FRkJJRyBv
ciBub3QuDQo+Pj4NCj4+Pj4gVGhlIHRoaW5nIGlzLA0KPj4+PiBUaG9tYXMgYm90aCBhdXRo
b3JlZCB0aGUgbGltaXQgY2hlY2tzIGluIGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oKSBh
bmQNCj4+Pj4gdGhlIHBhdGNoIHdoaWNoIGJyb2tlbiB0aGVtIGFnYWluLCBzbyBjbGVhcmx5
IHRoaXMgaXNuJ3QgdmVyeQ0KPj4+PiBvYnZpb3VzLiBJJ20NCj4+Pj4gdGhpbmtpbmcgb2Yg
c29tZXRoaW5nIGxpa2UgdGhpczoNCj4+Pj4NCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jDQo+Pj4+IGluZGV4IGVmNGViOGIxMjc2Ni4uNzI2ZGFiNjdjMzU5
IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4gQEAgLTY5
NywxMCArNjk3LDcgQEAgdm9pZCBkcm1fZmJfaGVscGVyX2RlZmVycmVkX2lvKHN0cnVjdCBm
Yl9pbmZvDQo+Pj4+ICppbmZvLCBzdHJ1Y3QgbGlzdF9oZWFkICpwYWdlcmVmbGkNCj4+Pj4g
ICAgICAgICAqIG9mIHRoZSBzY3JlZW4gYW5kIGFjY291bnQgZm9yIG5vbi1leGlzdGluZyBz
Y2FubGluZXMuIEhlbmNlLA0KPj4+PiAgICAgICAgICoga2VlcCB0aGUgY292ZXJlZCBtZW1v
cnkgYXJlYSB3aXRoaW4gdGhlIHNjcmVlbiBidWZmZXIuDQo+Pj4+ICAgICAgICAgKi8NCj4+
Pj4gLSAgICBpZiAoaW5mby0+c2NyZWVuX3NpemUpDQo+Pj4+IC0gICAgICAgIHRvdGFsX3Np
emUgPSBpbmZvLT5zY3JlZW5fc2l6ZTsNCj4+Pj4gLSAgICBlbHNlDQo+Pj4+IC0gICAgICAg
IHRvdGFsX3NpemUgPSBpbmZvLT5maXguc21lbV9sZW47DQo+Pj4+ICsgICAgdG90YWxfc2l6
ZSA9IGhlbHBlci0+ZmItPmhlaWdodCAqIGhlbHBlci0+ZmItPnBpdGNoZXNbMF07DQo+Pj4N
Cj4+PiBUaGlzIGlzIGp1c3QgdG8gbWl0aWdhdGUgdGhlIG1pc3Rha2VzIGFscmVhZHkgaGFz
IGJlZW4gbWFkZSwNCj4+Pg0KPj4+IGJlY2F1c2UgaXQgIGRvIG5vdCBkbyBhIGdvb2Qgc3Bs
aXR0aW5nIGJldHdlZW4gdGhlICpjbGlwKiBwYXJ0IGFuZCB0aGUNCj4+PiAqZGFtYWdlIHVw
ZGF0ZSogcGFydC4NCj4+Pg0KPj4+IEFuIGlkZWFsIGNsaXBwaW5nIGRvIG5vdCBvYnNjdXJl
IGl0cyB1cGRhdGluZyBiYWNrZW5kIHdpdGggYQ0KPj4+IG91dC1vZi1ib3VuZCBkYW1hZ2Ug
cmVjdGFuZ2xlLg0KPj4+DQo+Pj4gV2h5IGRpZCB0aGUgZHJtX2ZiX2hlbHBlcl9tZW1vcnlf
cmFuZ2VfdG9fY2xpcCgpIGNhbiBub3QgZG8gYSBnb29kIGpvYg0KPj4+IGluIGFsbCBjYXNl
DQo+Pj4NCj4+PiB0byBwYXNzIGl0cyBiYWNrZW5kIGEgYWx3YXlzIG1lYW5pbmdmdWwgZGFt
YWdlIHJlY3QgPw0KPj4+DQo+Pj4+ICAgICAgICBtYXhfb2ZmID0gbWluKG1heF9vZmYsIHRv
dGFsX3NpemUpOw0KPj4+PiAgICAgICAgICBpZiAobWluX29mZiA8IG1heF9vZmYpIHsNCj4+
Pj4NCj4+Pj4NCj4+Pj4gSSB0aGluayB0aGF0IHdvdWxkIG1ha2UgaXQgdXRtb3N0IGNsZWFy
IG9uIHdoYXQgd2UncmUgZG9pbmcgYW5kIHdoeS4NCj4+Pj4gT3RoZXJ3aXNlIHdlJ3JlIGp1
c3QgZ29pbmcgdG8gcmUtY3JlYXRlIHRoZSBzYW1lIGJ1ZyBhZ2FpbiwgbGlrZSB3ZSd2ZQ0K
Pj4+PiBkb25lIGFscmVhZHkgOi0pDQo+Pj4NCj4+PiBObywgd2UgY3JlYXRlIG5vIGJ1Z3Ms
IHdlIGZpeCBvbmUuDQo+Pj4NCj4+PiBUaGFua3MuDQo+Pj4NCj4+IEJ1dCBob25lc3RseSBJ
IGRvIG5vdCBoYXZlIHN0cm9uZyBmZWVsIHRvd2FyZCB0aGlzLCBJIGp1c3QgdHlwZSB3aGF0
IEknbQ0KPj4gdW5kZXJzdGFuZCB3aXRob3V0IHNlZWluZyB5b3UgcmVzZW5kIGEgVjMuDQo+
Pg0KPj4gSXQncyBPSyBpbiBvdmVyYWxsLCAgSSB3aWxsIGhlbHAgdG8gdGVzdCB0aGlzIHRv
bW9ycm93LiAgOi0pDQo+IA0KPiBBcG9sb2dpZXMgZm9yIG1ha2luZyB5b3UganVtcCBhcm91
bmQgYWxsIHRoZSB0aW1lIGFuZCBkb2luZyBkaWZmZXJlbnQNCj4gdmVyc2lvbnMgb2YgdGhl
IHNhbWUgYnVnZml4IDotLw0KPiANCj4gSSB0aGluayB0aGlzIG9uZSBoZXJlIGlzIG9rIHRv
IG1lcmdlLCBJIGp1c3QgdGhvdWdodCB3aGVuIGxvb2tpbmcgYXQNCj4gdGhlIGhpc3Rvcnkg
dGhhdCB3ZSByZXZlcnQgdGhlIGV4YWN0IHBhdGNoIHdpdGhvdXQgYW55IG90aGVyIGNoYW5n
ZXMNCj4gb3IgY29tbWVudHMsIGFuZCB1c3VhbGx5IHRoYXQgbWVhbnMgc29tZW9uZSB3aWxs
IGNvbWUgdXAgd2l0aCB0aGUgc2FtZQ0KPiBjbGVhbnVwIGlkZWEgYWdhaW4sIGFuZCB0aGVu
IHdlJ2xsIGhhdmUgYSBidWcgYWdhaW4uIFNvIG1heWJlIGENCj4gY29tbWVudCBvciBhIFdB
Uk5fT04gb3Igc29tZXRoaW5nIGVsc2Ugd291bGQgYmUgZ29vZC4NCj4gDQo+IEkgZ3Vlc3Mg
d2UgY291bGQgYWxzbyBkbyB5b3VyIHBhdGNoLCBidXQgcHV0IGEgV0FSTl9PTiB0aGF0IHRo
ZQ0KPiBjb21wdXRlZCB0b3RhbF9zaXplIGlzIG5ldmVyIGJpZ2dlciB0aGFuIHRoZSBkcm1f
ZmIgc2l6ZSBpbnRvDQo+IGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oKT8gVGhhdCB3b3Vs
ZCBhbHNvIG1ha2Ugc3VyZSB0aGF0IHRoaXMgYnVnDQo+IGRvZXNuJ3QgZ2V0IHJlc3VycmVj
dGVkIGFnYWluLg0KDQpXZSdkIGhhdmUgdG8gcHV0IHRoaXMgdGVzdCBpbnRvIGRybV9mYmRl
dl9nZW5lcmljLmMuIE90aGVyd2lzZSB3ZSdsbCANCmJyZWFrIGk5MTUsIHdoaWNoIGFsc28g
dXNlcyBkZWZlcnJlZCBJL08sIGJ1dCB3aXRob3V0IHNoYWRvdyBidWZmZXJpbmcuLiANCk1h
eWJlIHRlc3QgaW4gZHJtX2ZiZGV2X2dlbmVyaWNfaGVscGVyX2ZiX2RpcnR5KCkgaWYgdGhl
IGNsaXAgcmVjdGFuZ2xlIA0KZXh0ZW5kcyB0aGUgZnJhbWVidWZmZXIgc2l6ZS4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtRGFuaWVsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdl
cm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBC
b3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------vsDmT30ohTb5iq0hp9vs5VPf--

--------------aUupdK3iiU9kA09uMon7zmMw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRADPIFAwAAAAAACgkQlh/E3EQov+BX
FA//RF5y/sKwWkuZ/6VuWhXxXl4zPjXjjHi7Gnef3Bj3b35r/cpo8cYZkG2rbq/i34gQ8kAtFCmu
rBzteOh913WXkkuXcH4YxjjYMcG1TU5pn+7yne+4eL+P74ZFqsgWqLLpw1q5sMjhdYuWMEtulZFo
QRrVe8jZTbsUPXnIhgooZVN+oG8F4Y2CzdfhHqePKmC2Pzij9kaNp2CIL9GDWcNPAZQVzGis/Wx7
IVN6JYHx3yxS5xmBSOyPB8V/lCFGRKgWLg10VOgAmoLPDOPpKrgcELhzdZaZmr6ycnn83viFY8/E
IRBwihWIxPkr8jOwBkT2EA42MnMgNvrHlKPHjIkIUAkTXu5yrR7xMXuUkwSIt3RUCjMS8CxS6c6I
QMjntAqVmVwGq8LRXot4gLK1ddgN0pgVOqggxppshvB0V4MPMFReKFcs7e8EEJKytiXmnui/TsOu
DoSBJOar1+p7xqeuSAkhW5sI5p1SbjirSCJkc99b7azXxLXh36dcKzuTzpvJdbJ1amiArt9BHpMk
0E2cVUyzLccDS2HGzKWC4Y7wzqN9MIU4THXTwianPBVENvgQPF/q+FdDFwucvw3jpUmIXu0sYHal
M5xiU8EGfGp/AMizqfQfHqwcwrB+A/TmqaFC36eVYr5ckoshqm1F8eVlQzjVziHsKNKUFvtZEJHx
o3I=
=wAhQ
-----END PGP SIGNATURE-----

--------------aUupdK3iiU9kA09uMon7zmMw--
