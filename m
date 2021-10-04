Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB74205DB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 08:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB286E170;
	Mon,  4 Oct 2021 06:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12A06E170
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 06:25:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 433661FDCB;
 Mon,  4 Oct 2021 06:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633328757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNCRLbOPKu3B2MKhm6VfzJe4StkIR7ZjDU1JA6i5zko=;
 b=EcpkGBfHde1rJlB0EJaAYDH5V1NGtts3qJiYfyuAPRZ4U1W02fbZP7IvQOg/beornHcM4Q
 xLUwMNUQMjlQ93DTE8mK5SK22/bjwuX05+YKjKbzAwXGTFVK7awmxAeozWPBpfW1qClWoo
 aFBTmB4NMB6onnT5W8WZ8Un/TL5iw/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633328757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNCRLbOPKu3B2MKhm6VfzJe4StkIR7ZjDU1JA6i5zko=;
 b=D/VWEVlF/mo7/BNFIyln/z/GTni1bnV4ef0T39oP1Ev4VvQ0lcdfywd5lB1CvwqBXKypd7
 xwD/8Y96gopDejDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22BAC139C1;
 Mon,  4 Oct 2021 06:25:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u/91B3WeWmEdYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Oct 2021 06:25:57 +0000
Message-ID: <5b5f5118-34d3-e4ec-8f52-d2577ee7bdfe@suse.de>
Date: Mon, 4 Oct 2021 08:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 08/10] drm/gma500: Set page-caching flags in GEM pin/unpin
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-9-tzimmermann@suse.de>
 <CAMeQTsa8t5rSA4uD2y7QrNduN3QQX2wxjW2Ub=YkpcvgGDBv-Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsa8t5rSA4uD2y7QrNduN3QQX2wxjW2Ub=YkpcvgGDBv-Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Vph3NqMiDDnW1IAe8g8zOCFT"
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
--------------Vph3NqMiDDnW1IAe8g8zOCFT
Content-Type: multipart/mixed; boundary="------------UI4DW0R3CWbAPh5szSU2pVOw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <5b5f5118-34d3-e4ec-8f52-d2577ee7bdfe@suse.de>
Subject: Re: [PATCH 08/10] drm/gma500: Set page-caching flags in GEM pin/unpin
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-9-tzimmermann@suse.de>
 <CAMeQTsa8t5rSA4uD2y7QrNduN3QQX2wxjW2Ub=YkpcvgGDBv-Q@mail.gmail.com>
In-Reply-To: <CAMeQTsa8t5rSA4uD2y7QrNduN3QQX2wxjW2Ub=YkpcvgGDBv-Q@mail.gmail.com>

