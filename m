Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE57A924
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1106E4ED;
	Tue, 30 Jul 2019 13:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9C26E4ED
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:03:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so65769931wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q70Pj97ydEjXFcHpayOCsAy4d/xiBzhpgf8R923Flr0=;
 b=SFX8KKl6ZvUYeUB/HC+QgXKdxXMY98mnWHSAn6PLPBaYQyG2+veYHrSScmgeJ9RwmF
 XK6DHvn8p4+thlAi19Onn1HxwKwVuehPMXCyUVqbrIg9sSPZUU6w+TBcDm8gNgV9O2u0
 qDIX7M07ZljwR2W/OtFh1lHJOc6Upf9O+0lriglTo6tHHUfBytANRizb2fEd+C7JwRng
 Qm2/0xXMWkOw1xcltvEzwS+4FsMJRmLgqGdCcRLGuIRX3RwwDDR03jqhqI+zY5I9NS5C
 K8hiCrQZga4ZwPpytejmm7tEEoXsb6k9gaX8HIhukTkp+IRQ4a8KspLhgA3KuuFkdo3h
 MO3Q==
X-Gm-Message-State: APjAAAV4Cwk6qtlYjUSfimUZ25hxhczWa4TauBHcAlqYLaFhPysAj2PI
 miLEr4Tgx560vd5RQAZy35FW3YKVLSs=
X-Google-Smtp-Source: APXvYqx7U8wzeQgk2ydVTfJfTl6lIsyv3KDr6yI4sB6MQNGgjtJVjnH09RhyoDJywpscecW2ajnzXw==
X-Received: by 2002:adf:80e6:: with SMTP id 93mr89685383wrl.298.1564491808512; 
 Tue, 30 Jul 2019 06:03:28 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id w25sm61226338wmk.18.2019.07.30.06.03.27
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 06:03:27 -0700 (PDT)
Subject: Re: [PATCH] drm: Add Grain Media GM12U320 driver v2
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190721132525.10396-1-hdegoede@redhat.com>
 <20190723072809.GA28827@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <118c7967-042a-3677-aa09-43506b46f8cf@redhat.com>
