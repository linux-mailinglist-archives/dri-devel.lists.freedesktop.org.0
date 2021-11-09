Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A1344AFCB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 15:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911D489B12;
	Tue,  9 Nov 2021 14:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734889B12
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 14:56:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDDA7218B0;
 Tue,  9 Nov 2021 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636469772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZ9Do1G+3tw9PsSxvwSDbSSiPA4iP9V7vXEVrAAFg/U=;
 b=U5JIN7W9wYch9KWV9YEyt3HrwSsvMwiB+KmVDZEjfiTWS4aZqjCj66syhEBl2EpGZkRdMf
 F/wT4iiOMvFsYD5Fa3HxPNkpXHwFOSB4rAyscXP4abD9ettuxyKppjYnhAaio4dJ9s9A0E
 DCkiHfnkSQ2M+BtyODYMw9dwS3MQeIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636469772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZ9Do1G+3tw9PsSxvwSDbSSiPA4iP9V7vXEVrAAFg/U=;
 b=4+5SykHmlHjJumeqIV+TIIm7XoiMpgCTvcApDKKlq+Dx1U1y9u+zEn57uRmzcq7w+k4K2C
 qbcPyONxNvJY2BBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AFFA13A6A;
 Tue,  9 Nov 2021 14:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sVMfGQyMimGQBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Nov 2021 14:56:12 +0000
Message-ID: <bb71f9a7-9fd0-ac91-749d-b9241290c45d@suse.de>
Date: Tue, 9 Nov 2021 15:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>
 <b5e514a7-74f3-d072-cfba-80ff05c2669c@suse.de>
 <1b1e8a38-2ad6-406e-0d07-bd28dcba08a3@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1b1e8a38-2ad6-406e-0d07-bd28dcba08a3@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JaHCOaiGH8iuk38ggeJc024l"
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JaHCOaiGH8iuk38ggeJc024l
Content-Type: multipart/mixed; boundary="------------AjIZl1YNSZ8cY3RWhIVPfZFd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <bb71f9a7-9fd0-ac91-749d-b9241290c45d@suse.de>
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>
 <b5e514a7-74f3-d072-cfba-80ff05c2669c@suse.de>
 <1b1e8a38-2ad6-406e-0d07-bd28dcba08a3@tronnes.org>
In-Reply-To: <1b1e8a38-2ad6-406e-0d07-bd28dcba08a3@tronnes.org>

