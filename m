Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C2523216
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1140D10E207;
	Wed, 11 May 2022 11:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E098A10E207
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:47:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BF9521AC9;
 Wed, 11 May 2022 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652269624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6NLoTKB8Il+u9luomrPN0D4Cl37+hCGKl4EXFFIq6Y=;
 b=xi6Ne0MBikiNODvnogcM6BPEc2k8noY0D5ylkiRXqXwBm8nJMRWocrbqe0rPJphFkqjfau
 rSwFRmC77XPStmXXv9C70S4mRJ6CXB1bRqBL5JZkbN9sFeuCeoiOEYFMKCEsI3tblhOBer
 xHYOoNCRlXShV5dmLKqeDJgl354BEtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652269624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6NLoTKB8Il+u9luomrPN0D4Cl37+hCGKl4EXFFIq6Y=;
 b=QVvK59WM/NzTRyWeuSGzu6FNJYvr0pBDFcQEvtaNyRxK8lJcldArRgWdo/x6Yy/mB8EYJz
 JDNjNAVD15tf0bAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51DDC13A76;
 Wed, 11 May 2022 11:47:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OqTQEjiie2JgUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 11:47:04 +0000
Message-ID: <2156c28c-9c9c-555e-ce19-933cdc8d5e74@suse.de>
Date: Wed, 11 May 2022 13:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/7] fbdev: Restart conflicting fb removal loop when
 unregistering devices
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113039.1252432-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220511113039.1252432-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b8iWiyNXe9nSujOxcj9Ba96G"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b8iWiyNXe9nSujOxcj9Ba96G
Content-Type: multipart/mixed; boundary="------------SyppV0A1JoTzJozJoTIp9Vb2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <2156c28c-9c9c-555e-ce19-933cdc8d5e74@suse.de>
Subject: Re: [PATCH v5 3/7] fbdev: Restart conflicting fb removal loop when
 unregistering devices
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113039.1252432-1-javierm@redhat.com>
In-Reply-To: <20220511113039.1252432-1-javierm@redhat.com>

