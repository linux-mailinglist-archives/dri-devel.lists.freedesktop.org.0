Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8E62F9EE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC1B10E714;
	Fri, 18 Nov 2022 16:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBF310E76E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:10:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D08B41FD09;
 Fri, 18 Nov 2022 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668787838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7U/1Mi9nox8mJnkOVl/gHzJRLLVp3fDrIQVfSYDlOSk=;
 b=Y0ZMSe4NSFyXZLlqG6uTnBbbqZQ+5up8cQU9/mO9lX9NoQ9QzyEXAGdTaPAQ1ZT2Q5uuwF
 o9bkWSOWAcOmu2YZFJf2PVNgaHt2gpplxc8N0Ovp+Payy6MEChIlgmJcWRWcB771ygaCOC
 QJlkHFrnpTFFwer/NuOtytVafSGwv80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668787838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7U/1Mi9nox8mJnkOVl/gHzJRLLVp3fDrIQVfSYDlOSk=;
 b=Dm4qO+o4PwY0DjSkEMJgZuHF+qUtj76l6vHJ6g7nJtx5QR1gdFhF3ssKdlug51A3U6AuWL
 sH9Z2XDU47M+XQBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D68D13A66;
 Fri, 18 Nov 2022 16:10:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v9N3JX6ud2PffQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 16:10:38 +0000
Message-ID: <dbfd2e78-3250-ba4b-b8e0-96df46ce33a5@suse.de>
Date: Fri, 18 Nov 2022 17:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-8-thierry.reding@gmail.com>
 <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de> <Y3eoeLLOxHaruPOV@orome>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y3eoeLLOxHaruPOV@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------202Dtp8cf83Uuq0DcdWHeP0f"
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------202Dtp8cf83Uuq0DcdWHeP0f
Content-Type: multipart/mixed; boundary="------------5SGVimdwae6OkR82Ao27cYgy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Robin Murphy <robin.murphy@arm.com>
Message-ID: <dbfd2e78-3250-ba4b-b8e0-96df46ce33a5@suse.de>
Subject: Re: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-8-thierry.reding@gmail.com>
 <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de> <Y3eoeLLOxHaruPOV@orome>
In-Reply-To: <Y3eoeLLOxHaruPOV@orome>

