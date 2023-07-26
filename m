Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF8763DBB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 19:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CEA10E073;
	Wed, 26 Jul 2023 17:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9A010E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 17:34:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8F3B1F385;
 Wed, 26 Jul 2023 17:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690392870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPeaM5RCt2kKxNokrRLD8Q5hQr3w4HW9atCJK3gluWc=;
 b=1UxT7nE4/kK4iNIz7HNnPR7aKJWZVYMdkb/e/1w8ux8eBWjmTeqCaiXXAFRUouInQJdLde
 AEiMpPWSNNj95GusDS8KRSrVVVC9ZxREcMc5ZIlHOm42+sSQvtsaw2IxCqVWRwwvNNkSfD
 fptiNUbQgWVNStq9RST++olQYOXlkrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690392870;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPeaM5RCt2kKxNokrRLD8Q5hQr3w4HW9atCJK3gluWc=;
 b=RYdPKqmOSORBO9hjEryKYiONpoXzU3RbuSejX4Vx2I78ZCGiYj3GOfi5urKb8BaPXekZgz
 mO0rD2/cdOURa9Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EF92139BD;
 Wed, 26 Jul 2023 17:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0ozVISZZwWTZZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jul 2023 17:34:30 +0000
Message-ID: <bfb0d72d-16a1-9eb6-2fd9-3bbd4237c014@suse.de>
Date: Wed, 26 Jul 2023 19:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/shmem-helper: Reset vma->vm_ops before calling
 dma_buf_mmap()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230724112610.60974-1-boris.brezillon@collabora.com>
 <77a41226-b671-1895-6182-457f7fee9bda@suse.de>
 <20230726095750.51b1e7e0@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230726095750.51b1e7e0@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------en6sbTSAwk4PuLVnv7qNNPVz"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Roman Stratiienko <roman.stratiienko@globallogic.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------en6sbTSAwk4PuLVnv7qNNPVz
Content-Type: multipart/mixed; boundary="------------C2IowLUitjNOkqvIkin0gWwy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org, Roman Stratiienko <roman.stratiienko@globallogic.com>
Message-ID: <bfb0d72d-16a1-9eb6-2fd9-3bbd4237c014@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Reset vma->vm_ops before calling
 dma_buf_mmap()
References: <20230724112610.60974-1-boris.brezillon@collabora.com>
 <77a41226-b671-1895-6182-457f7fee9bda@suse.de>
 <20230726095750.51b1e7e0@collabora.com>
In-Reply-To: <20230726095750.51b1e7e0@collabora.com>