--------------SyppV0A1JoTzJozJoTIp9Vb2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDExLjA1LjIyIHVtIDEzOjMwIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBEcml2ZXJzIHRoYXQgd2FudCB0byByZW1vdmUgcmVnaXN0ZXJl
ZCBjb25mbGljdGluZyBmcmFtZWJ1ZmZlcnMgcHJpb3IgdG8NCj4gcmVnaXN0ZXIgdGhlaXIg
b3duIGZyYW1lYnVmZmVyLCBjYWxscyByZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJz
KCkuDQo+IA0KPiBUaGlzIGZ1bmN0aW9uIHRha2VzIHRoZSByZWdpc3RyYXRpb25fbG9jayBt
dXRleCwgdG8gcHJldmVudCBhIHJhY2VzIHdoZW4NCj4gZHJpdmVycyByZWdpc3RlciBmcmFt
ZWJ1ZmZlciBkZXZpY2VzLiBCdXQgaWYgYSBjb25mbGljdGluZyBmcmFtZWJ1ZmZlcg0KPiBk
ZXZpY2UgaXMgZm91bmQsIHRoZSB1bmRlcmxheWluZyBwbGF0Zm9ybSBkZXZpY2UgaXMgdW5y
ZWdpc3RlcmVkIGFuZCB0aGlzDQo+IHdpbGwgbGVhZCB0byB0aGUgcGxhdGZvcm0gZHJpdmVy
IC5yZW1vdmUgY2FsbGJhY2sgdG8gYmUgY2FsbGVkLCB3aGljaCBpbg0KPiB0dXJuIHdpbGwg
Y2FsbCB0byB0aGUgdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcigpIHRoYXQgdGFrZXMgdGhlIHNh
bWUgbG9jay4NCj4gDQo+IFRvIHByZXZlbnQgdGhpcywgYSBzdHJ1Y3QgZmJfaW5mby5mb3Jj
ZWRfb3V0IGZpZWxkIHdhcyB1c2VkIGFzIGluZGljYXRpb24NCj4gdG8gdW5yZWdpc3Rlcl9m
cmFtZWJ1ZmZlcigpIHdoZXRoZXIgdGhlIG11dGV4IGhhcyB0byBiZSBncmFiYmVkIG9yIG5v
dC4NCj4gDQo+IEEgY2xlYW5lciBzb2x1dGlvbiBpcyB0byBkcm9wIHRoZSBsb2NrIGJlZm9y
ZSBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcigpDQo+IHNvIHVucmVnaXN0ZXJfZnJhbWVi
dWZmZXIoKSBjYW4gdGFrZSBpdCB3aGVuIGNhbGxlZCBmcm9tIHRoZSBmYmRldiBkcml2ZXIs
DQo+IGFuZCBqdXN0IGdyYWIgdGhlIGxvY2sgYWdhaW4gYWZ0ZXIgdGhlIGRldmljZSBoYXMg
YmVlbiByZWdpc3RlcmVkIGFuZCBkbw0KPiBhIHJlbW92YWwgbG9vcCByZXN0YXJ0Lg0KPiAN
Cj4gU2luY2UgdGhlIGZyYW1lYnVmZmVyIGRldmljZXMgd2lsbCBhbHJlYWR5IGJlIHJlbW92
ZWQsIHRoZSBsb29wIHdvdWxkIGp1c3QNCj4gZmluaXNoIHdoZW4gbm8gbW9yZSBjb25mbGlj
dGluZyBmcmFtZWJ1ZmZlcnMgYXJlIGZvdW5kLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gUmV2aWV3
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQoNCkknZCBs
aWtlIHRvIHNocmluayB0aGlzIHBhdGNoc2V0LiBUaGlzIGxvb2tzIGxpa2UgaXQgY2FuIGJl
IG1lcmdlZCANCmltbWVkaWF0ZWx5Pw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0t
LQ0KPiANCj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+IA0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIGlu
Y2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jDQo+IGluZGV4IGI0NDVhN2EwMGRlZi4uMmZkYTU5MTdjMjEy
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiBAQCAtMTU1NSw2ICsx
NTU1LDcgQEAgc3RhdGljIHZvaWQgZG9fcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVy
cyhzdHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYSwNCj4gICB7DQo+ICAgCWludCBpOw0KPiAg
IA0KPiArcmVzdGFydF9yZW1vdmFsOg0KPiAgIAkvKiBjaGVjayBhbGwgZmlybXdhcmUgZmJz
IGFuZCBraWNrIG9mZiBpZiB0aGUgYmFzZSBhZGRyIG92ZXJsYXBzICovDQo+ICAgCWZvcl9l
YWNoX3JlZ2lzdGVyZWRfZmIoaSkgew0KPiAgIAkJc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3Qg
Kmdlbl9hcGVyOw0KPiBAQCAtMTU4NywxMiArMTU4OCwyMyBAQCBzdGF0aWMgdm9pZCBkb19y
ZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHN0cnVjdCBhcGVydHVyZXNfc3RydWN0
ICphLA0KPiAgIAkJCQlwcl93YXJuKCJmYiVkOiBubyBkZXZpY2Ugc2V0XG4iLCBpKTsNCj4g
ICAJCQkJZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihyZWdpc3RlcmVkX2ZiW2ldKTsNCj4g
ICAJCQl9IGVsc2UgaWYgKGRldl9pc19wbGF0Zm9ybShkZXZpY2UpKSB7DQo+IC0JCQkJcmVn
aXN0ZXJlZF9mYltpXS0+Zm9yY2VkX291dCA9IHRydWU7DQo+ICsJCQkJLyoNCj4gKwkJCQkg
KiBEcm9wIHRoZSBsb2NrIGJlY2F1c2UgaWYgdGhlIGRldmljZSBpcyB1bnJlZ2lzdGVyZWQs
IGl0cw0KPiArCQkJCSAqIGRyaXZlciB3aWxsIGNhbGwgdG8gdW5yZWdpc3Rlcl9mcmFtZWJ1
ZmZlcigpLCB0aGF0IHRha2VzDQo+ICsJCQkJICogdGhpcyBsb2NrLg0KPiArCQkJCSAqLw0K
PiArCQkJCW11dGV4X3VubG9jaygmcmVnaXN0cmF0aW9uX2xvY2spOw0KPiAgIAkJCQlwbGF0
Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcih0b19wbGF0Zm9ybV9kZXZpY2UoZGV2aWNlKSk7DQo+
ICsJCQkJbXV0ZXhfbG9jaygmcmVnaXN0cmF0aW9uX2xvY2spOw0KPiAgIAkJCX0gZWxzZSB7
DQo+ICAgCQkJCXByX3dhcm4oImZiJWQ6IGNhbm5vdCByZW1vdmUgZGV2aWNlXG4iLCBpKTsN
Cj4gICAJCQkJZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihyZWdpc3RlcmVkX2ZiW2ldKTsN
Cj4gICAJCQl9DQo+ICsJCQkvKg0KPiArCQkJICogUmVzdGFydCB0aGUgcmVtb3ZhbCBsb29w
IG5vdyB0aGF0IHRoZSBkZXZpY2UgaGFzIGJlZW4NCj4gKwkJCSAqIHVucmVnaXN0ZXJlZCBh
bmQgaXRzIGFzc29jaWF0ZWQgZnJhbWVidWZmZXIgZ29uZS4NCj4gKwkJCSAqLw0KPiArCQkJ
Z290byByZXN0YXJ0X3JlbW92YWw7DQo+ICAgCQl9DQo+ICAgCX0NCj4gICB9DQo+IEBAIC0x
ODk5LDEzICsxOTExLDkgQEAgRVhQT1JUX1NZTUJPTChyZWdpc3Rlcl9mcmFtZWJ1ZmZlcik7
DQo+ICAgdm9pZA0KPiAgIHVucmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8g
KmZiX2luZm8pDQo+ICAgew0KPiAtCWJvb2wgZm9yY2VkX291dCA9IGZiX2luZm8tPmZvcmNl
ZF9vdXQ7DQo+IC0NCj4gLQlpZiAoIWZvcmNlZF9vdXQpDQo+IC0JCW11dGV4X2xvY2soJnJl
Z2lzdHJhdGlvbl9sb2NrKTsNCj4gKwltdXRleF9sb2NrKCZyZWdpc3RyYXRpb25fbG9jayk7
DQo+ICAgCWRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoZmJfaW5mbyk7DQo+IC0JaWYgKCFm
b3JjZWRfb3V0KQ0KPiAtCQltdXRleF91bmxvY2soJnJlZ2lzdHJhdGlvbl9sb2NrKTsNCj4g
KwltdXRleF91bmxvY2soJnJlZ2lzdHJhdGlvbl9sb2NrKTsNCj4gICB9DQo+ICAgRVhQT1JU
X1NZTUJPTCh1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKTsNCj4gICANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaA0KPiBpbmRleCA2OWM2
N2M3MGZhNzguLmJiZTFlNDU3MTg5OSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9m
Yi5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaA0KPiBAQCAtNTExLDcgKzUxMSw2IEBA
IHN0cnVjdCBmYl9pbmZvIHsNCj4gICAJfSAqYXBlcnR1cmVzOw0KPiAgIA0KPiAgIAlib29s
IHNraXBfdnRfc3dpdGNoOyAvKiBubyBWVCBzd2l0Y2ggb24gc3VzcGVuZC9yZXN1bWUgcmVx
dWlyZWQgKi8NCj4gLQlib29sIGZvcmNlZF9vdXQ7IC8qIHNldCB3aGVuIGJlaW5nIHJlbW92
ZWQgYnkgYW5vdGhlciBkcml2ZXIgKi8NCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbmxp
bmUgc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3QgKmFsbG9jX2FwZXJ0dXJlcyh1bnNpZ25lZCBp
bnQgbWF4X251bSkgew0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------SyppV0A1JoTzJozJoTIp9Vb2--

