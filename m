Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593724B2002
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97E210E99C;
	Fri, 11 Feb 2022 08:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC1010E99C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:21:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 160F21F38B;
 Fri, 11 Feb 2022 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644567711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dK5IF8v4aOHyXD8GxHxvqgqWmw3uOm31TLEMyRZfSMU=;
 b=yJ5cjgSGC5w9P3uiU4iOwNKliQBkKwieZS0yd5yknnoIjT2hjDMWuptzJn6GAX+KTVEnMt
 nzj1+3WjYDVUqxMe/lx4YuVQ5HMcVxioQkoWS3mp07rDADfFp0OzkIFZjdkLDQAPGdn5yV
 C0xExAXa1k2cYsm9OZVfLsYyp7wacQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644567711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dK5IF8v4aOHyXD8GxHxvqgqWmw3uOm31TLEMyRZfSMU=;
 b=XjK1QsV4UBV9jD2n/9e+0qPmK7sBHE3V37WfoSAJzX7vB+CqfUrhsrfeQaA5c56mwU0lec
 rIz3o4NcWE4WpNCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD8AA13B59;
 Fri, 11 Feb 2022 08:21:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kUAaMZ4cBmJZdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 08:21:50 +0000
Message-ID: <60c15ca3-80fa-8c72-deb8-6f355cde6c25@suse.de>
Date: Fri, 11 Feb 2022 09:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de> <YgWAvXF+WClk/fyk@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YgWAvXF+WClk/fyk@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WOe91SbkAqhrXNMtATtYTTGh"
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, bernie@plugable.com,
 noralf@tronnes.org, andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WOe91SbkAqhrXNMtATtYTTGh
Content-Type: multipart/mixed; boundary="------------kjEw7NDRHGlTgglAQesNdL4H";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, deller@gmx.de, bernie@plugable.com,
 jayalk@intworks.biz, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org
Message-ID: <60c15ca3-80fa-8c72-deb8-6f355cde6c25@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de> <YgWAvXF+WClk/fyk@ravnborg.org>
In-Reply-To: <YgWAvXF+WClk/fyk@ravnborg.org>