--------------5SGVimdwae6OkR82Ao27cYgy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjIgdW0gMTY6NDQgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
T24gRnJpLCBOb3YgMTgsIDIwMjIgYXQgMDQ6MDg6MjNQTSArMDEwMCwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDE3LjExLjIyIHVtIDE5OjQwIHNjaHJp
ZWIgVGhpZXJyeSBSZWRpbmc6DQo+Pj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdA
bnZpZGlhLmNvbT4NCj4+Pg0KPj4+IEFkZCBYQjI0IGFuZCBBQjI0IHRvIHRoZSBsaXN0IG9m
IHN1cHBvcnRlZCBmb3JtYXRzLiBUaGUgZm9ybWF0IGhlbHBlcnMNCj4+PiBzdXBwb3J0IGNv
bnZlcnNpb24gdG8gdGhlc2UgZm9ybWF0cyBhbmQgdGhleSBhcmUgZG9jdW1lbnRlZCBpbiB0
aGUNCj4+PiBzaW1wbGUtZnJhbWVidWZmZXIgZGV2aWNlIHRyZWUgYmluZGluZ3MuDQo+Pj4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
Pg0KPj4+IC0tLQ0KPj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4gLSB0cmVhdCBBQjI0IGFzIFhC
MjQgYW5kIHN1cHBvcnQgYm90aCBhdCB0aGUgc2FtZSB0aW1lDQo+Pj4NCj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyAgICAgICB8IDIgKysNCj4+PiAgICBpbmNs
dWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvc2ltcGxlZmIuaCB8IDEgKw0KPj4+ICAgIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9z
aW1wbGVkcm0uYw0KPj4+IGluZGV4IDdmMzliYzU4ZGE1Mi4uYmExYzIwNTdmYzY1IDEwMDY0
NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+PiBAQCAtNDgzLDYgKzQ4
Myw4IEBAIHN0YXRpYyBpbnQgc2ltcGxlZHJtX2RldmljZV9pbml0X3JlZ3VsYXRvcnMoc3Ry
dWN0IHNpbXBsZWRybV9kZXZpY2UgKnNkZXYpDQo+Pj4gICAgc3RhdGljIGNvbnN0IHVpbnQz
Ml90IHNpbXBsZWRybV9wcmltYXJ5X3BsYW5lX2Zvcm1hdHNbXSA9IHsNCj4+PiAgICAJRFJN
X0ZPUk1BVF9YUkdCODg4OCwNCj4+PiAgICAJRFJNX0ZPUk1BVF9BUkdCODg4OCwNCj4+PiAr
CURSTV9GT1JNQVRfWEJHUjg4ODgsDQo+Pj4gKwlEUk1fRk9STUFUX0FCR1I4ODg4LA0KPj4N
Cj4+IERvZXMgdGhlIGhhcmR3YXJlICpyZWFsbHkqIHN1cHBvcnQgQUI0MiBvbiBpdHMgcHJp
bWFyeSBwbGFuZT8NCj4gDQo+IFllcywgVGVncmEgZGlzcGxheSBoYXJkd2FyZSBzdXBwb3J0
cyB0aGlzIGZvcm1hdCBvbiB0aGUgcHJpbWFyeSBwbGFuZS4NCj4gDQo+PiBXZSByZWNlbnRs
eSBoYWQgYSBkaXNjdXNzaW9uIGFib3V0IHRoZSBleHBvcnRlZCBmb3JtYXRzIGFuZCB0aGUg
Y29uc2Vuc3VzIGlzDQo+PiB0aGF0IHdlIG9ubHkgd2FudCB0aGUgaGFyZHdhcmUncyBuYXRp
dmUgZm9ybWF0cyBwbHVzIFhSR0I4ODguIFRoYXQncyBub3QNCj4+IGltcGxlbWVudGVkIHll
dCBpbiBzaW1wbGVkcm0sIGJ1dCB0aGlzIGZvcm1hdCBsaXN0IHdpbGwgc29vbiBzZWUgYSBs
YXJnZXINCj4+IGNsZWFudXAuDQo+Pg0KPj4gU28gSSB0aGluayBBUkdCODg4OCBsaWtlbHkg
c2hvdWxkbid0IGJlIG9uIHRoZSBsaXN0IGhlcmUuDQo+IA0KPiBUaGlzIGlzIGZvciBjb25z
aXN0ZW5jeSB3aXRoIHRoZSBsaXN0IGJlbG93LiBJZiBhIGRldmljZSB0cmVlIGNsYWltcw0K
PiB0aGF0IHRoZSBmcmFtZWJ1ZmZlciBpcyBBQkdSODg4OCB1c2luZyB0aGUgImE4YjhnOHI4
IiBzdHJpbmcsIHRoZW4NCj4gc2hvdWxkbid0IHdlIHN1cHBvcnQgaXQ/DQoNClRoZSBzaXR1
YXRpb24gaXMgY29tcGxpY2F0ZWQuIFNldmVyYWwgRFRzIGNsYWltIHRoYXQgdGhlaXIgZnJh
bWVidWZmZXJzIA0Kc3VwcG9ydCBBbHBoYStSR0Igd2hlbiB0aGV5IGFjdHVhbGx5IG1lYW4g
WCtSR0IuIEJ1dCBmb3IgY29tcGF0aWJpbGl0eSwgDQp3ZSBjYW5ub3QgY2hhbmdlIHRoaXMg
bm93IEFGQUlVLiBTbyB3ZSdyZSBzdHVjayB3aXRoIFgrUkdCIGZyYW1lYnVmZmVycyANCnRo
YXQgY2xhaW0gdGhhdCB0aGV5IGhhdmUgYW4gYWxwaGEgY2hhbm5lbC4gT1RPSCwgb3RoZXIg
aGFyZHdhcmUgbWlnaHQgDQphY3R1YWxseSBzdXBwb3J0IHRoZSBhbm5vdW5jZWQgYWxwaGEg
Y2hhbm5lbC4gVHJ5aW5nIHRvIHJlbmRlciBpbnRvIGFuIA0KYWxwaGEgY2hhbm5lbCB3b3Vs
ZCB0aGVyZWZvcmUgcHJvZHVjZSB1bmRlZmluZWQgb3V0cHV0Lg0KDQpUaGUgY29uc2Vuc3Vz
IGlzIHRoYXQgd2Ugb25seSB3YW50IHRvIGFubm91bmNlIFhSR0I4ODg4IHBsdXMgdGhlIG5h
dGl2ZSANCmZvcm1hdCB0byB1c2Vyc3BhY2UuIEJ1dCBpZiB0aGUgbmF0aXZlIGZvcm1hdCBo
YXMgYW4gYWxwaGEgY2hhbm5lbCwgd2UnZCANCmFubm91bmNlIHRoZSBub24tYWxwaGEgZm9y
bWF0IGluc3RlYWQuIE91ciBmb3JtYXQtY29udmVyc2lvbiBoZWxwZXJzIA0Kd291bGQgdGhl
biBmaWxsIHRoZSBhbHBoYSBjaGFubmVsIGF1dG9tYXRpY2FsbHkgd2l0aCAweGZmIGR1cmlu
ZyB0aGUgDQpwYWdlZmxpcC4NCg0KKFRoaXMgaGFzbid0IHlldCBiZWVuIGZ1bGx5IGltcGxl
bWVudGVkIGJlY2F1c2Ugd2UgZmlyc3QgbmVlZCB0byBmaXggYSANCmZldyB0aGluZ3MgaW4g
ZmJkZXYgZW11bGF0aW9uIHRvIG1ha2UgaXQgd29yay4pDQoNClRoZXJlZm9yZSBBQkdSODg4
OCBzaG91bGRuJ3QgYmUgb24gdGhlIGxpc3QuIE5vdGUgdGhhdCBhIG5hdGl2ZSBEUk0gDQpk
cml2ZXIgZm9yIHlvdXIgZGlzcGxheSBoYXJkd2FyZSB3b3VsZCBiZSBmcmVlIHRvIGV4cG9y
dCBBQkdSODg4OC4gV2UgDQpvbmx5IGhhdmUgdGhpcyBydWxlIGZvciB0aGUgaGFyZHdhcmUt
YWdub3N0aWMgZHJpdmVycy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhp
ZXJyeQ0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+PiAgICAJ
RFJNX0ZPUk1BVF9SR0I1NjUsDQo+Pj4gICAgCS8vRFJNX0ZPUk1BVF9YUkdCMTU1NSwNCj4+
PiAgICAJLy9EUk1fRk9STUFUX0FSR0IxNTU1LA0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3BsYXRmb3JtX2RhdGEvc2ltcGxlZmIuaCBiL2luY2x1ZGUvbGludXgvcGxhdGZv
cm1fZGF0YS9zaW1wbGVmYi5oDQo+Pj4gaW5kZXggMjdlYTk5YWY2ZTFkLi40Zjk0ZDUyYWM5
OWYgMTAwNjQ0DQo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3NpbXBs
ZWZiLmgNCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvc2ltcGxlZmIu
aA0KPj4+IEBAIC0yMiw2ICsyMiw3IEBADQo+Pj4gICAgCXsgInI4ZzhiOCIsIDI0LCB7MTYs
IDh9LCB7OCwgOH0sIHswLCA4fSwgezAsIDB9LCBEUk1fRk9STUFUX1JHQjg4OCB9LCBcDQo+
Pj4gICAgCXsgIng4cjhnOGI4IiwgMzIsIHsxNiwgOH0sIHs4LCA4fSwgezAsIDh9LCB7MCwg
MH0sIERSTV9GT1JNQVRfWFJHQjg4ODggfSwgXA0KPj4+ICAgIAl7ICJhOHI4ZzhiOCIsIDMy
LCB7MTYsIDh9LCB7OCwgOH0sIHswLCA4fSwgezI0LCA4fSwgRFJNX0ZPUk1BVF9BUkdCODg4
OCB9LCBcDQo+Pj4gKwl7ICJ4OGI4ZzhyOCIsIDMyLCB7MCwgOH0sIHs4LCA4fSwgezE2LCA4
fSwgezAsIDB9LCBEUk1fRk9STUFUX1hCR1I4ODg4IH0sIFwNCj4+PiAgICAJeyAiYThiOGc4
cjgiLCAzMiwgezAsIDh9LCB7OCwgOH0sIHsxNiwgOH0sIHsyNCwgOH0sIERSTV9GT1JNQVRf
QUJHUjg4ODggfSwgXA0KPj4+ICAgIAl7ICJ4MnIxMGcxMGIxMCIsIDMyLCB7MjAsIDEwfSwg
ezEwLCAxMH0sIHswLCAxMH0sIHswLCAwfSwgRFJNX0ZPUk1BVF9YUkdCMjEwMTAxMCB9LCBc
DQo+Pj4gICAgCXsgImEycjEwZzEwYjEwIiwgMzIsIHsyMCwgMTB9LCB7MTAsIDEwfSwgezAs
IDEwfSwgezMwLCAyfSwgRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCB9LCBcDQo+Pg0KPj4gLS0g
DQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------5SGVimdwae6OkR82Ao27cYgy--

