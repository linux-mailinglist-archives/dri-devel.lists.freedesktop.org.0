Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D150DAD2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B791910E156;
	Mon, 25 Apr 2022 08:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA4E10E159
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:02:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD0361F37D;
 Mon, 25 Apr 2022 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650873741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5Tk4oDFEanymODdq96eWOFTX3QvPF5TUrMk/o4N45Q=;
 b=g4nHKPDAkhLvkjXM4pdWMiQsK2suLUPfdXpvl1Jw8oRtRyenhbQi9rKtMw/OS2WcEi1t9g
 tdD5KZgYKVTUe04zCpouJctpYK1eTyt5zsZiTRGaNSCX9j8ftW/dqVjV8oiuO+hwlghjci
 lO+BZACO1z9d9o07ZAcoaDL7sMfrIhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650873741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5Tk4oDFEanymODdq96eWOFTX3QvPF5TUrMk/o4N45Q=;
 b=goixNxvVmoPUYuf6KSnxv9IRh8uXsBDfEv6m8OKISwxdwycx2D3cCTgwhD97aie3pkZyBn
 WgSMaYAdq/RFzUBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A295813AED;
 Mon, 25 Apr 2022 08:02:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ++jLJo1VZmKbcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 08:02:21 +0000
Message-ID: <586da154-5494-aaab-aa07-30f77daebbc2@suse.de>
Date: Mon, 25 Apr 2022 10:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/5] firmware: sysfb: Make sysfb_create_simplefb()
 return a pdev pointer
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220420085303.100654-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p9b3lgGX5M0ZNMnk3qxrzvXd"
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
Cc: Miaoqian Lin <linmq006@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p9b3lgGX5M0ZNMnk3qxrzvXd
Content-Type: multipart/mixed; boundary="------------cvHUVJ0gd3HRdWMecaNGN0D2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Miaoqian Lin <linmq006@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Borislav Petkov <bp@suse.de>
Message-ID: <586da154-5494-aaab-aa07-30f77daebbc2@suse.de>
Subject: Re: [PATCH v3 1/5] firmware: sysfb: Make sysfb_create_simplefb()
 return a pdev pointer
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-2-javierm@redhat.com>
In-Reply-To: <20220420085303.100654-2-javierm@redhat.com>