--------------UI4DW0R3CWbAPh5szSU2pVOw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTAuMjEgdW0gMDA6MTUgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBPbiBUdWUsIFNlcCAyOCwgMjAyMSBhdCAxMDo0NCBBTSBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gQ2FjaGluZyBvZiB0aGUgR0VN
IG9iamVjdCdzIGJhY2tpbmcgcGFnZXMgYXJlIHVucmVsYXRlZCB0byBHVFQNCj4+IG1hbmFn
ZW1lbnQuIE1vdmUgdGhlIHJlc3BlY3RpdmUgY2FsbHMgZnJvbSBHVFQgY29kZSB0byBHRU0g
Y29kZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dl
bS5jIHwgIDkgKysrKysrKystDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ3R0LmMg
fCAxNyArKy0tLS0tLS0tLS0tLS0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2d0
dC5oIHwgIDIgKy0NCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
NyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmMNCj4+IGluZGV4IDQ2
MjA5ZTEwZGNjMi4uYTg4ZDUxYTNhYTJhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9nZW0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nZW0u
Yw0KPj4gQEAgLTEzLDYgKzEzLDggQEANCj4+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9wYWdl
bWFwLmg+DQo+Pg0KPj4gKyNpbmNsdWRlIDxhc20vc2V0X21lbW9yeS5oPg0KPj4gKw0KPj4g
ICAjaW5jbHVkZSA8ZHJtL2RybS5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV92bWFfbWFu
YWdlci5oPg0KPj4NCj4+IEBAIC0zOSw3ICs0MSw5IEBAIGludCBwc2JfZ2VtX3BpbihzdHJ1
Y3QgZ3R0X3JhbmdlICpndCkNCj4+DQo+PiAgICAgICAgICBucGFnZXMgPSBndC0+Z2VtLnNp
emUgLyBQQUdFX1NJWkU7DQo+Pg0KPj4gLSAgICAgICByZXQgPSBwc2JfZ3R0X2luc2VydChk
ZXYsIGd0LCAwKTsNCj4+ICsgICAgICAgc2V0X3BhZ2VzX2FycmF5X3djKHBhZ2VzLCBucGFn
ZXMpOw0KPj4gKw0KPj4gKyAgICAgICByZXQgPSBwc2JfZ3R0X2luc2VydChkZXYsIGd0KTsN
Cj4+ICAgICAgICAgIGlmIChyZXQpDQo+PiAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Ry
bV9nZW1fcHV0X3BhZ2VzOw0KPj4NCj4+IEBAIC04MCw2ICs4NCw5IEBAIHZvaWQgcHNiX2dl
bV91bnBpbihzdHJ1Y3QgZ3R0X3JhbmdlICpndCkNCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKGdwdV9iYXNlICsgZ3QtPm9mZnNldCksIGd0LT5ucGFnZSwg
MCwgMCk7DQo+PiAgICAgICAgICBwc2JfZ3R0X3JlbW92ZShkZXYsIGd0KTsNCj4+DQo+PiAr
ICAgICAgIC8qIFJlc2V0IGNhY2hpbmcgZmxhZ3MgKi8NCj4+ICsgICAgICAgc2V0X3BhZ2Vz
X2FycmF5X3diKGd0LT5wYWdlcywgZ3QtPm5wYWdlKTsNCj4+ICsNCj4+ICAgICAgICAgIGRy
bV9nZW1fcHV0X3BhZ2VzKCZndC0+Z2VtLCBndC0+cGFnZXMsIHRydWUsIGZhbHNlKTsNCj4+
ICAgICAgICAgIGd0LT5wYWdlcyA9IE5VTEw7DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2d0dC5j
DQo+PiBpbmRleCA1ZDk0MGZkYmU2YjguLjI0NGRlNjE4ZTYxMiAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ3R0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvZ3R0LmMNCj4+IEBAIC03LDEwICs3LDYgQEANCj4+ICAgICogICAgICAgICBB
bGFuIENveCA8YWxhbkBsaW51eC5pbnRlbC5jb20+DQo+PiAgICAqLw0KPj4NCj4+IC0jaW5j
bHVkZSA8bGludXgvc2htZW1fZnMuaD4NCj4+IC0NCj4+IC0jaW5jbHVkZSA8YXNtL3NldF9t
ZW1vcnkuaD4NCj4+IC0NCj4+ICAgI2luY2x1ZGUgInBzYl9kcnYuaCINCj4+DQo+Pg0KPj4g
QEAgLTkyLDE3ICs4OCwxNSBAQCBzdGF0aWMgdTMyIF9faW9tZW0gKnBzYl9ndHRfZW50cnko
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGd0dF9yYW5nZSAqcikNCj4+ICAgICog
ICAgIHBzYl9ndHRfaW5zZXJ0ICAtICAgICAgIHB1dCBhbiBvYmplY3QgaW50byB0aGUgR1RU
DQo+PiAgICAqICAgICBAZGV2OiBvdXIgRFJNIGRldmljZQ0KPj4gICAgKiAgICAgQHI6IG91
ciBHVFQgcmFuZ2UNCj4+IC0gKiAgICAgQHJlc3VtZTogb24gcmVzdW1lDQo+PiAgICAqDQo+
PiAgICAqICAgICBUYWtlIG91ciBwcmVhbGxvY2F0ZWQgR1RUIHJhbmdlIGFuZCBpbnNlcnQg
dGhlIEdFTSBvYmplY3QgaW50bw0KPj4gICAgKiAgICAgdGhlIEdUVC4gVGhpcyBpcyBwcm90
ZWN0ZWQgdmlhIHRoZSBndHQgbXV0ZXggd2hpY2ggdGhlIGNhbGxlcg0KPj4gICAgKiAgICAg
bXVzdCBob2xkLg0KPj4gICAgKi8NCj4+IC1pbnQgcHNiX2d0dF9pbnNlcnQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IGd0dF9yYW5nZSAqciwgaW50IHJlc3VtZSkNCj4+ICtp
bnQgcHNiX2d0dF9pbnNlcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGd0dF9y
YW5nZSAqcikNCj4+ICAgew0KPj4gICAgICAgICAgdTMyIF9faW9tZW0gKmd0dF9zbG90Ow0K
Pj4gICAgICAgICAgdTMyIHB0ZTsNCj4+IC0gICAgICAgc3RydWN0IHBhZ2UgKipwYWdlczsN
Cj4+ICAgICAgICAgIGludCBpOw0KPj4NCj4+ICAgICAgICAgIGlmIChyLT5wYWdlcyA9PSBO
VUxMKSB7DQo+PiBAQCAtMTEzLDEyICsxMDcsNiBAQCBpbnQgcHNiX2d0dF9pbnNlcnQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGd0dF9yYW5nZSAqciwgaW50IHJlc3VtZSkN
Cj4+ICAgICAgICAgIFdBUk5fT04oci0+c3RvbGVuKTsgICAgIC8qIHJlZmNvdW50IHRoZXNl
IG1heWJlID8gKi8NCj4+DQo+PiAgICAgICAgICBndHRfc2xvdCA9IHBzYl9ndHRfZW50cnko
ZGV2LCByKTsNCj4+IC0gICAgICAgcGFnZXMgPSByLT5wYWdlczsNCj4+IC0NCj4+IC0gICAg
ICAgaWYgKCFyZXN1bWUpIHsNCj4+IC0gICAgICAgICAgICAgICAvKiBNYWtlIHN1cmUgY2hh
bmdlcyBhcmUgdmlzaWJsZSB0byB0aGUgR1BVICovDQo+PiAtICAgICAgICAgICAgICAgc2V0
X3BhZ2VzX2FycmF5X3djKHBhZ2VzLCByLT5ucGFnZSk7DQo+PiAtICAgICAgIH0NCj4gDQo+
IEkgZG9uJ3QgcXVpdGUgcmVtZW1iZXIgd2h5IHdlIGhhdmUgdGhpcyBidXQgSSBzdXNwZWN0
IHNvbWV0aGluZyBiYWQNCj4gaGFwcGVuZWQgd2hlbiBzZXR0aW5nIFdDIG9uIGEgcGFnZSB3
aXRoIFdDIGFscmVhZHkgc2V0LiBEaWQgeW91IHRyeQ0KPiBoaWJlcm5hdGlvbj8NCg0KSSB0
b29rIHRoZSBjb2RlIGFzLWlzLiBJIGd1ZXNzIHRoYXQgcmVhZGluZyBiYWNrIEJPIG1lbW9y
eSB3aXRoIHJlYWQgDQpjYWNoaW5nIGVuYWJsZWQgZGlkbid0IHdvcmsgd2VsbCB3aGVuIGZi
ZGV2IGFjY2VsZXJhdGlvbiB3YXMgc3RpbGwgYXJvdW5kLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPj4NCj4+ICAgICAgICAgIC8qIFdyaXRlIG91ciBwYWdlIGVudHJpZXMg
aW50byB0aGUgR1RUIGl0c2VsZiAqLw0KPj4gICAgICAgICAgZm9yIChpID0gMDsgaSA8IHIt
Pm5wYWdlOyBpKyspIHsNCj4+IEBAIC0xNTgsNyArMTQ2LDYgQEAgdm9pZCBwc2JfZ3R0X3Jl
bW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZ3R0X3JhbmdlICpyKQ0KPj4g
ICAgICAgICAgZm9yIChpID0gMDsgaSA8IHItPm5wYWdlOyBpKyspDQo+PiAgICAgICAgICAg
ICAgICAgIGlvd3JpdGUzMihwdGUsIGd0dF9zbG90KyspOw0KPj4gICAgICAgICAgaW9yZWFk
MzIoZ3R0X3Nsb3QgLSAxKTsNCj4+IC0gICAgICAgc2V0X3BhZ2VzX2FycmF5X3diKHItPnBh
Z2VzLCByLT5ucGFnZSk7DQo+PiAgIH0NCj4+DQo+PiAgIHN0YXRpYyB2b2lkIHBzYl9ndHRf
YWxsb2Moc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+IEBAIC0zNDksNyArMzM2LDcgQEAg
aW50IHBzYl9ndHRfcmVzdG9yZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gICAgICAg
ICAgd2hpbGUgKHIgIT0gTlVMTCkgew0KPj4gICAgICAgICAgICAgICAgICByYW5nZSA9IGNv
bnRhaW5lcl9vZihyLCBzdHJ1Y3QgZ3R0X3JhbmdlLCByZXNvdXJjZSk7DQo+PiAgICAgICAg
ICAgICAgICAgIGlmIChyYW5nZS0+cGFnZXMpIHsNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHBzYl9ndHRfaW5zZXJ0KGRldiwgcmFuZ2UsIDEpOw0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcHNiX2d0dF9pbnNlcnQoZGV2LCByYW5nZSk7DQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZSArPSByYW5nZS0+cmVzb3VyY2UuZW5kIC0gcmFuZ2UtPnJlc291
cmNlLnN0YXJ0Ow0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJlc3RvcmVkKys7DQo+
PiAgICAgICAgICAgICAgICAgIH0NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2d0dC5oIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9ndHQuaA0KPj4gaW5kZXgg
NDU5YTAzMTQxZThiLi43YWY3MTYxN2UwYzUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2d0dC5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2d0
dC5oDQo+PiBAQCAtNDksNyArNDksNyBAQCBpbnQgcHNiX2d0dF9hbGxvY2F0ZV9yZXNvdXJj
ZShzdHJ1Y3QgZHJtX3BzYl9wcml2YXRlICpwZGV2LCBzdHJ1Y3QgcmVzb3VyY2UgKnJlcw0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIHJl
c291cmNlX3NpemVfdCBzaXplLCByZXNvdXJjZV9zaXplX3QgYWxpZ24sDQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBzdG9sZW4sIHUzMiBvZmZzZXRbc3RhdGlj
IDFdKTsNCj4+DQo+PiAtaW50IHBzYl9ndHRfaW5zZXJ0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHN0cnVjdCBndHRfcmFuZ2UgKnIsIGludCByZXN1bWUpOw0KPj4gK2ludCBwc2JfZ3R0
X2luc2VydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZ3R0X3JhbmdlICpyKTsN
Cj4+ICAgdm9pZCBwc2JfZ3R0X3JlbW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZ3R0X3JhbmdlICpyKTsNCj4+DQo+PiAgICNlbmRpZg0KPj4gLS0NCj4+IDIuMzMuMA0K
Pj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------UI4DW0R3CWbAPh5szSU2pVOw--

