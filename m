Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3D7919AD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B083310E36A;
	Mon,  4 Sep 2023 14:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A116310E369
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:29:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36E182183F;
 Mon,  4 Sep 2023 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693837780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+ZX2D1nYYs8d1Fi/6ftBxZaoSExhC7KInG0ZWeXJSw=;
 b=dM9k1qdk6rt5j06lIvQOgDQr8i7TP4XONm0/DMOpQaOnSdt58puBSJ3iE3FMCT3wkbNiHs
 77R0MgSUe0LmXbwleZPyMf6MBwe7efJzTDjurTUbU9q12UvBTTvSeUEAN0z9VKfR03FPQv
 4Gb+bvko1qSfmFWIcMh8omOdQ1KeCL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693837780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+ZX2D1nYYs8d1Fi/6ftBxZaoSExhC7KInG0ZWeXJSw=;
 b=vD0MXxxZwjlbnR5QY3bPpzKl9fB7RO5O5BmehCNYhkoJqLtMBRqwDnl4bp1xuyZWwcJKX+
 gItEoQ6IeWQGo2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FF6013425;
 Mon,  4 Sep 2023 14:29:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NzgcA9Tp9WTcLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Sep 2023 14:29:40 +0000
Message-ID: <9b232cab-057c-bb42-48cb-f83da3f0e938@suse.de>
Date: Mon, 4 Sep 2023 16:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20230809192514.158062-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230809192514.158062-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M0MhSPfMZjS5ugaoziaFhA0j"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M0MhSPfMZjS5ugaoziaFhA0j
Content-Type: multipart/mixed; boundary="------------cDITneQMJyNwpaPZ7joHQJh2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Message-ID: <9b232cab-057c-bb42-48cb-f83da3f0e938@suse.de>
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
References: <20230809192514.158062-1-jfalempe@redhat.com>
In-Reply-To: <20230809192514.158062-1-jfalempe@redhat.com>

