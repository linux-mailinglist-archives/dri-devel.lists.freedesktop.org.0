Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29A6160DF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 11:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA010E149;
	Wed,  2 Nov 2022 10:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B45110E149;
 Wed,  2 Nov 2022 10:33:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F080D336B1;
 Wed,  2 Nov 2022 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667385193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39AVSkEHI1J+0NxFici1XfnR3bd2AlgAeg7g921bvYs=;
 b=Cx2xiWMC5E11WkmY909rsos2svtnzjxSZkKuTFtXUFgr5/q5Xz2IM5g1+XgGiDXWLl3iN6
 j9vK8FYTQJj8c/fwCAVjGLZsRRl8/etR11oAGlj7oqfq0SZsvlm7Gqn7NqATYTdOX31lSm
 kEohXWWBhiXVhscLaSrUkGEyO7CmrEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667385193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39AVSkEHI1J+0NxFici1XfnR3bd2AlgAeg7g921bvYs=;
 b=VmKtdHzSvWZGkFNSUcLJzJsMZ9sTv9odj9s9+U4GRjt8StJaU5YRqyzyk25taSOPmszLei
 O0R9jIyTleysD+AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 733C813AE0;
 Wed,  2 Nov 2022 10:33:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pwAgG2hHYmPXUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Nov 2022 10:33:12 +0000
Message-ID: <0ca70b76-c24a-4fdb-cf0d-2647d37379df@suse.de>
Date: Wed, 2 Nov 2022 11:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-18-tzimmermann@suse.de>
 <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------580Yj573GGcKpjSl0DPBr0oc"
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------580Yj573GGcKpjSl0DPBr0oc
Content-Type: multipart/mixed; boundary="------------0mHlbG09Ag4oDeheVwguJWiS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
Message-ID: <0ca70b76-c24a-4fdb-cf0d-2647d37379df@suse.de>
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-18-tzimmermann@suse.de>
 <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
In-Reply-To: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>

