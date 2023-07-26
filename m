Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01C763B34
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77EC10E491;
	Wed, 26 Jul 2023 15:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774B510E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 15:36:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D62721D39;
 Wed, 26 Jul 2023 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690385776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ai3f97Io/69hFNh9ZhKr/S7lf39va1PyH8C9+OqBSVM=;
 b=TtEuDTVVMGRYMaNtYfynVou2csG05qpDRPcrDy544CJmICGE9z7zyUxljk54KGCZ5FNxWH
 irLcWOdykKFKdXbUbtf9UGTNdEA6XNwVLoMVli+iqCkKetch/wgzo1PB9FC7q2eQgz8ZGo
 5TPg4y+JISUVPqDhoDo03ysQIW3T5vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690385776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ai3f97Io/69hFNh9ZhKr/S7lf39va1PyH8C9+OqBSVM=;
 b=ApVqIpSHndUHbDQVnr6OJcNB9IeLk4PXrxZHHUKTV93/2iy1oz4MGmlEGs4B2DhI7XhDbz
 rbfVadUzbCbQoGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CE6A139BD;
 Wed, 26 Jul 2023 15:36:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rEoJAnA9wWQdLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jul 2023 15:36:16 +0000
Message-ID: <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
Date: Wed, 26 Jul 2023 17:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8ubmSSStygisGp00obS8drvq"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8ubmSSStygisGp00obS8drvq
Content-Type: multipart/mixed; boundary="------------tW1jWfpuT3N3EohBGFS7tGDt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Roger Sewell <roger.sewell@cantab.net>
Cc: airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Message-ID: <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
In-Reply-To: <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>