--------------cDITneQMJyNwpaPZ7joHQJh2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9jZWx5biwNCg0KdGhhbmtzIGZvciBtb3ZpbmcgdGhpcyBlZmZvcnQgZm9yd2FyZC4g
SXQncyBtdWNoIGFwcHJlY2lhdGVkLiBJIGxvb2tlZCANCnRocm91Z2ggdGhlIHBhdGNoZXMg
YW5kIHRyaWVkIHRoZSBwYXRjaHNldCBvbiBteSB0ZXN0IG1hY2hpbmUuDQoNCkFtIDA5LjA4
LjIzIHVtIDIxOjE3IHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBUaGlzIGludHJvZHVj
ZXMgYSBuZXcgZHJtIHBhbmljIGhhbmRsZXIsIHdoaWNoIGRpc3BsYXlzIGEgbWVzc2FnZSB3
aGVuIGEgcGFuaWMgb2NjdXJzLg0KPiBTbyB3aGVuIGZiY29uIGlzIGRpc2FibGVkLCB5b3Ug
Y2FuIHN0aWxsIHNlZSBhIGtlcm5lbCBwYW5pYy4NCj4gDQo+IFRoaXMgaXMgb25lIG9mIHRo
ZSBtaXNzaW5nIGZlYXR1cmUsIHdoZW4gZGlzYWJsaW5nIFZUL2ZiY29uIGluIHRoZSBrZXJu
ZWw6DQo+IGh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9saW51eC9jb21tZW50cy8xMGVjY3Y5
L2NvbmZpZ192dG5faW5fMjAyMy8NCj4gRmJjb24gY2FuIGJlIHJlcGxhY2VkIGJ5IGEgdXNl
cnNwYWNlIGttcyBjb25zb2xlLCBidXQgdGhlIHBhbmljIHNjcmVlbiBtdXN0IGJlIGRvbmUg
aW4gdGhlIGtlcm5lbC4NCj4gDQo+IFRoaXMgaXMgYSBwcm9vZiBvZiBjb25jZXB0LCBhbmQg
d29ya3Mgb25seSB3aXRoIHNpbXBsZWRybSwgdXNpbmcgdGhlIGRybV9jbGllbnQgQVBJLg0K
PiBUaGlzIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIGRybSBjbGllbnQgQVBJLCBhbGxvY2F0
ZXMgbmV3IGZyYW1lYnVmZmVycywgYW5kIGxvb2tzIGEgYml0IHRvbyBjb21wbGV4IHRvIHJ1
biBpbiBhIHBhbmljIGhhbmRsZXIuDQo+IE1heWJlIHdlIHNob3VsZCBhZGQgYW4gQVBJIHRv
ICJzdGVhbCIgdGhlIGN1cnJlbnQgZnJhbWVidWZmZXIgaW5zdGVhZCwgYmVjYXVzZSBpbiBh
IHBhbmljIGhhbmRsZXIgdXNlci1zcGFjZSBpcyBhbHJlYWR5IHN0b3BwZWQuDQoNClllcywg
dGhhdCB3YXMgYWxzbyBteSBmaXJzdCB0aG91Z2h0LiBJJ2QgdXNlIGFuIGV4dHJhIGNhbGxi
YWNrIGluIHN0cnVjdCANCmRybV9kcml2ZXIsIGxpa2UgdGhpczoNCg0Kc3RydWN0IGRybV9k
cml2ZXIgew0KICAgaW50ICgqZ2V0X3NjYW5vdXRfYnVmZmVyKSgvKiByZXR1cm4gSFcgc2Nh
bm91dCAqLykNCn0NCg0KVGhlIHNjYW5vdXQgYnVmZmVyIHdvdWxkIGJlIGRlc2NyaWJlZCBi
eSBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIGFkZHJlc3MsIA0KcmVzb2x1dGlvbiwgY29sb3Ig
Zm9ybWF0IGFuZCBzY2FubGluZSBwaXRjaC4gQW5kIHRoYXQncyB3aGF0IHRoZSBwYW5pYyAN
CmhhbmRsZXIgdXNlcy4NCg0KQW55IGRyaXZlciBpbXBsZW1lbnRpbmcgdGhpcyBpbnRlcmZh
Y2Ugd291bGQgc3VwcG9ydCB0aGUgcGFuaWMgaGFuZGxlci4gDQpJZiB0aGVyZSdzIGEgY29u
Y3VycmVudCBkaXNwbGF5IHVwZGF0ZSwgd2UnZCBoYXZlIHRvIHN5bmNocm9uaXplLg0KDQo+
IA0KPiBUbyB0ZXN0IGl0LCBtYWtlIHN1cmUgeW91J3JlIHVzaW5nIHRoZSBzaW1wbGVkcm0g
ZHJpdmVyLCBhbmQgdHJpZ2dlciBhIHBhbmljOg0KPiBlY2hvIGMgPiAvcHJvYy9zeXNycS10
cmlnZ2VyDQoNClRoZSBwZW5ndWluIHdhcyBjdXRlLiA6KQ0KDQpUaGlzIG9ubHkgd29ya3Mg
aWYgdGhlIGRpc3BsYXkgaXMgYWxyZWFkeSBydW5uaW5nLiBJIGhhZCB0byBzdGFydCBHbm9t
ZSANCnRvIHNldCBhIGRpc3BsYXkgbW9kZS4gVGhlbiBsZXQgdGhlIHBhbmljIGhhbmRsZXIg
dGFrZSBvdmVyIHRoZSBvdXRwdXQuDQoNCkJ1dCB3aXRoIHNpbXBsZWRybSwgd2UgY291bGQg
ZXZlbiBkaXNwbGF5IGEgbWVzc2FnZSB3aXRob3V0IGFuIG91dHB1dCwgDQphcyB0aGUgZnJh
bWVidWZmZXIgaXMgYWx3YXlzIHRoZXJlLg0KDQo+IA0KPiBUaGVyZSBpcyBvbmUgdGhpbmcg
SSBkb24ndCBrbm93IGhvdyB0byBkbywgaXMgdG8gdW5yZWdpc3RlciB0aGUgZHJtX3Bhbmlj
IHdoZW4gdGhlIGdyYXBoaWMgZHJpdmVyIGlzIHVubG9hZGVkLg0KPiBkcm1fY2xpZW50X3Jl
Z2lzdGVyKCkgc2F5cyBpdCB3aWxsIGF1dG9tYXRpY2FsbHkgdW5yZWdpc3RlciBvbiBkcml2
ZXIgdW5sb2FkLiBCdXQgdGhlbiBJIGRvbid0IGtub3cgaG93IHRvIHJlbW92ZSBpdCBmcm9t
IG15IGxpbmtlZCBsaXN0LCBhbmQgZnJlZSB0aGUgZHJtX2NsaWVudF9kZXYgc3RydWN0Lg0K
DQpVbnJlZ2lzdGVyaW5nIHdvdWxkbid0IGJlIG5lY2Vzc2FyeSB3aXRoIHRoaXMgcHJvcG9z
ZWQgDQpnZXRfc2Nhbm91dF9idWZmZXIuIEluIHRoZSBjYXNlIG9mIGEgcGFuaWMsIGp1c3Qg
cmVtYWluIHNpbGVudCBpZiANCnRoZXJlJ3Mgbm8gZHJpdmVyIHRoYXQgcHJvdmlkZXMgc3Vj
aCBhIGNhbGxiYWNrLg0KDQo+IA0KPiBUaGlzIGlzIGEgZmlyc3QgZHJhZnQsIHNvIGxldCBt
ZSBrbm93IHdoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0Lg0KDQpPbmUgdGhpbmcgdGhhdCB3
aWxsIG5lZWQgc2VyaW91cyB3b3JrIGlzIHRoZSByYXcgb3V0cHV0LiBUaGUgY3VycmVudCAN
CmJsaXR0aW5nIGZvciBYUkdCODg4OCBpcyByZWFsbHkganVzdCBhIHF1aWNrLWFuZC1kaXJ0
eSBoYWNrLg0KDQpJIHRoaW5rIHdlIHNob3VsZCB0cnkgdG8gcmV1c2UgZmJkZXYncyBibGl0
dGluZyBjb2RlLCBpZiBwb3NzaWJsZS4gVGhlIA0KZmJkZXYgY29yZSwgaGVscGVycyBhbmQg
Y29uc29sZSBjb21lIHdpdGggYWxsIHRoZSBmZWF0dXJlcyB3ZSBuZWVkLiBXZSANCnJlYWxs
eSBvbmx5IG5lZWQgdG8gbWFrZSB0aGVtIHdvcmsgd2l0aG91dCB0aGUgc3RydWN0IGZiX2lu
Zm8sIHdoaWNoIGlzIA0KYSBmdWxsIGZiZGV2IGRldmljZS4NCg0KSW4gc3RydWN0IGZiX29w
cywgdGhlcmUgYXJlIGNhbGxiYWNrcyBmb3IgbW9kaWZ5aW5nIHRoZSBmcmFtZWJ1ZmZlci4g
WzFdIA0KVGhleSBhcmUgdXNlZCBieSBmYmNvbiBmb2lyIGRyYXdpbmcuIEJ1dCB0aGV5IG9w
ZXJhdGUgb24gZmJfaW5mby4NCg0KRm9yIGEgd2hpbGUgSSd2ZSBiZWVuIHRoaW5raW5nIGFi
b3V0IHVzaW5nIHNvbWV0aGluZyBsaWtlIGEgZHJhd2FibGUgdG8gDQpwcm92aWRlIHNvbWUg
YWJzdHJhY3Rpb25zOg0KDQpzdHJ1Y3QgZHJhd2FibGUgew0KCS8qIHN0b3JlIGJ1ZmZlciBw
YXJhbWV0ZXJzIGhlcmUgKi8NCgkuLi4NCg0KCXN0cnVjdCBkcmF3YWJsZV9mdW5jcyAqZnVu
Y3M7DQp9Ow0KDQpzdHJ1Y3QgZHJhd2FibGVfZnVuY3Mgew0KCS8qIGhhdmUgZnVuY3Rpb24g
cG9pbnRlcnMgc2ltaWxhciB0byBzdHJ1Y3QgZmJfb3BzICovDQoJZmlsbF9yZWN0KCkNCglj
b3B5X2FyZWEoKQ0KCWltYWdlX2JsaXQoKQ0KfTsNCg0KV2UgY2Fubm90IHJld3JpdGUgYWxs
IHRoZSBleGlzdGluZyBmYmRldiBkcml2ZXJzLiBUbyBtYWtlIHRoaXMgd29yayB3aXRoIA0K
ZmJkZXYsIHdlJ2QgbmVlZCBhZGFwdGVyIGNvZGUgdGhhdCBjb252ZXJ0cyBmcm9tIGRyYXdh
YmxlIHRvIGZiX2luZm8gYW5kIA0KZm9yd2FyZHMgdG8gdGhlIGV4aXN0aW5nIGhlbHBlcnMg
aW4gZmJfb3BzLg0KDQpCdXQgZm9yIERSTSdzIHBhbmljIG91dHB1dCwgZHJhd2FibGVfZnVu
Y3Mgd291bGQgaGF2ZSB0byBwb2ludCB0byB0aGUgDQpzY2Fub3V0IGJ1ZmZlciBhbmQgY29t
cGF0aWJsZSBjYWxsYmFjayBmdW5jcywgZm9yIHdoaWNoIHdlIGhhdmUgDQppbXBsZW1lbnRh
dGlvbnMgaW4gZmJkZXYuDQoNCldlIG1pZ2h0IGJlIGFibGUgdG8gY3JlYXRlIGNvbnNvbGUt
bGlrZSBvdXRwdXQgdGhhdCBpcyBpbmRlcGVuZGVudCBmcm9tIA0KdGhlIGZiX2luZm8uIEhl
bmNlLCB3ZSBjb3VsZCBwb3NzaWJsZSByZXVzZSBhIGdvb2QgY2h1bmsgb2YgdGhlIGN1cnJl
bnQgDQpwYW5pYyBvdXRwdXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41LjEvc291cmNlL2luY2x1ZGUvbGlu
dXgvZmIuaCNMMjczDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IA0KPiANCj4gDQo+
IEpvY2VseW4gRmFsZW1wZSAoMik6DQo+ICAgIGRybS9wYW5pYzogQWRkIGEgZHJtIHBhbmlj
IGhhbmRsZXINCj4gICAgZHJtL3NpbXBsZWRybTogQWRkIGRybV9wYW5pYyBzdXBwb3J0DQo+
IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgIHwgIDExICsrDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHJ2LmMgICAgICAgIHwgICAzICsNCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3BhbmljLmMgICAgICB8IDI4NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAgIDIgKw0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9wYW5pYy5oICAgICAgICAgIHwgIDI2ICsrKw0KPiAgIDYgZmlsZXMg
Y2hhbmdlZCwgMzI5IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2RybV9wYW5pYy5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvZHJtL2RybV9wYW5pYy5oDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IDY5OTVlMmRlNjg5
MWM3MjRiZmViMmRiMzNkN2I4Nzc3NWY5MTNhZDENCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------cDITneQMJyNwpaPZ7joHQJh2--