--------------0mHlbG09Ag4oDeheVwguJWiS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMTEuMjIgdW0gMTA6MzIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDEwLzI0LzIyIDEzOjE5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEltcGxlbWVudCB0aGUgZmJkZXYncyByZWFkL3dyaXRlIGhlbHBlcnMgd2l0aCB0aGUg
c2FtZSBmdW5jdGlvbnMuIFVzZQ0KPj4gdGhlIGdlbmVyaWMgZmJkZXYncyBjb2RlIGFzIHRl
bXBsYXRlLiBDb252ZXJ0IGFsbCBkcml2ZXJzLg0KPj4NCj4+IERSTSdzIGZiIGhlbHBlcnMg
bXVzdCBpbXBsZW1lbnQgcmVndWxhciBJL08gZnVuY3Rpb25hbGl0eSBpbiBzdHJ1Y3QNCj4+
IGZiX29wcyBhbmQgcG9zc2libHkgcGVyZm9ybSBhIGRhbWFnZSB1cGRhdGUuIEhhbmRsZSBh
bGwgdGhpcyBpbiB0aGUNCj4+IHNhbWUgZnVuY3Rpb25zIGFuZCBjb252ZXJ0IGRyaXZlcnMu
IFRoZSBmdW5jdGlvbmFsaXR5IGhhcyBiZWVuIHVzZWQNCj4+IGFzIHBhcnQgb2YgdGhlIGdl
bmVyaWMgZmJkZXYgY29kZSBmb3Igc29tZSB0aW1lLiBUaGUgZHJpdmVycyBkb24ndA0KPj4g
c2V0IHN0cnVjdCBkcm1fZmJfaGVscGVyLmZiX2RpcnR5LCBzbyB0aGV5IHdpbGwgbm90IGJl
IGFmZmVjdGVkIGJ5DQo+PiBkYW1hZ2UgaGFuZGxpbmcuDQo+Pg0KPj4gRm9yIEkvTyBtZW1v
cnksIGZiIGhlbHBlcnMgbm93IHByb3ZpZGUgZHJtX2ZiX2hlbHBlcl9jZmJfcmVhZCgpIGFu
ZA0KPj4gZHJtX2ZiX2hlbHBlcl9jZmJfd3JpdGUoKS4gU2V2ZXJhbCBkcml2ZXJzIHJlcXVp
cmUgdGhlc2UuIFVudGlsIG5vdw0KPj4gdGVncmEgdXNlZCBJL08gcmVhZCBhbmQgd3JpdGUs
IGFsdGhvdWdoIHRoZSBtZW1vcnkgYnVmZmVyIGFwcGVhcnMgdG8NCj4+IGJlIGluIHN5c3Rl
bSBtZW1vcnkuIFNvIHVzZSBfc3lzXyBoZWxwZXJzIG5vdy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0K
PiANCj4gWy4uLl0NCj4gDQo+PiArc3RhdGljIHNzaXplX3QgX19kcm1fZmJfaGVscGVyX3dy
aXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLCBzaXpl
X3QgY291bnQsDQo+PiArCQkJCSAgICAgbG9mZl90ICpwcG9zLCBkcm1fZmJfaGVscGVyX3dy
aXRlX3NjcmVlbiB3cml0ZV9zY3JlZW4pDQo+PiArew0KPiANCj4gWy4uLl0NCj4gDQo+PiAr
CS8qDQo+PiArCSAqIENvcHkgdG8gZnJhbWVidWZmZXIgZXZlbiBpZiB3ZSBhbHJlYWR5IGxv
Z2dlZCBhbiBlcnJvci4gRW11bGF0ZXMNCj4+ICsJICogdGhlIGJlaGF2aW9yIG9mIHRoZSBv
cmlnaW5hbCBmYmRldiBpbXBsZW1lbnRhdGlvbi4NCj4+ICsJICovDQo+PiArCXJldCA9IHdy
aXRlX3NjcmVlbihpbmZvLCBidWYsIGNvdW50LCBwb3MpOw0KPj4gKwlpZiAocmV0IDwgMCkN
Cj4+ICsJCXJldHVybiByZXQ7IC8qIHJldHVybiBsYXN0IGVycm9yLCBpZiBhbnkgKi8NCj4+
ICsJZWxzZSBpZiAoIXJldCkNCj4+ICsJCXJldHVybiBlcnI7IC8qIHJldHVybiBwcmV2aW91
cyBlcnJvciwgaWYgYW55ICovDQo+PiArDQo+PiArCSpwcG9zICs9IHJldDsNCj4+ICsNCj4g
DQo+IFNob3VsZCAqcHBvcyBiZSBpbmNyZW1lbnRlZCBldmVuIGlmIHRoZSBwcmV2aW91cyBl
cnJvciBpcyByZXR1cm5lZD8NCg0KWWVzLiBJdCBlbXVsYXRlcyB0aGUgb3JpZ2luYWwgZmJk
ZXYgY29kZSBhdCBbMV0uIEZ1cnRoZXIgZG93biBpbiB0aGF0IA0KZnVuY3Rpb24sIHRoZSBw
b3NpdGlvbiBpcyBiZWluZyB1cGRhdGVkIGV2ZW4gaWYgYW4gZXJyb3Igb2NjdXJlZC4gV2Ug
DQpvbmx5IHJldHVybiB0aGUgaW5pdGlhbCBlcnJvciBpZiBubyBieXRlcyBnb3Qgd3JpdHRl
bi4NCg0KSXQgY291bGQgaGFwcGVuIHRoYXQgc29tZSB1c2Vyc3BhY2UgcHJvZ3JhbSBoaXRz
IHRvIGVycm9yLCBidXQgc3RpbGwgDQpyZWxpZXMgb24gdGhlIG91dHB1dCBhbmQgcG9zaXRp
b24gYmVpbmcgdXBkYXRlZC4gSUlSQyBJIGV2ZW4gYWRkZWQgDQp2YWxpZGF0aW9uIG9mIHRo
aXMgYmVoYXZpb3IgdG8gdGhlIElHVCBmYmRldiB0ZXN0cy4gIEkgYWdyZWUgdGhhdCB0aGlz
IA0KaXMgc29tZXdoYXQgYm9ndXMgYmVoYXZpb3IsIGJ1dCBjaGFuZ2luZyBpdCB3b3VsZCBj
aGFuZ2UgbG9uZy1zdGFuZGluZyANCnVzZXJzcGFjZSBzZW1hbnRpY3MuDQoNClsxXSANCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAuNi9zb3VyY2UvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibWVtLmMjTDgyNQ0KDQo+IA0KPiBUaGUgd3JpdGVfc2NyZWVu
KCkgc3VjY2VlZGVkIGFueXdheXMsIGV2ZW4gd2hlbiB0aGUgY291bnQgd3JpdHRlbiB3YXMN
Cj4gc21hbGxlciB0aGFuIHdoYXQgdGhlIGNhbGxlciBhc2tlZCBmb3IuDQo+IA0KPj4gICAv
KioNCj4+IC0gKiBkcm1fZmJfaGVscGVyX3N5c19yZWFkIC0gd3JhcHBlciBhcm91bmQgZmJf
c3lzX3JlYWQNCj4+ICsgKiBkcm1fZmJfaGVscGVyX3N5c19yZWFkIC0gSW1wbGVtZW50cyBz
dHJ1Y3QgJmZiX29wcy5mYl9yZWFkIGZvciBzeXN0ZW0gbWVtb3J5DQo+PiAgICAqIEBpbmZv
OiBmYl9pbmZvIHN0cnVjdCBwb2ludGVyDQo+PiAgICAqIEBidWY6IHVzZXJzcGFjZSBidWZm
ZXIgdG8gcmVhZCBmcm9tIGZyYW1lYnVmZmVyIG1lbW9yeQ0KPj4gICAgKiBAY291bnQ6IG51
bWJlciBvZiBieXRlcyB0byByZWFkIGZyb20gZnJhbWVidWZmZXIgbWVtb3J5DQo+PiAgICAq
IEBwcG9zOiByZWFkIG9mZnNldCB3aXRoaW4gZnJhbWVidWZmZXIgbWVtb3J5DQo+PiAgICAq
DQo+PiAtICogQSB3cmFwcGVyIGFyb3VuZCBmYl9zeXNfcmVhZCBpbXBsZW1lbnRlZCBieSBm
YmRldiBjb3JlDQo+PiArICogUmV0dXJuczoNCj4+ICsgKiBUaGUgbnVtYmVyIG9mIHJlYWQg
Ynl0ZXMgb24gc3VjY2Vzcywgb3IgYW4gZXJyb3IgY29kZSBvdGhlcndpc2UuDQo+PiAgICAq
Lw0KPiANCj4gVGhpcyBzZW50ZW5jZSBzb3VuZHMgYSBsaXR0bGUgYml0IG9mZiB0byBtZS4g
U2hvdWxkbid0IGJlICJudW1iZXIgb2YgYnl0ZXMgcmVhZCINCj4gaW5zdGVhZD8gSSdtIG5v
dCBhIG5hdGl2ZSBFbmdsaXNoIHNwZWFrZXIgdGhvdWdoLCBzbyBmZWVsIGZyZWUgdG8ganVz
dCBpZ25vcmUgbWUuDQoNCllvdSdyZSByaWdodC4NCg0KPiANCj4gWy4uLl0NCj4gDQo+PiAg
IA0KPj4gK3N0YXRpYyBzc2l6ZV90IGZiX3JlYWRfc2NyZWVuX2Jhc2Uoc3RydWN0IGZiX2lu
Zm8gKmluZm8sIGNoYXIgX191c2VyICpidWYsIHNpemVfdCBjb3VudCwNCj4+ICsJCQkJICAg
bG9mZl90IHBvcykNCj4+ICt7DQo+PiArCWNvbnN0IGNoYXIgX19pb21lbSAqc3JjID0gaW5m
by0+c2NyZWVuX2Jhc2UgKyBwb3M7DQo+PiArCXNpemVfdCBhbGxvY19zaXplID0gbWluX3Qo
c2l6ZV90LCBjb3VudCwgUEFHRV9TSVpFKTsNCj4+ICsJc3NpemVfdCByZXQgPSAwOw0KPj4g
KwlpbnQgZXJyID0gMDsNCj4gDQo+IERvIHlvdSByZWFsbHkgbmVlZCB0aGVzZSB0d28/IEFG
QUlLIHNzaXplX3QgaXMgYSBzaWduZWQgdHlwZQ0KDQpJIHRoaW5rIHNvLiBXZSdsbCBnbyB0
aHJvdWdoIHRoZSB3aGlsZSBsb29wIG11bHRpcGxlIHRpbWVzLiBJZiB3ZSBmYWlsIA0Kb24g
dGhlIGluaXRpYWwgaXRlcmF0aW9uLCB3ZSByZXR1cm4gdGhlIGVycm9yIGluIGVyci4gSWYg
d2UgZmFpbCBvbiBhbnkgDQpsYXRlciBpdGVyYXRpb24sIHdlIHJldHVybiB0aGUgbnVtYmVy
IG9mIHByb2Nlc3NlZCBieXRlcy4gIEhhdmluZyB0aGlzIA0KaW4gdHdvIHZhcmlhYmxlcyBz
aW1wbGlmaWVzIHRoZSBsb2dpYyBBRkFJQ1QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gc28geW91IGNhbiBqdXN0IHVzZSB0aGUgcmV0IHZhcmlhYmxlIHRvIHN0b3JlIGFuZCBy
ZXR1cm4gdGhlDQo+IGVycm5vIHZhbHVlLg0KPiANCj4gWy4uLl0NCj4gDQo+PiArc3RhdGlj
IHNzaXplX3QgZmJfd3JpdGVfc2NyZWVuX2Jhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIGNv
bnN0IGNoYXIgX191c2VyICpidWYsIHNpemVfdCBjb3VudCwNCj4+ICsJCQkJICAgIGxvZmZf
dCBwb3MpDQo+PiArew0KPj4gKwljaGFyIF9faW9tZW0gKmRzdCA9IGluZm8tPnNjcmVlbl9i
YXNlICsgcG9zOw0KPj4gKwlzaXplX3QgYWxsb2Nfc2l6ZSA9IG1pbl90KHNpemVfdCwgY291
bnQsIFBBR0VfU0laRSk7DQo+PiArCXNzaXplX3QgcmV0ID0gMDsNCj4+ICsJaW50IGVyciA9
IDA7DQo+IA0KPiBTYW1lIGhlcmUuDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------0mHlbG09Ag4oDeheVwguJWiS--

