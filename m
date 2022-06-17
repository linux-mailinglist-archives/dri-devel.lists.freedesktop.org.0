Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1F54F7B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 14:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9279311AF79;
	Fri, 17 Jun 2022 12:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FB111AF79
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:41:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 422011FDD6;
 Fri, 17 Jun 2022 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655469662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ek189dqx5PwrLEVmuX0DQfekfKpyS78S9s7mBl7UgNU=;
 b=i4DVA8ZQNBnw789gLTlMpOaZuV2PEvfgEvUI/a9NX5uWErFY4gRHoDPnK/evjBzL9l1nsB
 VxLC+wTVvThKWI4O9M3merL//Uzol1tItuEVaEyrPzFQwLfoGXVeifjF8VSbuNI5Qqouip
 oWKGcdbTHMHfsmojkU1BNvrIxDTWm+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655469662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ek189dqx5PwrLEVmuX0DQfekfKpyS78S9s7mBl7UgNU=;
 b=KogjOexwkyUZJsz+yJ30hy5QXIn7qbUYPLh6AkJX8V6onfQyrw+q6g3v1F+T2EIhIz77V0
 eXS58Kqzi6Jz3IBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3F301348E;
 Fri, 17 Jun 2022 12:41:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dCB0Ol12rGKGAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 12:41:01 +0000
Message-ID: <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
Date: Fri, 17 Jun 2022 14:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qiFwNSZ35RXv11cNo2ygAeUJ"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qiFwNSZ35RXv11cNo2ygAeUJ
Content-Type: multipart/mixed; boundary="------------oc9JWRyGP30kVUDn6fWwd3tm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Zack Rusin <zackr@vmware.com>,
 Alex Williamson <alex.williamson@redhat.com>
Message-ID: <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
In-Reply-To: <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>