--------------C2IowLUitjNOkqvIkin0gWwy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjMgdW0gMDk6NTcgc2NocmllYiBCb3JpcyBCcmV6aWxsb246DQo+
IE9uIFR1ZSwgMjUgSnVsIDIwMjMgMjA6NTA6NDMgKzAyMDANCj4gVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4+IEhpDQo+Pg0KPj4gQW0g
MjQuMDcuMjMgdW0gMTM6MjYgc2NocmllYiBCb3JpcyBCcmV6aWxsb246DQo+Pj4gVGhlIGRt
YS1idWYgYmFja2VuZCBpcyBzdXBwb3NlZCB0byBwcm92aWRlIGl0cyBvd24gdm1fb3BzLCBi
dXQgc29tZQ0KPj4+IGltcGxlbWVudGF0aW9uIGp1c3QgaGF2ZSBub3RoaW5nIHNwZWNpYWwg
dG8gZG8gYW5kIGxlYXZlIHZtX29wcw0KPj4+IHVudG91Y2hlZCwgcHJvYmFibHkgZXhwZWN0
aW5nIHRoaXMgZmllbGQgdG8gYmUgemVybyBpbml0aWFsaXplZCAodGhpcw0KPj4+IGlzIHRo
ZSBjYXNlIHdpdGggdGhlIHN5c3RlbV9oZWFwIGltcGxlbWVudGF0aW9uIGZvciBpbnN0YW5j
ZSkuDQo+Pj4gTGV0J3MgcmVzZXQgdm1hLT52bV9vcHMgdG8gTlVMTCB0byBrZWVwIHRoaW5n
cyB3b3JraW5nIHdpdGggdGhlc2UNCj4+PiBpbXBsZW1lbnRhdGlvbnMuDQo+Pg0KPj4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoLiBUaGlzIGJ1ZyBjb3VsZCBhZmZlY3QgYSBudW1iZXIgb2Yg
R0VNDQo+PiBpbXBsZW1lbnRhdGlvbnMuDQo+IA0KPiBUaGUgb25lIEkgZm91bmQgdGhhdCBp
cyBwcm9iYWJseSBoaXQgYnkgdGhlIHNhbWUgcHJvYmxlbSBpcw0KPiBleHlub3NfZHJtX2dl
bS5jLCBidXQgdGhlcmUgbWlnaHQgYmUgb3RoZXJzLi4uDQo+IA0KPj4gSW5zdGVhZCBvZiBm
aXhpbmcgdGhpcyBpbmRpdmlkdWFsbHksIGNvdWxkIHdlIHNldCB0aGUNCj4+IGZpZWxkcyBj
b25kaXRpb25hbGx5IGF0DQo+Pg0KPj4gICANCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjQvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMjTDEwNDIN
Cj4+DQo+PiA/DQo+Pg0KPj4gU29tZXRoaW5nIGxpa2UNCj4+DQo+PiAgICAgaWYgKCFvYmpl
Y3QtPmltcG9ydF9hdHRhY2gpIHsNCj4gDQo+IElmIGd1ZXNzIHlvdSBtZWFudCB0aGUgb3Bw
b3NpdGU6IGlmIChvYmplY3QtPmltcG9ydF9hdHRhY2gpDQoNCk5vLCB3ZSdkIHdhbnQgdG8g
YXNzaWduIGlmZiBpdCdzIG5vdCBhbiBpbXBvcnRlZCBidWZmZXIuDQoNCj4gDQo+PiAgICAg
ICB2bWEtPnByaXYgPQ0KPj4gICAgICAgdm1hLT5vcHMgPQ0KPj4gICAgIH0NCj4gDQo+IEkg
c3VzcGVjdCBpdCB3aWxsIGJyZWFrIG90aGVyIGRyaXZlcnMgcmVseWluZyBvbiB0aGUgZmFj
dCB2bWEtPnZtX29wcw0KPiBpcyBhdXRvLW1hZ2ljYWxseSBhc3NpZ25lZCB0byBvYmotPmZ1
bmNzLT52bV9vcHMsIGV2ZW4gZm9yIHByaW1lDQo+IGJ1ZmZlcnMuIFRoZSBvbmUgSSdtIGxv
b2tpbmcgYXQgcmlnaHQgbm93IGlzIGFtZGdwdTogaXQgaGFzIGl0cyBvd24gd2F5DQo+IG9m
IG1hcHBpbmcgaW1wb3J0ZWQgZG1hLWJ1ZnMsIGFuZCByZXNldHRpbmcgdm1hLT52bV9vcHMg
dG8gTlVMTCBtZWFucw0KPiB0aGUgdHRtIGxheWVyIHdpbGwgZmFsbGJhY2sgdG8gdGhlIGRl
ZmF1bHQgdHRtX2JvX3ZtX29wcywgd2hpY2ggaXMgbm90DQo+IHdoYXQgYW1kZ3B1IHdhbnRz
Lg0KPiANCj4gQUZBSUNULCBldG5hdml2IGlzIGluIHRoZSBzYW1lIHNpdHV0YXRpb24sIHRo
b3VnaCBpdCdzIHByb2JhYmx5IGVhc2llcg0KPiB0byBmaXgsIGdpdmVuIHRoZSBvcGVuL2Ns
b3NlIGhvb2tzIGZvciBpbXBvcnRlZCBvYmplY3RzIGRvZXNuJ3QgZG8gbXVjaC4NCj4gDQo+
IFRMRFI7IHllcywgaXQnZCBiZSBncmVhdCB0byBoYXZlIHRoaXMgJ2ZpeCcgbW92ZWQgYXQg
dGhlIGNvcmUgbGV2ZWwsIG9yDQo+IGV2ZW4gaGF2ZSBhIGRlZGljYXRlZCBwYXRoIGZvciBk
bWEtYnVmIG9iamVjdHMsIGJ1dCBJIGZlYXIgaXQncyBnb2luZw0KPiB0byBmYWxsIGFwYXJ0
IGlmIHdlIGRvIHRoYXQuDQoNCkkgc2VlLiBTbyBmb3IgdGhlIGN1cnJlbnQgcGF0Y2gsIHlv
dSBjYW4gYWRkDQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KSSB0aGluayB3ZSBzaG91bGQga2VlcCB0aGUgZ2VuZXJhbCBzb2x1
dGlvbiBpbiBtaW5kLiBNYXliZSB0aGlzIGNhbiBiZSANCnRyaWVkIGxhdGVyLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBPbmUgb3B0aW9uIHdvdWxkIGJlIHRvIGFkZCBh
IGRtYV9idWZfdm1fb3BzIGZpZWxkIHRvDQo+IGRybV9nZW1fb2JqZWN0X2Z1bmNzLCBhZGQg
YQ0KPiBEUk1fR0VNX09CSl9GVU5DU19TRVRfVk1fT1BTKHZtX29wcywgZG1hX2J1Zl92bV9v
cHMpIG1hY3JvIHRoYXQgd291bGQNCj4gYXNzaWduIGJvdGggZG1hX2J1Zl92bV9vcHMgYW5k
IHZtX29wcywgcGF0Y2ggYWxsIGV4aXN0aW5nIGRyaXZlcnMNCj4gdG8gdXNlIHRoaXMgbWFj
cm8gKG1lY2hhbmljYWwgY2hhbmdlIHdoZXJlIHdlIGFzc2lnbiBib3RoIGZpZWxkcyB0byB0
aGUNCj4gc2FtZSB2YWx1ZSwgc28gd2UgZG9uJ3QgYnJlYWsgYW55dGhpbmcsIGJ1dCBkb24n
dCBmaXggYnJva2VuDQo+IGltcGxlbWVudGF0aW9ucyBlaXRoZXIpLiBPbmNlIHRoaXMgaXMg
aW4gcGxhY2UsIHdlIGNhbiBoYXZlIHRoZQ0KPiBmb2xsb3dpbmcgaW4gZHJtX2dlbV9tbWFw
X29iaigpOg0KPiANCj4gCXZtYS0+dm1fb3BzID0gb2JqZWN0LT5pbXBvcnRfYXR0YWNoID8N
Cj4gCQkgICAgICBvYmplY3QtPmZ1bmNzLT5kbWFfYnVmX3ZtX29wcyA6DQo+IAkJICAgICAg
b2JqZWN0LT5mdW5jcy0+dm1fb3BzOw0KPiAJdm1hLT52bV9wcml2YXRlX2RhdGEgPSB2bWEt
PnZtX29wcyA/IG9iaiA6IE5VTEw7DQo+IA0KPiBBbmQgdGhlbiB3ZSBjYW4gc3BlY2lhbGl6
ZSB0aGUgc2htZW0gYW5kIGV4eW5vcyBpbXBsZW1lbnRhdGlvbnMNCj4gKGFjdHVhbGx5LCBh
bnkgaW1wbGVtZW50YXRpb24gdGhhdCdzIGVudGlyZWx5IGRlZmVycmluZyB0aGUgbW1hcCB0
byB0aGUNCj4gZG1hLWJ1ZiBsYXllciksIHNvIHRoZXkgZXhwbGljaXRseSBzZXQgZG1hX2J1
Zl92bV9vcHMgdG8gTlVMTC4NCj4gDQo+IEhvbmVzdGx5LCBJJ20gbm90IHN1cmUgdGhpcyBp
cyBiZXR0ZXIgdGhhbiBtYW51YWxseSBhc3NpZ25pbmcNCj4gdm1hLT52bV9vcHMgdG8gTlVM
TCBpbiB0aGUgZHJpdmVyIG1tYXAgZnVuY3Rpb24sIGJ1dCBhdCBsZWFzdCBwZW9wbGUNCj4g
d2lsbCBoYXZlIHRvIGNvbnNpZGVyIGl0IHdoZW4gdGhleSB3cml0ZSB0aGVpciBkcml2ZXIg
KCdkbyBJIHdhbnQNCj4gdGhlIHNhbWUgbW1hcCBiZWhhdmlvciBmb3IgZG1hYnVmIGFuZCAh
ZG1hYnVmPycpLg0KPiANCj4gQW55d2F5LCBJIHRoaW5rIHRoaXMgZml4IGlzIHdvcnRoIGFw
cGx5aW5nLCBiZWNhdXNlIGl0J3Mgc2VsZi1jb250YWluZWQNCj4gYW5kIGVhc3kgdG8gYmFj
a3BvcnQuIFdlIGNhbiBkaXNjdXNzIGFuZCBzb3J0IG91dCBob3cgd2Ugd2FudCB0byBmaXgg
dGhlDQo+IHByb2JsZW0gbW9yZSBnZW5lcmljYWxseSBsYXRlciBvbi4NCj4gDQo+Pg0KPj4g
cGx1cyBhIGRlc2NyaXB0aXZlIGNvbW1lbnQgbGlrZSB0aGUgb25lIHlvdSBoYXZlIGluIHlv
dXIgcGF0Y2guDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4NCj4+
PiBGaXhlczogMjZkM2FjM2NiMDRkICgiZHJtL3NobWVtLWhlbHBlcnM6IFJlZGlyZWN0IG1t
YXAgZm9yIGltcG9ydGVkIGRtYS1idWYiKQ0KPj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVs
Lm9yZz4NCj4+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4N
Cj4+PiBSZXBvcnRlZC1ieTogUm9tYW4gU3RyYXRpaWVua28gPHJvbWFuLnN0cmF0aWllbmtv
QGdsb2JhbGxvZ2ljLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24g
PGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgNiArKysrKysNCj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPj4+IGluZGV4IDRlYTY1MDdhNzdlNS4uYmFh
ZjBlMGZlYjA2IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3No
bWVtX2hlbHBlci5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMNCj4+PiBAQCAtNjIzLDcgKzYyMywxMyBAQCBpbnQgZHJtX2dlbV9zaG1lbV9t
bWFwKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0sIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdA0KPj4+ICAgIAlpbnQgcmV0Ow0KPj4+ICAgIA0KPj4+ICAgIAlpZiAob2JqLT5p
bXBvcnRfYXR0YWNoKSB7DQo+Pj4gKwkJLyogUmVzZXQgYm90aCB2bV9vcHMgYW5kIHZtX3By
aXZhdGVfZGF0YSwgc28gd2UgZG9uJ3QgZW5kIHVwIHdpdGgNCj4+PiArCQkgKiB2bV9vcHMg
cG9pbnRpbmcgdG8gb3VyIGltcGxlbWVudGF0aW9uIGlmIHRoZSBkbWEtYnVmIGJhY2tlbmQN
Cj4+PiArCQkgKiBkb2Vzbid0IHNldCB0aG9zZSBmaWVsZHMuDQo+Pj4gKwkJICovDQo+Pj4g
ICAgCQl2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IE5VTEw7DQo+Pj4gKwkJdm1hLT52bV9vcHMg
PSBOVUxMOw0KPj4+ICsNCj4+PiAgICAJCXJldCA9IGRtYV9idWZfbW1hcChvYmotPmRtYV9i
dWYsIHZtYSwgMCk7DQo+Pj4gICAgDQo+Pj4gICAgCQkvKiBEcm9wIHRoZSByZWZlcmVuY2Ug
ZHJtX2dlbV9tbWFwX29iaigpIGFjcXVpcmVkLiovDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------C2IowLUitjNOkqvIkin0gWwy--