--------------Vph3NqMiDDnW1IAe8g8zOCFT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFannQFAwAAAAAACgkQlh/E3EQov+DH
VRAAwklGMkNYAyUIxmWxuOnzIaXf1/3gjosrBtbGEvQI1FHlP3ad8b6r7X2H5DjhLgzHO7rymLwi
6qqcFq7cOP1joQ7ahyjeZh5j58JxVcLqprqT29RgC9fcRYKdRZf2eO7urrhEHPmfPANynZ++Y5sR
ykp/1JFr9npdl6QeyZAAswj6uMr9nWINfXrWLvPhzp+PSl7XxhwWBVDNMpfz2TBWErVu4rB/gr4j
4BNwEI3qB7zrVJXL9dTqnFn3MTnYnmvUZdUUk+Ch5qgI6bdNFRPbdf+u/4RBvNa2cCeoi3ZJuMnY
ivQlybWp9NEQDFNNkiRsPZGmz3VFMz17W1llKkR2A/50oCN/po1ZJt0e9EnrdUPGDHp106uMRPKG
Mxk0oEOKu9qq72HhGRpHgqBszI5bGvrCTIWsWPajLACzobgO4Ph66DYqgodqS+pVp52LtyIJDddz
uMFaMhFXQ5r8RuH0EQEvhsuYVW9UzJ1FBLEjBGpib2XcQYAJIIknLW3TodH/y2bNqRe05s6Qzglq
IdYpBdsG0ZCGopLy4x7/msovTBOKr6Z5/82tYUkOVnF5VnLUp9IF04z/I4nsRGvdVNZ2CEvILlzT
PLEQ6PEA1jnSBCtgjk6LLaLLSMK7ioLSVPeav6pplhlBo0HCTE12Pn17lsv9nJZSOJZ7fWWw1FsY
guQ=
=h+h+
-----END PGP SIGNATURE-----

--------------Vph3NqMiDDnW1IAe8g8zOCFT--