--------------oc9JWRyGP30kVUDn6fWwd3tm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDYuMjIgdW0gMTQ6Mjkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFthZGRpbmcgWmFjayBhbmQgQWxleCB0byBDYyBsaXN0XQ0KPiANCj4gSGVs
bG8gVGhvbWFzLA0KPiANCj4gVGhhbmtzIGEgbG90IGZvciB0cmFja2luZyB0aGlzIGRvd24g
YW5kIGZpZ3VyaW5nIG91dCB0aGUgcm9vdCBjYXVzZSENCj4gDQo+IE9uIDYvMTcvMjIgMTQ6
MTAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQWx3YXlzIHJ1biBmYmRldiByZW1v
dmFsIGZpcnN0IHRvIHJlbW92ZSBzaW1wbGVkcm0gdmlhDQo+PiBzeXNmYl9kaXNhYmxlKCku
IFRoaXMgY2xlYXJzIHRoZSBpbnRlcm5hbCBzdGF0ZS4gVGhlIGxhdGVyIGNhbGwNCj4+IHRv
IGRybV9hcGVydHVyZV9kZXRhY2hfZHJpdmVycygpIHRoZW4gZG9lcyBub3RoaW5nLiBPdGhl
cndpc2UsDQo+PiB3aXRoIGRybV9hcGVydHVyZV9kZXRhY2hfZHJpdmVycygpIHJ1bm5pbmcg
Zmlyc3QsIHRoZSBjYWxsIHRvDQo+PiBzeXNmYl9kaXNhYmxlKCkgdXNlcyBpbmNvbnNpc3Rl
bnQgc3RhdGUuDQo+Pg0KPj4gRXhhbXBsZSBiYWNrdHJhY2Ugc2hvdyBiZWxvdzoNCj4+DQo+
PiBbICAgMTEuNjYzNDIyXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+IFsgICAxMS42NjM0MjZdIEJVRzog
S0FTQU46IHVzZS1hZnRlci1mcmVlIGluIGRldmljZV9kZWwrMHg3OS8weDVmMA0KPj4gWyAg
IDExLjY2MzQzNV0gUmVhZCBvZiBzaXplIDggYXQgYWRkciBmZmZmODg4MTA4MTg1MDUwIGJ5
IHRhc2sgc3lzdGVtZC11ZGV2ZC8zMTENCj4+IFsgICAxMS42NjM0NDBdIENQVTogMCBQSUQ6
IDMxMSBDb21tOiBzeXN0ZW1kLXVkZXZkIFRhaW50ZWQ6IEcgICAgICAgICAgICBFICAgICA1
DQo+PiAJLjE5LjAtcmMyLTEtZGVmYXVsdCsgIzE2ODkNCj4+IFsgICAxMS42NjM0NDVdIEhh
cmR3YXJlIG5hbWU6IEhQIFByb0xpYW50IERMMTIwIEc3LCBCSU9TIEowMSAwNC8yMS8yMDEx
DQo+PiBbICAgMTEuNjYzNDQ3XSBDYWxsIFRyYWNlOg0KPj4gWyAgIDExLjY2MzQ0OV0gIDxU
QVNLPg0KPj4gWyAgIDExLjY2MzQ1MV0gID8gZGV2aWNlX2RlbCsweDc5LzB4NWYwDQo+PiBb
ICAgMTEuNjYzNDU2XSAgZHVtcF9zdGFja19sdmwrMHg1Yi8weDczDQo+PiBbICAgMTEuNjYz
NDYyXSAgcHJpbnRfYWRkcmVzc19kZXNjcmlwdGlvbi5jb25zdHByb3AuMCsweDFmLzB4MWIw
DQo+PiBbICAgMTEuNjYzNDY4XSAgPyBkZXZpY2VfZGVsKzB4NzkvMHg1ZjANCj4+IFsgICAx
MS42NjM0NzFdICA/IGRldmljZV9kZWwrMHg3OS8weDVmMA0KPj4gWyAgIDExLjY2MzQ3NV0g
IHByaW50X3JlcG9ydC5jb2xkKzB4M2MvMHgyMWMNCj4+IFsgICAxMS42NjM0ODFdICA/IGxv
Y2tfYWNxdWlyZWQrMHg4Ny8weDFlMA0KPj4gWyAgIDExLjY2MzQ4NF0gID8gbG9ja19hY3F1
aXJlZCsweDg3LzB4MWUwDQo+PiBbICAgMTEuNjYzNDg5XSAgPyBkZXZpY2VfZGVsKzB4Nzkv
MHg1ZjANCj4+IFsgICAxMS42NjM0OTJdICBrYXNhbl9yZXBvcnQrMHhiZi8weGYwDQo+PiBb
ICAgMTEuNjYzNDk4XSAgPyBkZXZpY2VfZGVsKzB4NzkvMHg1ZjANCj4+IFsgICAxMS42NjM1
MDNdICBkZXZpY2VfZGVsKzB4NzkvMHg1ZjANCj4+IFsgICAxMS42NjM1MDldICA/IGRldmlj
ZV9yZW1vdmVfYXR0cnMrMHgxNzAvMHgxNzANCj4+IFsgICAxMS42NjM1MTRdICA/IGxvY2tf
aXNfaGVsZF90eXBlKzB4ZTgvMHgxNDANCj4+IFsgICAxMS42NjM1MjNdICBwbGF0Zm9ybV9k
ZXZpY2VfZGVsLnBhcnQuMCsweDE5LzB4ZTANCj4+IFsgICAxMS42NjM1MzBdICBwbGF0Zm9y
bV9kZXZpY2VfdW5yZWdpc3RlcisweDFjLzB4MzANCj4+IFsgICAxMS42NjM1MzVdICBzeXNm
Yl9kaXNhYmxlKzB4MmQvMHg3MA0KPj4gWyAgIDExLjY2MzU0MF0gIHJlbW92ZV9jb25mbGlj
dGluZ19mcmFtZWJ1ZmZlcnMrMHgxYy8weGYwDQo+PiBbICAgMTEuNjYzNTQ2XSAgcmVtb3Zl
X2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMrMHgxMzAvMHgxYTANCj4+IFsgICAxMS42
NjM1NTRdICBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZl
cnMrMHg4Ni8weGIwDQo+PiBbICAgMTEuNjYzNTYxXSAgPyBtZ2FnMjAwX3BjaV9yZW1vdmUr
MHgzMC8weDMwIFttZ2FnMjAwXQ0KPj4gWyAgIDExLjY2MzU3OF0gIG1nYWcyMDBfcGNpX3By
b2JlKzB4MmQvMHgxNDAgW21nYWcyMDBdDQo+Pg0KPiANCj4gTWF5YmUgaW5jbHVkZSBhIFJl
cG9ydGVkLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPiA/IHNpbmNlDQo+IHRo
aXMgc2VlbXMgdG8gYmUgdGhlIGV4YWN0IHNhbWUgaXNzdWUgdGhhdCBoZSByZXBvcnRlZCB5
ZXN0ZXJkYXkuDQoNCkknbGwgZG8uDQoNCj4gDQo+IFBhdGNoIGxvb2tzIGdvb2QgdG8gbWUg
YW5kIHRoaXMgc2VlbXMgdG8gYmUgdGhlIGNvcnJlY3QgZml4IElNTy4NCj4gVGhhdCB3YXkg
d2Ugd29uJ3QgcmUtaW50cm9kdWNlIHRoZSBpc3N1ZSB0aGF0IHdhcyBmaXhlZCBieSB0aGUN
Cj4gc3lzZmJfdW5yZWdpc3RlcigpIGZ1bmN0aW9uLCB0aGF0IGlzIHRvIHJlbW92ZSBhIHBk
ZXYgZXZlbiBpZiB3YXNuJ3QNCj4gYm91bmQgdG8gYSBkcml2ZXIgdG8gcHJldmVudCBhIGxh
dGUgc2ltcGxlZHJtIHJlZ2lzdHJhdGlvbiB0byBtYXRjaC4NCj4gDQo+IFJldmlld2VkLWJ5
OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCg0KVGhh
bmtzIQ0KDQo+IA0KPiBJIHdvbmRlciB3aGF0J3MgdGhlIGJlc3Qgd2F5IHRvIGNvb3JkaW5h
dGUgd2l0aCBBbGV4IHRvIG1lcmdlIHRoaXMNCj4gZml4IGFuZCB5b3VyIHBhdGNoIHRoYXQg
bW92ZXMgdGhlIGFwZXJ0dXJlIGNvZGUgb3V0IG9mIERSTSwgc2luY2UNCj4gYXMgZmFyIGFz
IEkgY2FuIHRlbGwgYm90aCBzaG91bGQgdGFyZ2V0IHRoZSB2NS4yMCByZWxlYXNlLg0KDQpJ
ZiBub3RoaW5nIGVsc2UgY29tZXMgaW4sIEknbGwgbWVyZ2UgdGhpcyBwYXRjaCBvbiBNb25k
YXkgYW5kIHNlbmQgQWxleCANCmFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGUgdmZpbyBwYXRj
aC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gRml4ZXM6IDg3M2Vi
M2IxMTg2MCAoImZiZGV2OiBEaXNhYmxlIHN5c2ZiIGRldmljZSByZWdpc3RyYXRpb24gd2hl
biByZW1vdmluZyBjb25mbGljdGluZyBGQnMiKQ0KPj4gQ2M6IEphdmllciBNYXJ0aW5leiBD
YW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPg0KPj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+IENj
OiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+PiBDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4gQ2M6IFpoZW4gTGVpIDx0aHVuZGVyLmxlaXpoZW5A
aHVhd2VpLmNvbT4NCj4+IENjOiBDaGFuZ2NoZW5nIERlbmcgPGRlbmcuY2hhbmdjaGVuZ0B6
dGUuY29tLmNuPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1cmUu
YyB8IDI2ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hcGVydHVyZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hcGVydHVyZS5jDQo+PiBpbmRleCA3NGJkNGE3NmIyNTMuLjA1OWZkNzE0MjRmNiAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1cmUuYw0KPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9hcGVydHVyZS5jDQo+PiBAQCAtMzI5LDcgKzMyOSwyMCBA
QCBpbnQgZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJz
KHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICAJCQkJCQkgICAgIGNvbnN0IHN0cnVjdCBk
cm1fZHJpdmVyICpyZXFfZHJpdmVyKQ0KPj4gICB7DQo+PiAgIAlyZXNvdXJjZV9zaXplX3Qg
YmFzZSwgc2l6ZTsNCj4+IC0JaW50IGJhciwgcmV0ID0gMDsNCj4+ICsJaW50IGJhciwgcmV0
Ow0KPj4gKw0KPj4gKwkvKg0KPj4gKwkgKiBXQVJOSU5HOiBBcHBhcmVudGx5IHdlIG11c3Qg
a2ljayBmYmRldiBkcml2ZXJzIGJlZm9yZSB2Z2Fjb24sDQo+PiArCSAqIG90aGVyd2lzZSB0
aGUgdmdhIGZiZGV2IGRyaXZlciBmYWxscyBvdmVyLg0KPj4gKwkgKi8NCj4+ICsjaWYgSVNf
UkVBQ0hBQkxFKENPTkZJR19GQikNCj4+ICsJcmV0ID0gcmVtb3ZlX2NvbmZsaWN0aW5nX3Bj
aV9mcmFtZWJ1ZmZlcnMocGRldiwgcmVxX2RyaXZlci0+bmFtZSk7DQo+PiArCWlmIChyZXQp
DQo+PiArCQlyZXR1cm4gcmV0Ow0KPj4gKyNlbmRpZg0KPj4gKwlyZXQgPSB2Z2FfcmVtb3Zl
X3ZnYWNvbihwZGV2KTsNCj4+ICsJaWYgKHJldCkNCj4+ICsJCXJldHVybiByZXQ7DQo+PiAg
IA0KPj4gICAJZm9yIChiYXIgPSAwOyBiYXIgPCBQQ0lfU1REX05VTV9CQVJTOyArK2Jhcikg
ew0KPj4gICAJCWlmICghKHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCBiYXIpICYgSU9SRVNP
VVJDRV9NRU0pKQ0KPj4gQEAgLTMzOSwxNSArMzUyLDYgQEAgaW50IGRybV9hcGVydHVyZV9y
ZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgcGNpX2RldiAqcGRl
diwNCj4+ICAgCQlkcm1fYXBlcnR1cmVfZGV0YWNoX2RyaXZlcnMoYmFzZSwgc2l6ZSk7DQo+
PiAgIAl9DQo+PiAgIA0KPj4gLQkvKg0KPj4gLQkgKiBXQVJOSU5HOiBBcHBhcmVudGx5IHdl
IG11c3Qga2ljayBmYmRldiBkcml2ZXJzIGJlZm9yZSB2Z2Fjb24sDQo+PiAtCSAqIG90aGVy
d2lzZSB0aGUgdmdhIGZiZGV2IGRyaXZlciBmYWxscyBvdmVyLg0KPj4gLQkgKi8NCj4+IC0j
aWYgSVNfUkVBQ0hBQkxFKENPTkZJR19GQikNCj4+IC0JcmV0ID0gcmVtb3ZlX2NvbmZsaWN0
aW5nX3BjaV9mcmFtZWJ1ZmZlcnMocGRldiwgcmVxX2RyaXZlci0+bmFtZSk7DQo+PiAtI2Vu
ZGlmDQo+PiAtCWlmIChyZXQgPT0gMCkNCj4+IC0JCXJldCA9IHZnYV9yZW1vdmVfdmdhY29u
KHBkZXYpOw0KPj4gLQlyZXR1cm4gcmV0Ow0KPj4gKwlyZXR1cm4gMDsNCj4+ICAgfQ0KPj4g
ICBFWFBPUlRfU1lNQk9MKGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2Zy
YW1lYnVmZmVycyk7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------oc9JWRyGP30kVUDn6fWwd3tm--