--------------AjIZl1YNSZ8cY3RWhIVPfZFd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgbG9va2luZyB0aHJvdWdoIGFsbCB0aGlzIGNvZGUuDQoNCkFt
IDA5LjExLjIxIHVtIDE0OjA0IHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzOg0KPiANCj4gDQo+
IERlbiAwOS4xMS4yMDIxIDEzLjM4LCBza3JldiBUaG9tYXMgWmltbWVybWFubjoNCj4+DQo+
Pg0KPj4gQW0gMDguMTEuMjEgdW0gMjE6NTUgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
Pj4NCj4+Pg0KPj4+IERlbiAwMS4xMS4yMDIxIDE1LjE1LCBza3JldiBUaG9tYXMgWmltbWVy
bWFubjoNCj4+Pj4gRW5hYmxlIHRoZSBGQl9EQU1BR0VfQ0xJUFMgcHJvcGVydHkgdG8gcmVk
dWNlIGRpc3BsYXktdXBkYXRlDQo+Pj4+IG92ZXJoZWFkLiBBbHNvIGZpeGVzIGEgd2Fybmlu
ZyBpbiB0aGUga2VybmVsIGxvZy4NCj4+Pj4NCj4+Pj4gIMKgwqAgc2ltcGxlLWZyYW1lYnVm
ZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBbZHJtXQ0KPj4+PiBkcm1fcGxhbmVfZW5hYmxl
X2ZiX2RhbWFnZV9jbGlwcygpIG5vdCBjYWxsZWQNCj4+Pj4NCj4+Pj4gRml4IHRoZSBjb21w
dXRhdGlvbiBvZiB0aGUgYmxpdCByZWN0YW5nbGUuIFRoaXMgd2Fzbid0IGFuIGlzc3VlIHNv
DQo+Pj4+IGZhciwgYXMgc2ltcGxlZHJtIGFsd2F5cyBibGl0dGVkIHRoZSBmdWxsIGZyYW1l
YnVmZmVyLiBUaGUgY29kZSBub3cNCj4+Pj4gc3VwcG9ydHMgZGFtYWdlIGNsaXBwaW5nIGFu
ZCB2aXJ0dWFsIHNjcmVlbiBzaXplcy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4+IC0tLQ0KPj4+PiAg
wqAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAzMCArKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0NCj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9zaW1wbGVkcm0uYw0KPj4+PiBpbmRleCA1NzFmNzE2ZmY0MjcuLmU4NzIxMjFlOWZiMCAx
MDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+Pj4gQEAgLTY0
Miw3ICs2NDIsNyBAQCBzaW1wbGVkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9lbmFibGUoc3Ry
dWN0DQo+Pj4+IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLA0KPj4+PiAgwqDCoMKg
wqDCoCB2b2lkICp2bWFwID0gc2hhZG93X3BsYW5lX3N0YXRlLT5kYXRhWzBdLnZhZGRyOyAv
KiBUT0RPOiBVc2UNCj4+Pj4gbWFwcGluZyBhYnN0cmFjdGlvbiAqLw0KPj4+PiAgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gJnNkZXYtPmRldjsNCj4+Pj4gIMKgwqDC
oMKgwqAgdm9pZCBfX2lvbWVtICpkc3QgPSBzZGV2LT5zY3JlZW5fYmFzZTsNCj4+Pj4gLcKg
wqDCoCBzdHJ1Y3QgZHJtX3JlY3QgY2xpcDsNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3Jl
Y3Qgc3JjX2NsaXAsIGRzdF9jbGlwOw0KPj4+PiAgwqDCoMKgwqDCoCBpbnQgaWR4Ow0KPj4+
PiAgwqAgwqDCoMKgwqDCoCBpZiAoIWZiKQ0KPj4+PiBAQCAtNjUxLDEwICs2NTEsMTQgQEAg
c2ltcGxlZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZW5hYmxlKHN0cnVjdA0KPj4+PiBkcm1f
c2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4+Pj4gIMKgwqDCoMKgwqAgaWYgKCFkcm1f
ZGV2X2VudGVyKGRldiwgJmlkeCkpDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Ow0KPj4+PiAgwqAgLcKgwqDCoCBkcm1fcmVjdF9pbml0KCZjbGlwLCAwLCAwLCBmYi0+d2lk
dGgsIGZiLT5oZWlnaHQpOw0KPj4+PiArwqDCoMKgIGRybV9yZWN0X2ZwX3RvX2ludCgmc3Jj
X2NsaXAsICZwbGFuZV9zdGF0ZS0+c3JjKTsNCj4+Pj4gIMKgIC3CoMKgwqAgZHN0ICs9IGRy
bV9mYl9jbGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0LCAmY2xpcCk7DQo+
Pj4+IC3CoMKgwqAgZHJtX2ZiX2JsaXRfdG9pbyhkc3QsIHNkZXYtPnBpdGNoLCBzZGV2LT5m
b3JtYXQtPmZvcm1hdCwgdm1hcCwNCj4+Pj4gZmIsICZjbGlwKTsNCj4+Pj4gK8KgwqDCoCBk
c3RfY2xpcCA9IHBsYW5lX3N0YXRlLT5kc3Q7DQo+Pj4NCj4+PiBJIGFzc3VtZSB0aGF0IHNy
Y19jbGlwIGFuZCBkc3RfY2xpcCBhcmUgb2YgdGhlIHNhbWUgc2l6ZSwgc2luY2Ugc2NhbGlu
Zw0KPj4+IGlzIG5vdCBzdXBwb3J0ZWQuIFdoYXQgcHJldmVudHMgZHN0X2NsaXAgZnJvbSBi
ZWluZyBiaWdnZXIgdGhhbiB0aGUNCj4+PiBidWZmZXIgdGhhdCdzIGJlaW5nIGJsaXR0ZWQg
aW50bz8gV2hlcmUgaXMgdGhhdCBib3VuZHMgY2hlY2tpbmcgZG9uZT8NCj4+DQo+PiBUaGUg
dmFsdWUgb2YgZHN0X2NsaXAgY29tZXMgZnJvbSBwbGFuZV9zdGF0ZS0+ZHN0LCB3aGljaCBn
ZXRzDQo+PiBpbml0aWFsaXplZCBpbiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9z
dGF0ZSgpLiBbMV0gVGhlIGZpZWxkcyBhcmUNCj4+IHRha2VuIGZyb20gdGhlIGNydGNfe3gs
eSx3LGh9IHZhbHVlcyBieSBkcm1fcGxhbmVfZ2V0X2Rlc3QoKS4gWzJdIEZvcg0KPj4gcHJp
bWFyeSBwbGFuZXMsIHRoZSBjcnRjX3t4LHksdyxofSB2YWx1ZXMgYXJlIGluaXRpYWxpemVk
IGluDQo+PiBfX2RybV9hdG9taWNfaGVscGVyX3NldF9jb25maWcoKSB0byB0aGUgc2l6ZSBv
ZiB0aGUgZGlzcGxheS4gWzNdIFRoYXQNCj4+IHNpemUgY29tZXMgZGlyZWN0bHkgZnJvbSB0
aGUgY3VycmVudCB2aWRlbyBtb2RlLiBbNF0gRnJvbSBhbGwgSSBjYW4gc2VlDQo+PiB0aGlz
IGNhbm5vdCBvdmVyZmxvdy4NCj4+DQo+IA0KPiBPaywgdGhhdCB0YWtlcyBjYXJlIG9mIHRo
ZSB1cHBlciBib3VuZC4NCj4gDQo+IFRoZXJlJ3MgdGhpcyBpbiBkcm1fYXRvbWljX2hlbHBl
cl9jaGVja19wbGFuZV9zdGF0ZSgpOg0KPiANCj4gCXBsYW5lX3N0YXRlLT52aXNpYmxlID0g
ZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3JjLCBkc3QsICZjbGlwKTsNCj4gDQo+IAlpZiAoIXBs
YW5lX3N0YXRlLT52aXNpYmxlKQ0KPiAJCS8qDQo+IAkJICogUGxhbmUgaXNuJ3QgdmlzaWJs
ZTsgc29tZSBkcml2ZXJzIGNhbiBoYW5kbGUgdGhpcw0KPiAJCSAqIHNvIHdlIGp1c3QgcmV0
dXJuIHN1Y2Nlc3MgaGVyZS4gIERyaXZlcnMgdGhhdCBjYW4ndA0KPiAJCSAqIChpbmNsdWRp
bmcgdGhvc2UgdGhhdCB1c2UgdGhlIHByaW1hcnkgcGxhbmUgaGVscGVyJ3MNCj4gCQkgKiB1
cGRhdGUgZnVuY3Rpb24pIHdpbGwgcmV0dXJuIGFuIGVycm9yIGZyb20gdGhlaXINCj4gCQkg
KiB1cGRhdGVfcGxhbmUgaGFuZGxlci4NCj4gCQkgKi8NCj4gCQlyZXR1cm4gMDsNCj4gDQo+
IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9tZXJnZWQoKSBjaGVja3MgLT52aXNpYmxlIGFu
ZCByZXR1cm5zIGZhbHNlIGlmDQo+IGl0IGlzIG5vdCBzZXQgc28gdXBkYXRlKCkgaXMgZ29v
ZCBvbiB0aGUgbG93ZXIgYm91bmQuDQo+IA0KPiBNYXliZSBpdCdzIG5lY2Vzc2FyeSB0byBj
aGVjayAtPnZpc2libGUgaGVyZSBpbiBlbmFibGUoKSBiZWZvcmUgZG9pbmcNCj4gdGhlIGJs
aXQ/DQoNCklzIGl0IGV2ZW4gcG9zc2libGUgdG8gY3JlYXRlIGFuIGludmlzaWJsZSBwcmlt
YXJ5IHBsYW5lIGhlcmU/IFdlIGNhbm5vdCANCnNjYWxlIFsxXSBhbmQgaWYgdGhlIHByaW1h
cnkgcGxhbmUgaXMgc21hbGxlciB0aGFuIHRoZSBmcmFtZWJ1ZmZlciwgd2UgDQpoaXQgdGhl
IGNhc2UgYXQgWzJdLiBUaGUgb25seSB3YXkgSSBjYW4gc2VlIHRoaXMgaXMgdGhhdCB0aGUg
dmlzaWJpbGl0eSANCnRlc3QgYXQgWzNdIHN1Y2NlZWRzLiBUaGF0IHdvdWxkIHJlcXVpcmUg
YSBmcmFtZWJ1ZmZlciBvZiBzaXplIDAuIFRoYXQncyANCmltcG9zc2libGUgZnJvbSB0aGUg
Y29kZSBpbiBmcmFtYnVmZmVyX2NoZWNrKCkuIFs0XSBVbmxlc3MgdGhlcmUncyBzb21lIA0K
Y29ybmVyIGNhc2UsIHdlJ3JlIGdvb2QgaGVyZS4NCg0KSG93ZXZlciwgSSB0aGluayB0aGF0
IGRybV9hdG9taWNfY2hlY2tfcGxhbmVfc3RhdGUoKSBjb3VsZCBsYXRlciBiZSANCmltcHJv
dmVkIHRvIGhhbmRsZSB0aGUgJ3Zpc2libGUnIGZpZWxkIGluIGEgbW9yZSBzb3BoaXN0aWNh
dGVkIHdheS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmMjTDIyNw0KWzJdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYyNMODU0DQpbM10gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9s
YXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jI0w4NDQN
Cls0XSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2Uv
ZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jI0wxODUNCg0KPiANCj4gTm9yYWxm
Lg0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4gWzFdDQo+PiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYXRvbWljX2hlbHBlci5jI0w4MDcNCj4+DQo+PiBbMl0NCj4+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9kcm0vZHJt
X3BsYW5lLmgjTDI1Nw0KPj4gWzNdDQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMjTDE1OTAN
Cj4+DQo+PiBbNF0NCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jI0w3ODgNCj4+DQo+Pg0KPj4+
DQo+Pj4gTm9yYWxmLg0KPj4+DQo+Pj4+ICvCoMKgwqAgaWYgKCFkcm1fcmVjdF9pbnRlcnNl
Y3QoJmRzdF9jbGlwLCAmc3JjX2NsaXApKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgZHN0ICs9IGRybV9mYl9jbGlwX29mZnNldChzZGV2
LT5waXRjaCwgc2Rldi0+Zm9ybWF0LCAmZHN0X2NsaXApOw0KPj4+PiArwqDCoMKgIGRybV9m
Yl9ibGl0X3RvaW8oZHN0LCBzZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0LT5mb3JtYXQsIHZt
YXAsDQo+Pj4+IGZiLCAmc3JjX2NsaXApOw0KPj4+PiAgwqAgwqDCoMKgwqDCoCBkcm1fZGV2
X2V4aXQoaWR4KTsNCj4+Pj4gIMKgIH0NCj4+Pj4gQEAgLTY4NiwyMCArNjkwLDI4IEBAIHNp
bXBsZWRybV9zaW1wbGVfZGlzcGxheV9waXBlX3VwZGF0ZShzdHJ1Y3QNCj4+Pj4gZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmZiOw0KPj4+PiAgwqDCoMKgwqDCoCBz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gJnNkZXYtPmRldjsNCj4+Pj4gIMKgwqDCoMKgwqAg
dm9pZCBfX2lvbWVtICpkc3QgPSBzZGV2LT5zY3JlZW5fYmFzZTsNCj4+Pj4gLcKgwqDCoCBz
dHJ1Y3QgZHJtX3JlY3QgY2xpcDsNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3JlY3QgZGFt
YWdlX2NsaXAsIHNyY19jbGlwLCBkc3RfY2xpcDsNCj4+Pj4gIMKgwqDCoMKgwqAgaW50IGlk
eDsNCj4+Pj4gIMKgIMKgwqDCoMKgwqAgaWYgKCFmYikNCj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47DQo+Pj4+ICDCoCAtwqDCoMKgIGlmICghZHJtX2F0b21pY19oZWxwZXJf
ZGFtYWdlX21lcmdlZChvbGRfcGxhbmVfc3RhdGUsDQo+Pj4+IHBsYW5lX3N0YXRlLCAmY2xp
cCkpDQo+Pj4+ICvCoMKgwqAgaWYgKCFkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2Vk
KG9sZF9wbGFuZV9zdGF0ZSwNCj4+Pj4gcGxhbmVfc3RhdGUsICZkYW1hZ2VfY2xpcCkpDQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBkcm1f
cmVjdF9mcF90b19pbnQoJnNyY19jbGlwLCAmcGxhbmVfc3RhdGUtPnNyYyk7DQo+Pj4+ICvC
oMKgwqAgaWYgKCFkcm1fcmVjdF9pbnRlcnNlY3QoJnNyY19jbGlwLCAmZGFtYWdlX2NsaXAp
KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAg
ZHN0X2NsaXAgPSBwbGFuZV9zdGF0ZS0+ZHN0Ow0KPj4+PiArwqDCoMKgIGlmICghZHJtX3Jl
Y3RfaW50ZXJzZWN0KCZkc3RfY2xpcCwgJnNyY19jbGlwKSkNCj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm47DQo+Pj4+ICDCoCDCoMKgwqDCoMKgIGlmICghZHJtX2Rldl9lbnRl
cihkZXYsICZpZHgpKQ0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+Pj4g
IMKgIC3CoMKgwqAgZHN0ICs9IGRybV9mYl9jbGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rl
di0+Zm9ybWF0LCAmY2xpcCk7DQo+Pj4+IC3CoMKgwqAgZHJtX2ZiX2JsaXRfdG9pbyhkc3Qs
IHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQtPmZvcm1hdCwgdm1hcCwNCj4+Pj4gZmIsICZj
bGlwKTsNCj4+Pj4gK8KgwqDCoCBkc3QgKz0gZHJtX2ZiX2NsaXBfb2Zmc2V0KHNkZXYtPnBp
dGNoLCBzZGV2LT5mb3JtYXQsICZkc3RfY2xpcCk7DQo+Pj4+ICvCoMKgwqAgZHJtX2ZiX2Js
aXRfdG9pbyhkc3QsIHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQtPmZvcm1hdCwgdm1hcCwN
Cj4+Pj4gZmIsICZzcmNfY2xpcCk7DQo+Pj4+ICDCoCDCoMKgwqDCoMKgIGRybV9kZXZfZXhp
dChpZHgpOw0KPj4+PiAgwqAgfQ0KPj4+PiBAQCAtNzk0LDYgKzgwNiw4IEBAIHN0YXRpYyBp
bnQgc2ltcGxlZHJtX2RldmljZV9pbml0X21vZGVzZXQoc3RydWN0DQo+Pj4+IHNpbXBsZWRy
bV9kZXZpY2UgKnNkZXYpDQo+Pj4+ICDCoMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+Pj4gIMKgICvCoMKgwqAgZHJtX3BsYW5l
X2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoJnBpcGUtPnBsYW5lKTsNCj4+Pj4gKw0KPj4+PiAg
wqDCoMKgwqDCoCBkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsNCj4+Pj4gIMKgIMKgwqDC
oMKgwqAgcmV0dXJuIDA7DQo+Pj4+DQo+Pg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------AjIZl1YNSZ8cY3RWhIVPfZFd--