--------------M0MhSPfMZjS5ugaoziaFhA0j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT16dMFAwAAAAAACgkQlh/E3EQov+Bk
zQ/8D65gq8TGiBhERqVXUB3hJ8vQEsgLtL/V5RYYi8/9jnsLhtFrkBu5T97cTdDMtBBU//E5RhI1
EdYabxdM6cAKXqQOOxW2tqayJ51InptL6yCQxLCc8F+BmLixcKoPXa51usb+LkLSNbqoNF92OYBw
qmjgViUAh8ksLbx+e6Qu2+F0tXNq8/ZwjV1fruu/IFyNiHkgoKCIxf/Kj9bARJXZ/puYLENtvydS
9p8fBRV713mJLxtwUhZG4cXg3BDlcO1k208vN4SO5ehFtQFlUHma/HGYn6o+D+gJJ94AAiMWlc+b
FA40NoQCoL8Q0XaiCXOdOfZiARIBcU6vLOvhjrIJWQ9SAzvVGymJ+PFE7mK0bK46qWm8leVzszvu
EG+e5fezoF8YyEaoBWQa3TSAR46sMmAYxJTgFDY2q+oYHl3Gl6MV/NY/FK9VGsuG/4quY/qM8/Ym
MjF0qizfS8svhuXPb71S9XTRN/MTBAynIuBwySCCn7LSF59Ij5A6TYHDXPKoMV4LmRP4seyLC4R1
bGENr82uUhF0GFFz5czSTLsG83SiXyO54nXEYN2XGedDmWgh1t4ZZCgCopx2YosSb6ZFsgF8ZO9l
FmTQG6RMhUwnHbWHnFz9mSmqBQks6I7YIaM+qHyyxnz1bZ/R7Wpl6wrKIkJFiOF76lOMbb6omqtx
3gg=
=O73E
-----END PGP SIGNATURE-----

--------------M0MhSPfMZjS5ugaoziaFhA0j--