--------------tW1jWfpuT3N3EohBGFS7tGDt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9jZWx5bg0KDQpBbSAyNi4wNy4yMyB1bSAxMDoxMCBzY2hyaWViIEpvY2VseW4gRmFs
ZW1wZToNClsuLi5dDQo+PiBTbyB0aGUgb2xkIGtlcm5lbCBhbHJlYWR5IGRpZCB0aGUgcmln
aHQgdGhpbmcuDQo+Pg0KPj4+DQo+Pj4gSW4gdGhlICpuZXcqIGNvZGUgdGhlIG5lYXJlc3Qt
bmFtZWQgZnVuY3Rpb24gSSBjb3VsZCBzZWUgDQo+Pj4gaXNzeXMvY2xhc3MvZHJtL2NhcmQx
LWVEUC0xL21vZGVzDQo+Pj4gbWdhZzIwMF9tb2RlX2NvbmZpZ19tb2RlX3ZhbGlkLCB3aGlj
aCByZXR1cm5zIE1PREVfT0sgYXQgdGhlIGVuZCBvZiB0aGUNCj4+PiBmdW5jdGlvbiBpZiB0
aGUgYmFuZHdpZHRoIGxpbWl0IGlzIGluY3JlYXNlZCB0byAzMDEwMCwgYW5kIHJldHVybnMN
Cj4+PiBNT0RFX0JBRCB0aHJlZSBsaW5lcyBoaWdoZXIgdXAgaWYgaXQgaXMgbGVmdCBhdCAy
NDQwMC4NCj4+DQo+PiBOb3RoaW5nIGhhcyBjaGFuZ2VkIGluIHRoZSBuZXcga2VybmVsLg0K
PiANCj4gVGhhdCdzIG5vdCBjb21wbGV0ZWx5IHRydWUsIGFzIGlmIEkgdW5kZXJzdGFuZCBj
b3JyZWN0bHksIGNoYW5naW5nIG9ubHkgDQo+IHRoZSBrZXJuZWwgd2l0aCB0aGUgc2FtZSB1
c2Vyc3BhY2UsIGJyZWFrcyB0aGUgMTQ0MHg5MDAgcmVzb2x1dGlvbi4gDQo+IChFdmVuIGlm
IE1PREVfQkFEIGlzIHJldHVybmVkIGluIGJvdGggY2FzZXMpLg0KDQpCdXQgaG93IHNvPyBN
eSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGtlcm5lbCdzIGJlaGF2aW9yIGRvZXMgbm90
IA0KY2hhbmdlLiBPbmx5IHVzZXJzcGFjZS4gSSdtIHJhdGhlciBwdXp6bGVkIGFib3V0IHRo
ZSBkZXRhaWxzIGhlcmUuIE1heWJlIA0KdGhlIG9sZCBYb3JnIHVzZXMgYW4gZW50aXJlbHkg
ZGlmZmVyZW50IGRyaXZlciwgc3VjaCBhcyB0aGUgb2xkIFhvcmcgDQp1c2Vyc3BhY2UgY29k
ZS4NCg0KPiANCj4+DQo+Pj4NCj4+PiBNb3Jlb3ZlciBpZiB3aGVuIHVzaW5nIHRoZSBvbGQg
Y29kZSB3ZSBzd2l0Y2ggdG8gV2F5bGFuZCBpbnN0ZWFkIG9mDQo+Pj4gWG9yZywgaXQgZG9l
c24ndCBsZXQgbWUgcGljayB0aGUgMTQ0MHg5MDBANjBIeiBtb2RlIGF0IGFsbCwgYnV0IGl0
IGRvZXMNCj4+PiB3aXRoIFhvcmcgKG9uZSBvZiB0aGUgcmVhc29ucyBJIGhhZG4ndCB1c2Vk
IFdheWxhbmQpLg0KPj4NCj4+IFlvdSBjYW4gZG8NCj4+DQo+PiDCoMKgIGNhdCAvc3lzL2Ns
YXNzL2RybS9jYXJkMS1WR0EtMS9tb2Rlcw0KPj4NCj4+IG9uIHRoZSBvbGQgYW5kIG5ldyBr
ZXJuZWwuIFdpdGggYSBtb25pdG9yIGNvbm5lY3RvciwgaXQgd2lsbCB0ZWxsIHlvdSANCj4+
IHRoZSBzdXBwb3J0ZWQgcmVzb2x1dGlvbnMuDQo+Pg0KPj4+DQo+Pj4gVGhlcmVmb3JlIEkg
dGhpbmsgdGhlIHJlYXNvbiB0aGF0IHRoZSBvbGQgY29kZSBhbGxvd2VkIHVzZSBvZg0KPj4+
IDE0NDB4OTAwQDYwSHogd2FzIHRoYXQgWG9yZyBzb21laG93IGRpZG4ndCBwcm9wZXJseSBj
aGVjayB0aGUgcmV0dXJuDQo+Pj4gdmFsdWUgZnJvbSBtZ2FfdmdhX21vZGVfdmFsaWQsIGJ1
dCBXYXlsYW5kIGRpZC4gTW9yZW92ZXIgSSB0aGluayB0aGF0DQo+Pj4gdGhlIGxhdGVzdCB2
ZXJzaW9uIG9mIHRoZSBYb3JnIHN0dWZmIGRvZXMgUEFSVElBTExZIGNoZWNrIHRoYXQgcmV0
dXJuDQo+Pj4gdmFsdWUsIHRvIHRoZSBleHRlbnQgdGhhdCBpdCB3b24ndCBsZXQgeW91IGFj
dHVhbGx5IHVzZSB0aGF0IG1vZGUsIGJ1dA0KPj4+IGRvZXMgbm9uZXRoZWxlc3MgcHJlc2Vu
dCBpdCBhcyBhIGNob2ljZSB3aGVuIHlvdSBnbyB0byBTZXR0aW5ncy0+RGlzcGxheQ0KPj4+
IC0gYW5kIHRoZW4gc2F2ZXMgdGhlIHZhbHVlcyBpdCBkaWRuJ3QgYWxsb3cgeW91IHRvIHRh
a2UgaW4NCj4+PiB+Ly5jb25maWcvbW9uaXRvcnMueG1sLCBhbmQgb24gcmVsb2dpbiByZWZ1
c2VzIHRvIGdpdmUgeW91IGFueSBncmFwaGljcw0KPj4+IGF0IGFsbCBiZWNhdXNlIGl0IGRv
ZXNuJ3QgbGlrZSB0aG9zZSB2YWx1ZXMuIEJ1dCB0aGF0LCBvZiBjb3Vyc2UsIGlzDQo+Pj4g
bm90aGluZyB0byBkbyB3aXRoIHRoZSBtZ2FnMjAwIGRyaXZlciAoaWYgaXQgaXMgaW5kZWVk
IHRydWUgLSBJIGhhdmVuJ3QNCj4+PiBsb29rZWQgYXQgdGhlIFhvcmcgc291cmNlIGNvZGUg
YXQgYWxsKS4NCj4+Pg0KPj4+IFRoZSBpc3N1ZSBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9m
IG15IHVzYWdlIGNhc2UgaXMgdGhhdCB0aGUgY2hpcCB3b3Jrcw0KPj4+IGp1c3QgZmluZSBp
biB0aGUgMTQ0MHg5MDBANjBIeiBtb2RlLCBldmVuIHRob3VnaCAzMDMxODAxOSA+IDEwMjQq
MjQ0MDAuDQo+Pg0KPj4gSSBkb24ndCB3YW50IHRvIGluY3JlYXNlIHRoYXQgbGltaXQgaW4g
dGhlIGRyaXZlciwgYXMgaXQgbWlnaHQgaGF2ZSANCj4+IGNvbnNlcXVlbmNlcyBmb3IgYSBs
b3Qgb2Ygb3RoZXIgaGFyZHdhcmUuIEFuZCBpZiB5b3UgYXNzdW1lIHRoYXQgDQo+PiAzMDMx
ODAxOSAqIDMgLyA0IH49IDIyNzM4NTE0ICwgMjQtYml0IGNvbG9yIG1vZGUgZml0cyBpbnRv
IHRoZSBjdXJyZW50IA0KPj4gbGltaXQuDQo+IA0KPiBUaGVyZSBhcmUgbm8gcHVibGljIGhh
cmR3YXJlIHNwZWNpZmljYXRpb25zLCBzbyBpdCdzIHByZXR0eSBoYXJkIHRvIGtub3cgDQo+
IGlmIHRoZSAyNDQwMCBsaW1pdCBpcyBsZWdpdGltYXRlIG9yIG5vdC4gQXQgbGVhc3Qgb25l
IGhhcmR3YXJlIGlzIGFibGUgDQo+IHRvIG92ZXJjb21lIHRoYXQuDQoNClRoYXQgbGltaXQg
aGFzIGJlZW4gaW4gdGhlIGRyaXZlciBzaW5jZSB0aGUgZGF3biBvZiB0aW1lLiBJJ20gbm90
IGdvaW5nIA0KdG8gdGlua2VyIHdpdGggaXQuDQoNCiANCmh0dHBzOi8vY2dpdC5mcmVlZGVz
a3RvcC5vcmcveG9yZy9kcml2ZXIveGY4Ni12aWRlby1tZ2EvdHJlZS9zcmMvbWdhX2RyaXZl
ci5jI24zODkwDQoNCj4gDQo+IEkndmUgYWxyZWFkeSBzZW50IGEgcGF0Y2ggdG8gdXNlIGlu
dGVybmFsbHkgMjRiaXQgY29sb3JzLCB3aGVuIHVzZXJzcGFjZSANCj4gY2FuIHVzZSAzMmJp
dCB0aGF0IHdvdWxkIHNvbHZlIHRoaXMgaXNzdWUgYXMgd2VsbC4gSW4gdGhlIGVuZCwgb24g
dGhlIA0KPiBWR0EgbGluaywgMjQgb3IgMzIgYml0IGNvbG9ycyBhcmUgdGhlIHNhbWUuIFRo
YXQgd291bGQgYWxsb3cgbW9kZXJuIA0KPiB1c2Vyc3BhY2UgdG8gd29yayBvbiBwYXIgd2l0
aCBYb3JnLiBTbyBtYXliZSB3ZSBjYW4gcmVjb25zaWRlciBpdCA/DQoNCk5vIHdheS4gV2Un
dmUgaGFkIElSQyBmbGFtZXdhcnMgb3ZlciB0aGlzIHRvcGljIGFscmVhZHkuIFBlb3BsZSBk
aWRuJ3QgDQpnZXQgd29yayBkb25lIHRoYXQgZGF5OyBvdGhlcnMgcmFnZXF1aXQtZWQgaW4g
ZnJ1c3RyYXRpb24uIEFzayBKYXZpZXIsIA0KaGUnbGwgcmVtZW1iZXIuIDopDQoNClRoZSBj
b25zZW50IGluIERSTS1sYW5kIGlzOiB3ZSdyZSBub3QgZ29pbmcgdG8gbWVzcyB3aXRoIGNv
bG9yIGZvcm1hdHMgDQpiZWhpbmQgdGhlIGJhY2sgb2YgdXNlcnNwYWNlLiBUaGUgb25seSBl
eGNlcHRpb24gaXMgdGhlIGVtdWxhdGlvbiBvZiANClhSR0I4ODg4IGlmZiB0aGUgaGFyZHdh
cmUgZG9lcyBub3Qgc3VwcG9ydCB0aGF0LiBBbmQgb25seSBiZWNhdXNlIGl0J3MgDQp0aGUg
ZmFsbGJhY2sgZm9ybWF0IHRoYXQgaXMgdW5pdmVyc2FsbHkgc3VwcG9ydGVkLg0KDQo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE2MzgxLw0KPiBJIHdv
dWxkIG5lZWQgdG8gdXBkYXRlIHRoZSBiYW5kd2lkdGggdGVzdCB0byBhY2NvbW1vZGF0ZSBm
b3IgMjRiaXQuDQo+IA0KPj4NCj4+IEpvY2VseW4sIHNob3VsZCB3ZSBhdHRlbXB0IHRvIG1h
a2UgZXh0cmEgcmVzb2x1dGlvbnMgYXZhaWxhYmxlIGZvciAxNi0gDQo+PiBhbmQgMjQtYml0
IG1vZGVzPyBXZSBjb3VsZCBkbyB0aGUgYmFuZHdpdGggdGVzdCBpbiB0aGUgcHJpbWFyeSBw
bGFuZSdzIA0KPj4gYXRvbWljX2NoZWNrLCB3aGVyZSB3ZSBrbm93IHRoZSByZXNvbHV0aW9u
IGFuZCB0aGUgY29sb3IgZm9ybWF0LiBUaGUgDQo+PiBnZW5lcmFsIG1vZGUgdGVzdCB3b3Vs
ZCB1c2UgYnBwPTguwqAgSURLIGhvdyB1c2Vyc3BhY2UgcmVhY3RzIHRvIHRoYXQsIA0KPj4g
c28gaXQgd291bGQgcmVxdWlyZSBzb21lIHRlc3RpbmcuDQo+IA0KPiBUaGF0IHdpbGwgb25s
eSB3b3JrIGZvciBvbGQgdXNlcnNwYWNlIChYb3JnKSBhYmxlIHRvIGRvIDE2IG9yIDI0IGJp
dCANCj4gbW9kZXMuIEFsc28gdGhlIGRyaXZlciBkb24ndCBkbyA4Yml0LCBzbyAxNmJpdCBp
cyB0aGUgbWluaW11bSwgYW5kIGNhbiANCj4gYmUgdXNlZCBpbiB0aGUgZ2VuZXJhbCBtb2Rl
IHRlc3QuIEkgY2FuIHN0aWxsIGdpdmUgaXQgYSB0cnkuDQoNCk1lc2Egc3RpbGwgc3VwcG9y
dHMgMTYtYml0cyBJSVJDLiBCdXQgMjQtYml0IHBpeGVscyBhcmUgdW5hbGlnbmVkLCB3aGlj
aCANCm1ha2VzIGl0IGhhcmQuICBJJ20gd29ycmllZCBhYm91dCBhdXRvZGV0ZWN0aW9uIGhl
cmUuIElmIHRoZSB1c2Vyc3BhY2UgDQpmYWlscyB3aXRoIDE0NDB4OTAwLTMyLCBpdCBuZWVk
cyB0byB0ZXN0IDE0NDB4OTAwLTE2IG5leHQuIEkgd291bGRuJ3QgDQpiZXQgb24gdGhpcy4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------tW1jWfpuT3N3EohBGFS7tGDt--