--------------JaHCOaiGH8iuk38ggeJc024l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGKjAsFAwAAAAAACgkQlh/E3EQov+AK
GQ/7BqaWJq7HvS6nuB25+7VRwXtQsbsJKPhDbOArL8NitXTjz5KZyaxwslx3ADoe8RVnFb3LJsQ2
nksCuBnodqQk8f0sl3uX32R/26MO+FT9er4vdJdICJY8yjd0e6Qu6pKQvNzHKMJUz6ObUrlVLoHl
ftYmg4BFqNriy2K8pj3dTsPekY51v5fuYRQRSon8jTvKLHz5Bf31VLluAM0CrFHaIu8TslIjwTb0
oQyX7HXiGjyaNywLMxyxB/FXCIG0YTarSD7oY/FYtDHZCCcpNJoTi7gMuEvva9/X2wBfasH6AMSR
OXV2kFG5ZS0OwoPhncmq0AmoRL+SOwYbvwh4wfhbllm78YaKtYWeb9Zh6OeJp8R4MPiMCcZ+DHXc
KRkD6LQf0rHYkX1gsWzUdGarc5CGlH8c3/qqtRGHZCqZxtikcznwlU4Zb/2jFKEpEmn3flZl9lED
Z18dRxKi+T9xP2wOrKHftpvSY2Bdsh+P+L4RWFF/Du6q79cLbhpxLzEhKRdThAW317ca1La5EsFK
T8Bqj5Ntg2sSS+sRFVa5FzNPpAec4WdXNJew9MBuk+jefGZKA+RBZcOvPLvqqW/DAX7Sz/gah5Vq
epikPIfCwQE7y3u9lNaXrYTrJM0xzeThdzb9nkFSSo+4jIgO6DsBwa4wP+GmtE7LC98kcRji0qSs
Yz8=
=ZQYS
-----END PGP SIGNATURE-----

--------------JaHCOaiGH8iuk38ggeJc024l--