--------------qiFwNSZ35RXv11cNo2ygAeUJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKsdl0FAwAAAAAACgkQlh/E3EQov+CL
kxAA0LnZ4PatLnZfmRMZiwHqgKB1yJHltDZIkmhIYQiFI0kv/Llq8xMzdv12mVqKJ0kBaLsaJN4C
pTJSjWC3md13L5Ne5E6zfWrChGAU2lZUUYWaI2vKOuvd49UNgfsGErqcnIJD4zddhk2rcrPGg5H3
rJQ6kxkrKBMM46k7c+8OCU848xuPedbafQib7TwEQu5+i+bRRUwsCDFaPUfkiGR1Pyvjbo3LreeR
63aqQ+B2rrIW59o4XDqR70WFbKrKqqy6bH8UMzKVdnB5EA18DIFFa6kwMqm63cb4FeHGu8m+f1SQ
dmJn+yzFYF2vEsw0gEALemDdPQ6i/BM4xv9q+T0bYNV2ATPWQ2uqmbdWfqsutlOhiMvwZzqtjVzd
+Bcdub+0aNyBrUmChiKTPJe9hpG9swdMBff1xSCjEGUrOfs/SBBfX/RkEEhzDWnpBQeU9Jv0IzcN
pdcbzYipFGGDIvWLkdHLT923oKeRPsWROtXK2WU/qgu665Hd1WIVsVkHFIgazk+M1iMHP0I2Yxws
WIZ3vd6Hx/hSmHAXNxR7hv5sYD7PBsYybbHe76nBMIz3PnDssZ+66x+X5XOJ3VIMwwA5aeGhs967
Ud2Diko5C4Z2pOHmrHaaMagbNq2c3NZVkgXHP4oNduOX1MoD0UMkI4sCpoTZFoVYh9YHJnH2+9GT
xdI=
=hjmd
-----END PGP SIGNATURE-----

--------------qiFwNSZ35RXv11cNo2ygAeUJ--