--------------8ubmSSStygisGp00obS8drvq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTBPW8FAwAAAAAACgkQlh/E3EQov+AG
rBAAgAbYCAFR/9Bn4B+eAVhRDID+DZjazlUZSwvEvf6AdNBRq9QUi6BPwfWl5zJRnZSj1h67LWJ0
+QmLp/dLN+3tXM2fyWXLDSx97URGM9LX9rTjz2x0YSLuswIBAtEzmpuXHtbw0dkIBEiXtOCkT+9B
G8rlkp77yg063Yhtpf8uUvM6dgnIJrfa6LXjQ6RgVuXxcmSg6aBsIwaSk+vDAaVRkVIpA3DKBqgG
JNdJi8b9nxNFOEAt/KYqq0+6c63vvW59NF42dyU3uj9lir1jiZxF8GBqKCn/R7jNQ6KVgVf2HUL+
Xz8pS3SMkXn3ozrltWW62QFLGQcIPLDyNc6WAzllOF0//du4wVutFgxvcQVLt+g3jO1lIfTufiud
4B31+stpTve1jqbHUIjHqOXb/4sHSdBEuqzCPXo14iKkGhX/liZypLdDy3rR9Rjz1ZLgiXVcms4s
9Gr7gT7t/6eSOVIwDAj/e10LwJFeJxsUVJZ2wmCvskeBwJxrFB7Rw9GrhPL7J6HEeF+ANblSu0Hd
05mbzpD17pT7VLGGpa3n8+XrpYD28HwzshHEP67EHtyIfzUoRVclVjcI+VRqZYpRjJ9gVevQgQsJ
Ept7vCHKNt0Dr4D/Eyue+yaqwZc5eD9aL+lQeLaUDDMEaUXvNbjoPA17Ln7QRJCqaFeZzJfV3vrd
qKw=
=kodi
-----END PGP SIGNATURE-----

--------------8ubmSSStygisGp00obS8drvq--