Date: Tue, 30 Jul 2019 15:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723072809.GA28827@ravnborg.org>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMy0wNy0xOSAwOToyOCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIEhhbnMuCj4g
Cj4gRHJpdmVyIGxvb2tzIGdvb2QuIE5jZSB0byBzZWUgc28gbXVjaCBmdW5jdGlvbmFsaXR5IGlu
IGEgZHJpdmVyIGxlc3MKPiB0aGFuIDEwMDAgbG9jLgo+IAo+IEZvbGxvd2luZyBzb21lIGJpa2Ut
c2hlZGRpbmcgb25seSAtIHRoYXQgc2hvdWxkIGhhdmUgYmVlbiBzZW50IGZvciB2MQo+IGFscmVh
ZHkuIEJ1dCBJIHRob3VnaHQgYmV0dGVyIGxhdGUgdGhlbiBuZXZlci4KClRoYW5rIHlvdSBmb3Ig
dGhlIGZlZWRiYWNrIEkndmUgcHJlcGFyZWQgYSBzbWFsbCBmb2xsb3d1cCBjbGVhbnVwCnBhdGNo
IGFkZHJlc3Npbmcgc29tZSBvZiB5b3VyIHJlbWFya3MuCgo8c25pcD4KCj4+ICsjZGVmaW5lIERS
SVZFUl9OQU1FCQkiZ20xMnUzMjAiCj4+ICsjZGVmaW5lIERSSVZFUl9ERVNDCQkiR3JhaW4gTWVk
aWEgR00xMlUzMjAgVVNCIHByb2plY3RvciBkaXNwbGF5Igo+PiArI2RlZmluZSBEUklWRVJfREFU
RQkJIjIwMTkiCj4+ICsjZGVmaW5lIERSSVZFUl9NQUpPUgkJMQo+PiArI2RlZmluZSBEUklWRVJf
TUlOT1IJCTAKPj4gKyNkZWZpbmUgRFJJVkVSX1BBVENITEVWRUwJMQo+IERSSVZFUl9QQVRDSExF
VkVMIGlzIG5vdCB1c2VkCgpHb29kIG9uZSwgZml4ZWQuCgo8c25pcD4KCj4+ICsJdmFkZHIgPSBk
cm1fZ2VtX3NobWVtX3ZtYXAoZmItPm9ialswXSk7Cj4+ICsJaWYgKElTX0VSUih2YWRkcikpIHsK
Pj4gKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdm1hcCBmYjogJWxkXG4iLCBQVFJfRVJSKHZhZGRy
KSk7Cj4+ICsJCWdvdG8gcHV0X2ZiOwo+PiArCX0KPj4gKwo+PiArCWlmIChmYi0+b2JqWzBdLT5p
bXBvcnRfYXR0YWNoKSB7Cj4+ICsJCXJldCA9IGRtYV9idWZfYmVnaW5fY3B1X2FjY2VzcygKPj4g
KwkJCWZiLT5vYmpbMF0tPmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgRE1BX0ZST01fREVWSUNFKTsK
Pj4gKwkJaWYgKHJldCkgewo+PiArCQkJRFJNX0VSUk9SKCJkbWFfYnVmX2JlZ2luX2NwdV9hY2Nl
c3MgZXJyOiAlZFxuIiwgcmV0KTsKPj4gKwkJCWdvdG8gdnVubWFwOwo+PiArCQl9Cj4+ICsJfQo+
IEhlcmUgdGhlIGNvZGUgdXNlcyBEUk1fRVJST1IoIi4uLiIpOwo+IAo+IAo+PiArCS8qIERvIG5v
dCBsb2cgZXJyb3JzIGNhdXNlZCBieSBtb2R1bGUgdW5sb2FkIG9yIGRldmljZSB1bnBsdWcgKi8K
Pj4gKwlpZiAocmV0ICE9IC1FQ09OTlJFU0VUICYmIHJldCAhPSAtRVNIVVRET1dOKQo+PiArCQlk
ZXZfZXJyKCZnbTEydTMyMC0+dWRldi0+ZGV2LCAiRnJhbWUgdXBkYXRlIGVycm9yOiAlZFxuIiwg
cmV0KTsKPj4gK30KPiBBbmQgaGVyZSBkZXZfZXJyKGRldiwgIi4uLiIpOwo+IEl0IGhhZCBiZWVu
IG1vcmUgY29uc2lzdGVudCB0byB1c2UgRFJNX0RFVl9FUlJPUihkZXYsICIuLi4iKTsgaGVyZS4K
Ckdvb2Qgb25lLCBJJ3ZlIGFkZGVkIGEgc2Vjb25kIGZvbGxvdy11cCBwYXRjaCB1c2luZyBEUk1f
REVWX0VSUk9SCmNvbnNpc3RlbnRseSBldmVyeXdoZXJlLgoKPj4gKy8qIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwo+
PiArLyogZ20xMnUzMjAgY29ubmVjdG9yCQkJCQkJICAgICAgKi8KPj4gKwo+IAo+PiArCj4+ICsj
aWZkZWYgQ09ORklHX1BNCj4+ICtzdGF0aWMgaW50IGdtMTJ1MzIwX3N1c3BlbmQoc3RydWN0IHVz
Yl9pbnRlcmZhY2UgKmludGVyZmFjZSwKPj4gKwkJCSAgICBwbV9tZXNzYWdlX3QgbWVzc2FnZSkK
Pj4gK3sKPiBZb3UgY2FuIHVzZSBfX21heWJlX3VudXNlZCB0byBnZXQgcmlkIG9mIHRoZSAjaWZk
ZWYsCgpSaWdodCwgTm9yYWxmIHNhaWQgdGhhdCB0b28sIGJ1dCBJIGZvcmdvdC4gSSd2ZSBmaXhl
ZCB0aGlzIGluIHRoZSBjbGVhbnVwCnBhdGNoLgoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