--------------580Yj573GGcKpjSl0DPBr0oc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNiR2gFAwAAAAAACgkQlh/E3EQov+Bj
MxAAp4wfwx+b/f1M/vv0NPDNSC9u3BJZBg47JuiNuprKGsOIBEeua7fb65cfh+LHqgna0CjJ9xSh
bxNVEMHqrEWsi84G6EpqeIoHlfMhRK83P5zAE/GXqpxpQVPmOGmRq8RHk3fRXB+NUjW/hp6m2vm1
4UKKcQr8pm1POl+FqlvBPgIwFcrilo9Xx8FytS+0e1cZhqf1Z3y2sXVzNUQYrdq9Dvz884Jz3wmL
17m5oRbTVBQke7h08jMRyneJkZgnhF8jBT33C5X+HVNvjgLKSOGQiQbdiMEHhTT/lLa248ypTC2x
ZtXQfyeTtEb/eGIInJXlE6gizVrOGJpGQb1jg3t1CoxJA0rXFHmHwVFLV+CA9pOtrMOYeE6ud9w+
iVYQbN/HLph6mIbYkZViGfFABNIr5u32ZJkR90aQWfSeLHgFJtON8p25LxLcUNQEkRe1X/pXaElE
TLKY2S7E/OKeTTWxhQCk+gF+ZqBcH7uX4oBm6aSfzF/a6wy9XvGRAPPs7vVvD+r7cb0Yj+GLB8Yx
aWhWFOYh+GZt5xkJ1H3UBQDOhJ237+4NpIzskMoLJPzl5EcSWVE4Nr39CfZTTFFISJsnHmAHt+Za
bpUEIgHrkfrtP8KsXztM5SXXwSHzICLZHsps/fyvC8MSODtD2hRENA1BtVPpYcGl0MHBtuKjLZWp
y4I=
=DprF
-----END PGP SIGNATURE-----

--------------580Yj573GGcKpjSl0DPBr0oc--