--------------b8iWiyNXe9nSujOxcj9Ba96G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ7ojcFAwAAAAAACgkQlh/E3EQov+CU
WBAAkEaItcvdzg273rLKVt/jQAP9+QwE14Se+zrQRJqgqNtxhcheX93S4kKmNGi2YjTnqJvuwhM0
lNqocETHg+JhWgupdEOET/iO8VuO92UBizbIf7h/QBP9+vRAPQtBgP1J+isSG8XF7Bd5mStRu0cG
I7aCvFg8ul2mk+BjlxDQbPMWMa7avM1uxDJ+0Ozr0B2vuMOa18d0aRViD9V41EcIr+G1T1tCUpsc
MiltlsaZKecfjnraZnRi2NubMcMkxwggGZ+dUYzAz2Ck+3Z5KUsetPmejJJX4xTT34v6ZUfm510q
k5yld8N47e/K2s31subn3ecypaHsyk8oG5e3hkKo1HgqcFkovmXRvuUA2rIUkivHxqArPngixAig
Yhzul7YqMbChPc5TAAEJYp6YHBGRwbcereRcwt1xOKRyLEUfIU+d8VhOP4Vbh77OxYqH0MPMk7Ov
S1uurA3Ca4RdJe5V7npDCSJu2m3GC25r+wz+afl3fGeF80J6YboZYsF+7gxS7HtbocsoEjpckkk6
eP9PVukN+16IrHLGkC+jgLwAW6Biv/b6tkOdmYBZV45j3j3R44rLd1X9LWzhVRMfAlWwt8xM0Tp1
jGyBcLwI/dEq3yeQ2N8j6WQ6daRywT5hhTa9uxxe1f3RYjbQFPRBrMcSs2ZA7ver3Fct9wHSmfbu
slc=
=lJOK
-----END PGP SIGNATURE-----

--------------b8iWiyNXe9nSujOxcj9Ba96G--