--------------202Dtp8cf83Uuq0DcdWHeP0f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3rn4FAwAAAAAACgkQlh/E3EQov+BJ
1A/+PjFnQqRuhc1J85sO09JaXAT1ytgZ2ZjzbS9vIeDukW0qnXijB3YYZWOEvH/7Od29NU7zGu31
3WD3fou/yS1AJ8JYh3wOMCGT8YdYe56DLuPPvfpa5MlNmUlYLPqYduC2/uyuwhGijXwWtanu2qPh
llhMIy0CMZw3Ek8dlv0xfrrOGAhqU39DISP1GckmGwyYhuj1yILM67OYTg6Cxst0D/BVrYDFd+Wi
gubKvOpGxD3UIbr1V+tgFqW0tiYam7z28xujTn8+gK4mDG9rd1Y+91l0K/uYLwtr7n5hB3cw2zgZ
31+5vRqI0XR47cdoi4/7BKErPW9Qu6sVbzylHTP3xOejMIStY4f1VRtiL7tF24/Avr/ELpR1LKpR
UMP1zLCXWbc3E5iEKTF5xasGKDj7RX1IsjpbksFBRNa5XCXW33dwnNv0zNW9dqn6UPSeR+cLB230
nRCtBQJimLvvcCvkpbjxMx3gU7K08njL+nbkW2s1kj5wTS5xy/L4ipKMWQWDdcDaKkcrYL+vorXh
H4JayGVttU5zucCK0p6VVRvBcLklVwZEEovhRn2lbrThh9FyINCHK+LEOkOj/+IytTwFeQ+5qUMa
+uNPHu4e+fhy+GtAmPzAkuk/N7mx77pmqA8V9mWOdYgE7YBDdcFxwCngzSTFiG6g1ob6TzQcQ1uz
rjw=
=WuIS
-----END PGP SIGNATURE-----

--------------202Dtp8cf83Uuq0DcdWHeP0f--