--------------cvHUVJ0gd3HRdWMecaNGN0D2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjA0LjIyIHVtIDEwOjUyIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGlzIGZ1bmN0aW9uIGp1c3QgcmV0dXJuZWQgMCBvbiBzdWNjZXNzIG9yIGFu
IGVycm5vIGNvZGUgb24gZXJyb3IsIGJ1dCBpdA0KPiBjb3VsZCBiZSB1c2VmdWwgZm9yIHN5
c2ZiX2luaXQoKSBjYWxsZXJzIHRvIGhhdmUgYSBwb2ludGVyIHRvIHRoZSBkZXZpY2UuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+IChubyBjaGFuZ2VzIHNpbmNlIHYyKQ0K
PiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBSZWJhc2Ugb24gdG9wIG9mIGxhdGVzdCBkcm0t
bWlzYy1uZXh0IGFuZCBmaXggY29uZmxpY3RzIChEYW5pZWwgVmV0dGVyKS4NCj4gDQo+ICAg
ZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jICAgICAgICAgIHwgIDQgKystLQ0KPiAgIGRyaXZl
cnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4g
ICBpbmNsdWRlL2xpbnV4L3N5c2ZiLmggICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tDQo+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMgYi9kcml2ZXJz
L2Zpcm13YXJlL3N5c2ZiLmMNCj4gaW5kZXggMmJmYmIwNWY3ZDg5Li5iMDMyZjQwYTkyZGUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYw0KPiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL3N5c2ZiLmMNCj4gQEAgLTQ2LDggKzQ2LDggQEAgc3RhdGljIF9faW5p
dCBpbnQgc3lzZmJfaW5pdCh2b2lkKQ0KPiAgIAkvKiB0cnkgdG8gY3JlYXRlIGEgc2ltcGxl
LWZyYW1lYnVmZmVyIGRldmljZSAqLw0KPiAgIAljb21wYXRpYmxlID0gc3lzZmJfcGFyc2Vf
bW9kZShzaSwgJm1vZGUpOw0KPiAgIAlpZiAoY29tcGF0aWJsZSkgew0KPiAtCQlyZXQgPSBz
eXNmYl9jcmVhdGVfc2ltcGxlZmIoc2ksICZtb2RlKTsNCj4gLQkJaWYgKCFyZXQpDQo+ICsJ
CXBkID0gc3lzZmJfY3JlYXRlX3NpbXBsZWZiKHNpLCAmbW9kZSk7DQo+ICsJCWlmICghSVNf
RVJSKHBkKSkNCj4gICAJCQlyZXR1cm4gMDsNCj4gICAJfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jIGIvZHJpdmVycy9maXJtd2Fy
ZS9zeXNmYl9zaW1wbGVmYi5jDQo+IGluZGV4IGJkYTg3MTJiZmQ4Yy4uYTM1M2UyN2Y4M2Y1
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMNCj4g
KysrIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jDQo+IEBAIC01Nyw4ICs1
Nyw4IEBAIF9faW5pdCBib29sIHN5c2ZiX3BhcnNlX21vZGUoY29uc3Qgc3RydWN0IHNjcmVl
bl9pbmZvICpzaSwNCj4gICAJcmV0dXJuIGZhbHNlOw0KPiAgIH0NCj4gICANCj4gLV9faW5p
dCBpbnQgc3lzZmJfY3JlYXRlX3NpbXBsZWZiKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAq
c2ksDQo+IC0JCQkJIGNvbnN0IHN0cnVjdCBzaW1wbGVmYl9wbGF0Zm9ybV9kYXRhICptb2Rl
KQ0KPiArX19pbml0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnN5c2ZiX2NyZWF0ZV9zaW1w
bGVmYihjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpLA0KPiArCQkJCQkJICAgICBjb25z
dCBzdHJ1Y3Qgc2ltcGxlZmJfcGxhdGZvcm1fZGF0YSAqbW9kZSkNCj4gICB7DQo+ICAgCXN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkOw0KPiAgIAlzdHJ1Y3QgcmVzb3VyY2UgcmVzOw0K
PiBAQCAtNzYsNyArNzYsNyBAQCBfX2luaXQgaW50IHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYihj
b25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpLA0KPiAgIAkJYmFzZSB8PSAodTY0KXNpLT5l
eHRfbGZiX2Jhc2UgPDwgMzI7DQo+ICAgCWlmICghYmFzZSB8fCAodTY0KShyZXNvdXJjZV9z
aXplX3QpYmFzZSAhPSBiYXNlKSB7DQo+ICAgCQlwcmludGsoS0VSTl9ERUJVRyAic3lzZmI6
IGluYWNjZXNzaWJsZSBWUkFNIGJhc2VcbiIpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4g
KwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICAgCX0NCj4gICANCj4gICAJLyoNCj4g
QEAgLTkzLDcgKzkzLDcgQEAgX19pbml0IGludCBzeXNmYl9jcmVhdGVfc2ltcGxlZmIoY29u
c3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwNCj4gICAJbGVuZ3RoID0gbW9kZS0+aGVpZ2h0
ICogbW9kZS0+c3RyaWRlOw0KPiAgIAlpZiAobGVuZ3RoID4gc2l6ZSkgew0KPiAgIAkJcHJp
bnRrKEtFUk5fV0FSTklORyAic3lzZmI6IFZSQU0gc21hbGxlciB0aGFuIGFkdmVydGlzZWRc
biIpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7DQo+ICAgCX0NCj4gICAJbGVuZ3RoID0gUEFHRV9BTElHTihsZW5ndGgpOw0KPiAgIA0K
PiBAQCAtMTA0LDExICsxMDQsMTEgQEAgX19pbml0IGludCBzeXNmYl9jcmVhdGVfc2ltcGxl
ZmIoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwNCj4gICAJcmVzLnN0YXJ0ID0gYmFz
ZTsNCj4gICAJcmVzLmVuZCA9IHJlcy5zdGFydCArIGxlbmd0aCAtIDE7DQo+ICAgCWlmIChy
ZXMuZW5kIDw9IHJlcy5zdGFydCkNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCXJldHVy
biBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIA0KPiAgIAlwZCA9IHBsYXRmb3JtX2RldmljZV9h
bGxvYygic2ltcGxlLWZyYW1lYnVmZmVyIiwgMCk7DQo+ICAgCWlmICghcGQpDQo+IC0JCXJl
dHVybiAtRU5PTUVNOw0KPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gICANCj4g
ICAJc3lzZmJfYXBwbHlfZWZpX3F1aXJrcyhwZCk7DQo+ICAgDQo+IEBAIC0xMjQsMTAgKzEy
NCwxMCBAQCBfX2luaXQgaW50IHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYihjb25zdCBzdHJ1Y3Qg
c2NyZWVuX2luZm8gKnNpLA0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJZ290byBlcnJfcHV0X2Rl
dmljZTsNCj4gICANCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcGQ7DQo+ICAgDQo+ICAg
ZXJyX3B1dF9kZXZpY2U6DQo+ICAgCXBsYXRmb3JtX2RldmljZV9wdXQocGQpOw0KPiAgIA0K
PiAtCXJldHVybiByZXQ7DQo+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gICB9DQo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N5c2ZiLmggYi9pbmNsdWRlL2xpbnV4L3N5c2Zi
LmgNCj4gaW5kZXggYjBkY2ZhMjZkMDdiLi43MDgxNTJlOTAzN2IgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvbGludXgvc3lzZmIuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L3N5c2ZiLmgN
Cj4gQEAgLTcyLDggKzcyLDggQEAgc3RhdGljIGlubGluZSB2b2lkIHN5c2ZiX2FwcGx5X2Vm
aV9xdWlya3Moc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGQpDQo+ICAgDQo+ICAgYm9vbCBz
eXNmYl9wYXJzZV9tb2RlKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksDQo+ICAgCQkg
ICAgICBzdHJ1Y3Qgc2ltcGxlZmJfcGxhdGZvcm1fZGF0YSAqbW9kZSk7DQo+IC1pbnQgc3lz
ZmJfY3JlYXRlX3NpbXBsZWZiKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksDQo+IC0J
CQkgIGNvbnN0IHN0cnVjdCBzaW1wbGVmYl9wbGF0Zm9ybV9kYXRhICptb2RlKTsNCj4gK3N0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnN5c2ZiX2NyZWF0ZV9zaW1wbGVmYihjb25zdCBzdHJ1
Y3Qgc2NyZWVuX2luZm8gKnNpLA0KPiArCQkJCQkgICAgICBjb25zdCBzdHJ1Y3Qgc2ltcGxl
ZmJfcGxhdGZvcm1fZGF0YSAqbW9kZSk7DQo+ICAgDQo+ICAgI2Vsc2UgLyogQ09ORklHX1NZ
U0ZCX1NJTVBMRSAqLw0KPiAgIA0KPiBAQCAtODMsMTAgKzgzLDEwIEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBzeXNmYl9wYXJzZV9tb2RlKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ks
DQo+ICAgCXJldHVybiBmYWxzZTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIGlu
dCBzeXNmYl9jcmVhdGVfc2ltcGxlZmIoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwN
Cj4gLQkJCQkJIGNvbnN0IHN0cnVjdCBzaW1wbGVmYl9wbGF0Zm9ybV9kYXRhICptb2RlKQ0K
PiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpzeXNmYl9jcmVhdGVf
c2ltcGxlZmIoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwNCj4gKwkJCQkJCQkgICAg
Y29uc3Qgc3RydWN0IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEgKm1vZGUpDQo+ICAgew0KPiAt
CXJldHVybiAtRUlOVkFMOw0KPiArCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIH0N
Cj4gICANCj4gICAjZW5kaWYgLyogQ09ORklHX1NZU0ZCX1NJTVBMRSAqLw0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------cvHUVJ0gd3HRdWMecaNGN0D2--