--------------kjEw7NDRHGlTgglAQesNdL4H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDEwLjAyLjIyIHVtIDIyOjE2IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBUaHUsIEZlYiAxMCwgMjAyMiBhdCAwMzoxMToxM1BN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEZiZGV2J3MgZGVmZXJyZWQg
SS9PIHNvcnRzIGFsbCBkaXJ0eSBwYWdlcyBieSBkZWZhdWx0LCB3aGljaCBpbmN1cnMgYQ0K
Pj4gc2lnbmlmaWNhbnQgb3ZlcmhlYWQuIE1ha2UgdGhlIHNvcnRpbmcgc3RlcCBvcHRpb25h
bCBhbmQgdXBkYXRlIHRoZSBmZXcNCj4+IGRyaXZlcnMgdGhhdCByZXF1aXJlIGl0LiBVc2Ug
YSBGSUZPIGxpc3QgYnkgZGVmYXVsdC4NCj4+DQo+PiBTb3J0aW5nIHBhZ2VzIGJ5IG1lbW9y
eSBvZmZzZXQgZm9yIGRlZmVycmVkIEkvTyBwZXJmb3JtcyBhbiBpbXBsaWNpdA0KPj4gYnVi
YmxlLXNvcnQgc3RlcCBvbiB0aGUgbGlzdCBvZiBkaXJ0eSBwYWdlcy4gVGhlIGFsZ29yaXRo
bSBnb2VzIHRocm91Z2gNCj4+IHRoZSBsaXN0IG9mIGRpcnR5IHBhZ2VzIGFuZCBpbnNlcnRz
IGVhY2ggbmV3IHBhZ2UgYWNjb3JkaW5nIHRvIGl0cw0KPj4gaW5kZXggZmllbGQuIEV2ZW4g
d29yc2UsIGxpc3QgdHJhdmVyc2FsIGFsd2F5cyBzdGFydHMgYXQgdGhlIGZpcnN0DQo+PiBl
bnRyeS4gQXMgdmlkZW8gbWVtb3J5IGlzIG1vc3QgbGlrZWx5IHVwZGF0ZWQgc2NhbmxpbmUg
Ynkgc2NhbmxpbmUsIHRoZQ0KPj4gYWxnb3JpdGhtIHRyYXZlcnNlcyB0aHJvdWdoIHRoZSBj
b21wbGV0ZSBsaXN0IGZvciBlYWNoIHVwZGF0ZWQgcGFnZS4NCj4+DQo+PiBGb3IgZXhhbXBs
ZSwgd2l0aCAxMDI0eDc2OHgzMmJwcCBhIHBhZ2UgY292ZXJzIGV4YWN0bHkgb25lIHNjYW5s
aW5lLg0KPj4gV3JpdGluZyBhIHNpbmdsZSBzY3JlZW4gdXBkYXRlIGZyb20gdG9wIHRvIGJv
dHRvbSByZXF1aXJlcyB1cGRhdGluZw0KPj4gNzY4IHBhZ2VzLiBXaXRoIGFuIGF2ZXJhZ2Ug
bGlzdCBsZW5ndGggb2YgMzg0IGVudHJpZXMsIGEgc2NyZWVuIHVwZGF0ZQ0KPj4gY3JlYXRl
cyAoNzY4ICogMzg0ID0pIDI5NDkxMiBjb21wYXJlIG9wZXJhdGlvbi4NCj4+DQo+PiBGaXgg
dGhpcyBieSBtYWtpbmcgdGhlIHNvcnRpbmcgc3RlcCBvcHQtaW4gYW5kIHVwZGF0ZSB0aGUg
ZmV3IGRyaXZlcnMNCj4+IHRoYXQgcmVxdWlyZSBpdC4gQWxsIG90aGVyIGRyaXZlcnMgd29y
ayB3aXRoIHVuc29ydGVkIHBhZ2UgbGlzdHMuIFBhZ2VzDQo+PiBhcmUgYXBwZW5kZWQgdG8g
dGhlIGxpc3QuIFRoZXJlZm9yZSwgaW4gdGhlIGNvbW1vbiBjYXNlIG9mIHdyaXRpbmcgdGhl
DQo+PiBmcmFtZWJ1ZmZlciB0b3AgdG8gYm90dG9tLCBwYWdlcyBhcmUgc3RpbGwgc29ydGVk
IGJ5IG9mZnNldCwgd2hpY2ggbWF5DQo+PiBoYXZlIGEgcG9zaXRpdmUgZWZmZWN0IG9uIHBl
cmZvcm1hbmNlLg0KPj4NCj4+IFBsYXlpbmcgYSB2aWRlbyBbMV0gaW4gbXBsYXllcidzIGJl
bmNobWFyayBtb2RlIHNob3dzIHRoZSBkaWZmZXJlbmNlDQo+PiAoaTctNDc5MCwgRnVsbEhE
LCBzaW1wbGVkcm0sIGtlcm5lbCB3aXRoIGRlYnVnZ2luZykuDQo+Pg0KPj4gICAgbXBsYXll
ciAtYmVuY2htYXJrIC1ub3NvdW5kIC12byBmYmRldiAuL2JpZ19idWNrX2J1bm55XzcyMHBf
c3RlcmVvLm9nZw0KPj4NCj4+IFdpdGggc29ydGVkIHBhZ2UgbGlzdHM6DQo+Pg0KPj4gICAg
QkVOQ0hNQVJLczogVkM6ICAzMi45NjBzIFZPOiAgNzMuMDY4cyBBOiAgIDAuMDAwcyBTeXM6
ICAgMi40MTNzID0gIDEwOC40NDFzDQo+PiAgICBCRU5DSE1BUkslOiBWQzogMzAuMzk0NyUg
Vk86IDY3LjM4MDIlIEE6ICAwLjAwMDAlIFN5czogIDIuMjI1MSUgPSAxMDAuMDAwMCUNCj4+
DQo+PiBXaXRoIHVuc29ydGVkIHBhZ2UgbGlzdHM6DQo+Pg0KPj4gICAgQkVOQ0hNQVJLczog
VkM6ICAzMS4wMDVzIFZPOiAgNDIuODg5cyBBOiAgIDAuMDAwcyBTeXM6ICAgMi4yNTZzID0g
ICA3Ni4xNTBzDQo+PiAgICBCRU5DSE1BUkslOiBWQzogNDAuNzE1NiUgVk86IDU2LjMyMTkl
IEE6ICAwLjAwMDAlIFN5czogIDIuOTYyNSUgPSAxMDAuMDAwMCUNCj4+DQo+PiBWQyBzaG93
cyB0aGUgb3ZlcmhlYWQgb2YgdmlkZW8gZGVjb2RpbmcsIFZPIHNob3dzIHRoZSBvdmVyaGVh
ZCBvZiB0aGUNCj4+IHZpZGVvIG91dHB1dC4gVXNpbmcgdW5zb3J0ZWQgcGFnZSBsaXN0cyBy
ZWR1Y2VzIHRoZSBiZW5jaG1hcmsncyBydW4gdGltZQ0KPj4gYnkgfjMycy9+MjUlLg0KPiBO
aWNlIQ0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCj4+IExpbms6IGh0dHBzOi8vZG93bmxvYWQuYmxlbmRlci5v
cmcvcGVhY2gvYmlnYnVja2J1bm55X21vdmllcy9iaWdfYnVja19idW5ueV83MjBwX3N0ZXJl
by5vZ2cgIyBbMV0NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQt
Y29yZS5jICB8ICAxICsNCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9icm9hZHNoZWV0ZmIu
YyAgfCAgMSArDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIHwg
MTkgKysrKysrKysrKysrLS0tLS0tLQ0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21ldHJv
bm9tZWZiLmMgICB8ICAxICsNCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi91ZGxmYi5jICAg
ICAgICAgfCAgMSArDQo+PiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgICAg
IHwgIDEgKw0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9m
YnRmdC1jb3JlLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jDQo+PiBp
bmRleCBmMjY4NGQyZDY4NTEuLjRhMzUzNDdiMzAyMCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMNCj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9mYnRmdC9mYnRmdC1jb3JlLmMNCj4+IEBAIC02NTQsNiArNjU0LDcgQEAgc3RydWN0IGZi
X2luZm8gKmZidGZ0X2ZyYW1lYnVmZmVyX2FsbG9jKHN0cnVjdCBmYnRmdF9kaXNwbGF5ICpk
aXNwbGF5LA0KPj4gICAJZmJvcHMtPmZiX2JsYW5rICAgICA9ICAgICAgZmJ0ZnRfZmJfYmxh
bms7DQo+PiAgIA0KPj4gICAJZmJkZWZpby0+ZGVsYXkgPSAgICAgICAgICAgSFogLyBmcHM7
DQo+PiArCWZiZGVmaW8tPnNvcnRfcGFnZWxpc3QgPSAgIHRydWU7DQo+PiAgIAlmYmRlZmlv
LT5kZWZlcnJlZF9pbyA9ICAgICBmYnRmdF9kZWZlcnJlZF9pbzsNCj4+ICAgCWZiX2RlZmVy
cmVkX2lvX2luaXQoaW5mbyk7DQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvYnJvYWRzaGVldGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Jyb2Fkc2hl
ZXRmYi5jDQo+PiBpbmRleCBmZDY2ZjRkNGE2MjEuLmI5MDU0ZjY1ODgzOCAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYnJvYWRzaGVldGZiLmMNCj4+ICsrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvYnJvYWRzaGVldGZiLmMNCj4+IEBAIC0xMDU5LDYgKzEwNTks
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29wcyBicm9hZHNoZWV0ZmJfb3BzID0gew0K
Pj4gICANCj4+ICAgc3RhdGljIHN0cnVjdCBmYl9kZWZlcnJlZF9pbyBicm9hZHNoZWV0ZmJf
ZGVmaW8gPSB7DQo+PiAgIAkuZGVsYXkJCT0gSFovNCwNCj4+ICsJLnNvcnRfcGFnZWxpc3QJ
PSB0cnVlLA0KPj4gICAJLmRlZmVycmVkX2lvCT0gYnJvYWRzaGVldGZiX2RweV9kZWZlcnJl
ZF9pbywNCj4+ICAgfTsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZiX2RlZmlvLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVm
aW8uYw0KPj4gaW5kZXggMzcyN2IxY2E4N2IxLi4xZjY3MmNmMjUzYjIgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPj4gKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4+IEBAIC0xMzIsMTUgKzEzMiwy
MCBAQCBzdGF0aWMgdm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9pb19ta3dyaXRlKHN0cnVjdCB2
bV9mYXVsdCAqdm1mKQ0KPj4gICAJaWYgKCFsaXN0X2VtcHR5KCZwYWdlLT5scnUpKQ0KPj4g
ICAJCWdvdG8gcGFnZV9hbHJlYWR5X2FkZGVkOw0KPj4gICANCj4+IC0JLyogd2UgbG9vcCB0
aHJvdWdoIHRoZSBwYWdlbGlzdCBiZWZvcmUgYWRkaW5nIGluIG9yZGVyDQo+PiAtCXRvIGtl
ZXAgdGhlIHBhZ2VsaXN0IHNvcnRlZCAqLw0KPj4gLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGN1
ciwgJmZiZGVmaW8tPnBhZ2VsaXN0LCBscnUpIHsNCj4+IC0JCWlmIChjdXItPmluZGV4ID4g
cGFnZS0+aW5kZXgpDQo+PiAtCQkJYnJlYWs7DQo+PiArCWlmIChmYmRlZmlvLT5zb3J0X3Bh
Z2VsaXN0KSB7DQo+PiArCQkvKg0KPj4gKwkJICogV2UgbG9vcCB0aHJvdWdoIHRoZSBwYWdl
bGlzdCBiZWZvcmUgYWRkaW5nIGluIG9yZGVyDQo+PiArCQkgKiB0byBrZWVwIHRoZSBwYWdl
bGlzdCBzb3J0ZWQuDQo+PiArCQkgKi8NCj4+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnkoY3Vy
LCAmZmJkZWZpby0+cGFnZWxpc3QsIGxydSkgew0KPj4gKwkJCWlmIChjdXItPmluZGV4ID4g
cGFnZS0+aW5kZXgpDQo+PiArCQkJCWJyZWFrOw0KPj4gKwkJfQ0KPj4gKwkJbGlzdF9hZGRf
dGFpbCgmcGFnZS0+bHJ1LCAmY3VyLT5scnUpOw0KPj4gKwl9IGVsc2Ugew0KPj4gKwkJbGlz
dF9hZGRfdGFpbCgmcGFnZS0+bHJ1LCAmZmJkZWZpby0+cGFnZWxpc3QpOw0KPj4gICAJfQ0K
PiBCaWtlc2hlZGRpbmcgLSBteSBwZXJzb25hbCBzdHlsZSBpcyB0byBoYXZlIHRoZSBsaWtl
bHkgcGFydCBmaXJzdC4NCj4gVGhpcyBtYWtlcyByZWFkaW5nIHRoZSBjb2RlIGVhc2llci4N
Cg0KSSdsbCBjaGFuZ2UgdGhpcyBhIGJpdCB0byBsZWF2ZSBvdXQgdGhlIGVsc2UgYnJhbmNo
Lg0KDQo+IA0KPiANCj4gVGhlIGZvbGxvd2luZyBkcml2ZXJzIHVzZXMgZGVmZXJyZWQgaW8g
YnV0IGFyZSBub3QgbGlzdGVkIGFzDQo+IHRoZXkgbmVlZCB0aGUgcGFnZSBsaXN0IHNvcnRl
ZDoNCj4gDQo+IC0gaGVjdWJhZmINCj4gLSBoeXBlcnZfZmINCj4gLSBzaF9tb2JpbGVfbGNk
Y2ZiDQo+IC0gc21zY3VmeA0KPiAtIHNzZDEzMDdmYg0KPiAtIHhlbi1mYmZyb250DQo+IA0K
PiBJdCB3b3VsZCBiZSBuaWNlIHdpdGggc29tZSBpbmZvIGluIHRoZSBjb21taXQgbG9nIHRo
YXQgdGhleSBkbyBub3QgbmVlZA0KPiB0aGUgcGFnZXMgc29ydGVkLg0KPiBUbyBtYWtlIHRo
ZSBsaXN0IGNvbXBsZXRlIGluY2x1ZGUgdGhlIGRybSBzdHVmZiB0b28uDQo+IA0KPiBJdCBk
aWQgbm90IGp1bXAgdG8gbWUgd2h5IHRoZXkgZGlkIG5vdCBuZWVkIHNvcnRlZCBwYWdlcywN
Cj4gc28gc29tZSBzb3J0IG9mIHJlYXNzdXJhbmNlIHRoYXQgdGhleSBoYXZlIGJlZW4gY2hl
Y2tlZCB3b3VsZCBiZSBuaWNlLg0KDQpNb3N0IGRyaXZlcnMgYnVpbGQgYSBib3VuZGluZyBy
ZWN0YW5nbGUgYXJvdW5kIHRoZSBkaXJ0eSBwYWdlcyBvciBzaW1wbHkgDQpmbHVzaCB0aGUg
d2hvbGUgc2NyZWVuLiBUaGUgb25seSB0d28gYWZmZWN0ZWQgRFJNIGRyaXZlcnMsIGdlbmVy
aWMgZmJkZXYgDQphbmQgdm13Z2Z4LCBib3RoIHVzZSB0aGUgYm91bmRpbmcgcmVjdGFuZ2xl
LiAgSW4gdGhvc2UgY2FzZXMsIHRoZSBleGFjdCANCm9yZGVyIG9mIHRoZSBwYWdlcyBkb2Vz
bid0IG1hdHRlci4gIFRoZSBvdGhlciBkcml2ZXJzIGxvb2sgYXQgdGhlIHBhZ2UgDQppbmRl
eCBvciBoYW5kbGUgcGFnZXMgb25lLWJ5LW9uZS4gSSBzZXQgdGhlIHNvcnRfcGFnZWxpc3Qg
ZmxhZyBmb3IgDQp0aG9zZSwgZXZlbiB0aG91Z2ggc29tZSBvZiB0aGVtIHdvdWxkIHByb2Jh
Ymx5IHdvcmsgY29ycmVjdGx5IHdpdGhvdXQgDQpzb3J0aW5nLg0KDQpJJ2xsIGFkZCB0aGlz
IGluZm9ybWF0aW9uIHRvIHRoZSBjb21taXQgZGVzY3JpcHRpb24uDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+IFdpdGggdGhlIGZvbGxvd2luZyBhZGRyZXNzZWQ6DQo+IEFj
a2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+IA0KPiBJIGhvcGUg
c29tZW9uZSBlbHNlIGxvb2tzIHRoYXQgY2FuIHZlcmlmeSB0aGF0IHRoZSBsaXN0IG9mIGRy
aXZlcnMNCj4gd2l0aG91dCBzb3J0X3BhZ2VsaXN0IGlzIGNvcnJlY3Qgc28gc29tZW9uZSBr
bm93bGVkZ2VhYmxlIGhhdmUgbG9va2VkDQo+IHRvby4NCj4gDQo+IAlTYW0NCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------kjEw7NDRHGlTgglAQesNdL4H--