--------------en6sbTSAwk4PuLVnv7qNNPVz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTBWSUFAwAAAAAACgkQlh/E3EQov+Ab
fA//f6EXiBuYBSKGhfZg+roAvYbvj63sHnp9Yed+NmmjoUdNbwziDt2wrjbyNphTpUqW5Q3YKFJw
biY31/1Y4p0ZAGWK3+2z+r/KL+vBpuCKmzYuT6JHCyOEKHESX81we1+DPngeg7ZIxAd3RZGi6CD7
s4n1vc6vR6285MAbfE5vnvwJAjns0ajgpQ0rOky4z9awJSZMCH0kC4HbPZJBVC/VsmKwwceq07TD
Fh28X9Sbt8FKjjF9PyWjVuZXphstC9lTAuHA8tfZ23pg8xBH1/0iUpg4yDYCkDzEyUF8jSwkFBMn
Fs7a58I2CUGIspXaATkEr2y0WahPUUykTaYalqXgOchxPSLgpBPY5Sqn2zUGZf1XzOr2f6UYM9Xc
ruW45noUFSPX0SlYokI2PKcq5Ga4JXbd94AFyAYWjXGhY2NX1pgQ/c8lQ3B9+eJol/JKc0eJPtkA
HcNieAPjfRlsgXkQJ32DLBUv2O3SGkX9vEKbya3x/AwkPELVHKZPC3b0czjmMz9YVPm0tlUfQ9yi
82r9uUxbt9xHYvFccZ3CjqBoUPyAhXYWb8GlpavBL20Xiu83AFbvRs3eEXUt0VL0HpdyLAfn+Nhy
TMjjf+MoXpxTbrZrDYyw0dY1JyHYiyrVOvoaAjag+bSSsxlXCp3R1ZRqoGqlZm4cTYY6ylMGBMB2
5Tg=
=J+xq
-----END PGP SIGNATURE-----

--------------en6sbTSAwk4PuLVnv7qNNPVz--