--------------p9b3lgGX5M0ZNMnk3qxrzvXd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJmVYwFAwAAAAAACgkQlh/E3EQov+Cc
/w//ZfRJyzKtRKxpw3PkyBZ75t5j3UTedgePeW78iL2lRBza5KzCVrAJgZ0rTtg4arZdlSekw3Um
HhjTo4WOiCkT/G2Jnf8XuDekLbouskdDq16Vunm5/dzJBMg2DpcThMSHHO0K8fDGq/7dtDw/TA4u
hmuB/Xa5skFPk/b4LVk9djrwbsYY6E6BPXsrR0qfhId5IfnBjOzOnwva4zq9D8ZpqMnKhoC4sQkI
8F7uZRErf5EntMUWztlEwT1zH4KP6F7Cv6B7m7lVUVsZdqW1tFlPcguoHJ5GrmpUa8Cnt1rRAg2X
/hOOsqrjwIP3bZRySh7/WSpEWs8Hpi7pC5H9TjWo9+oxoeUXGwWxbeD1A2EBJ/F1s6HDuVqULGds
vARxU0Y2zWvoeHNtUAF3ayu0ciuyCW1mIyjCmt/GtGbd5CupEOT6qwMhxsHdcZ5IbZp1RMkK9DFc
2n4AqzpSlQOUT4H72bPqFO0ba8AVjBS+dFReqIUmGa4WlaEoQfMxpu0MWZ2IAxz2GNCkQoMXYZv4
E+hM14LBnLNxMzu0lgn8HG73xneVZSQOI7SdrJa6lvfaclb/UJaczppOjvncWwn3Vkt5VAqpSZdb
kkmeIGIgqF7FB5Ph6ulrpviFkxkYGpic+Nv7dATHtL+JNnctfZu4E055+VmwuLVmAD3vJWPArqHD
kQQ=
=L3B5
-----END PGP SIGNATURE-----

--------------p9b3lgGX5M0ZNMnk3qxrzvXd--