--------------WOe91SbkAqhrXNMtATtYTTGh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIGHJ4FAwAAAAAACgkQlh/E3EQov+CQ
YA//VCi0wtk85XtOJELHdQhlvFOx5pqrOy/vdP0p/XaqZlafJFOlgHM3vgqlHfZ8xyX86/HoEul5
wVvsmuHFcVez8RtY0a16XOnlwhLM5vKMjicv2O6abSbtkmqwtdG9fiDZjxTD1pSsqQvIOpDs4hB9
sgAyFCvgY/Zu8loYnLHZTdDkPT4V32VkbEpXMM4y72lIsKGtuJwyKi9j5JRYGi2rJSc/gU4L5YIU
cKwPaOnaOWbgbkIOFQvia5pG+zbyM0w2V0duSNtt0efze/UbV/9PNQO9x/NzXYbzC2p8m0K1oJ4m
A4q8lce8qLgMxy32kW6D0+Mm0NkQFOlTahr5/LzgpjWwFN61mJX8NCrdjkyeUnWuyOgIuNq7JKVR
L+q8n4Y6AWN4Zi4HwZAJ7PhfDAa6WKiEDDi19oI8ebUsOUmIFd7ggeWcgYv0ml9idjcu1kzOHEQz
blbkKkUpQpMhiNSYV1OhEHD04tIirmqpvuq3dihFyDPCvSeakir+44o+6wm44muJjyo3wG00ITjT
7Tu25FtwOCbnzq9/fNi0u2b+VuLPGE002bqS0hpP7K+YVZR60bp5ZTV2fs6rsO+lZWyCbb72WYzY
61uJHT3XQfPkx5EoFAUiD0aQQVp53ZuGFUiEZVsF4vZqQu+U03Znp9YwY3ciGQwer5jC52UW68FH
OEU=
=9Eyi
-----END PGP SIGNATURE-----

--------------WOe91SbkAqhrXNMtATtYTTGh--
