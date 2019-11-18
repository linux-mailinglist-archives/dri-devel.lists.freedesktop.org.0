Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE7100752
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 15:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02A6E0D3;
	Mon, 18 Nov 2019 14:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783826E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 14:26:21 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-W7ENaWm_O_mH_K0sVVzvrA-1; Mon, 18 Nov 2019 09:26:19 -0500
Received: by mail-wm1-f72.google.com with SMTP id f11so13208382wmc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 06:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iHCIHa021KtrIgJFlTPQ+vY6/dzyd20TRD7Vo/lm5HE=;
 b=qxgVaDe7MGVTCYgJdqaIVX2Z02tiMd8NaC6AFHbJiETAr38e8SQHJIv0p5NOKayHPs
 f1bgMxJgjHnjZnnf0/ZWy99nHq+0t64L4ROJlTjKAu2i31aceo/Z5ixkmljMahUZ/mLP
 /nIDsApGSI7/Sx6CbBekhfn94nZaEXqIqeD9eTcARBJ1TXOdQQmSkkpJ41SDta9x9DUF
 B85k0bBUz/KsVgOQeEHljaytLoY7/K4yj9N64mzTM725rnKHZEQi/nbhSielAeA2PzXv
 VyyLJeI9RX1EL4I2YXqFSF7lzhxw2PG1MxrxguIsebRDzLCOREFFD8ve4BAxgRMWhPs5
 yEWQ==
X-Gm-Message-State: APjAAAXLlD7D+mNoSoGBM3IeMXcZ0pHOxXhhPdXI4XMXIs4lCMa7GnDl
 skNaADPUQhCL7ut+FtjrC7QyWjlw4+g1oefBrgR/GjuTWBuEk02ovFjhVvEDmmBpquC5rXiSPJ9
 3CLGygjKenrKmG7aaUNqh4UYvNBkb
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr32800262wru.342.1574087177639; 
 Mon, 18 Nov 2019 06:26:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqyw8s6oW6z2GJVtGG2vHr095lOtTd6Ma+k01xRWFEQR8MFkkwe9eal5xJHSRzK7YQNVLVuG8A==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr32800240wru.342.1574087177428; 
 Mon, 18 Nov 2019 06:26:17 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id d13sm22240400wrq.51.2019.11.18.06.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 06:26:16 -0800 (PST)
Subject: Re: [PATCH v2 11/13] drm/modes: parse_cmdline: Explicitly memset the
 passed in drm_cmdline_mode struct
To: Maxime Ripard <mripard@kernel.org>
References: <20191113164434.254159-1-hdegoede@redhat.com>
 <20191113164434.254159-11-hdegoede@redhat.com>
 <20191118122816.GJ4345@gilmour.lan>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ab926b1b-f079-fac9-bf9c-3fcb53fd4d88@redhat.com>
Date: Mon, 18 Nov 2019 15:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191118122816.GJ4345@gilmour.lan>
Content-Language: en-US
X-MC-Unique: W7ENaWm_O_mH_K0sVVzvrA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574087180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/TsVus8zf+rGb/3On5K1HkLkamkGjQGxlmKGz4qQNk=;
 b=Ar5x/1zvpF5LNICH7PbMXtIYx+f9YG3SM7MzJSpu2H4rYmPDJnsRCwYBmRgFrFZKgC01Bz
 jXzUfeMiRtbDuAU83DFT3lpC2loywffqoWvWtOpTIAAmKinYjpwTmGH6Y+kLoesjYBCsjd
 LtO4o6oC0DEymvJS9HJRHVTDVb6Bs7w=
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxOC0xMS0yMDE5IDEzOjI4LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+IE9uIFdlZCwg
Tm92IDEzLCAyMDE5IGF0IDA1OjQ0OjMyUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
IEluc3RlYWQgb2Ygb25seSBzZXR0aW5nIG1vZGUtPnNwZWNpZmllZCBvbiBmYWxzZSBvbiBhbiBl
YXJseSBleGl0IGFuZAo+PiBsZWF2aW5nIGUuZy4gbW9kZS0+YnBwX3NwZWNpZmllZCBhbmQgbW9k
ZS0+cmVmcmVzaF9zcGVjaWZpZWQgYXMgaXMsCj4+IGxldHMgYmUgY29uc2lzdGVudCBhbmQganVz
dCB6ZXJvIG91dCB0aGUgZW50aXJlIHBhc3NlZCBpbiBzdHJ1Y3QgYXQKPj4gdGhlIHRvcCBvZiBk
cm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3RvcigpCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDUgKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4+IGlu
ZGV4IGJlYjc2NGVmZTZiMy4uMWZlZTRhNzFlZmY3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4+
IEBAIC0xNzQ1LDEyICsxNzQ1LDExIEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5l
X2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCj4+ICAgCWNoYXIgKmJwcF9l
bmRfcHRyID0gTlVMTCwgKnJlZnJlc2hfZW5kX3B0ciA9IE5VTEw7Cj4+ICAgCWludCBpLCBsZW4s
IHJldDsKPj4KPj4gKwltZW1zZXQobW9kZSwgMCwgc2l6ZW9mKCptb2RlKSk7Cj4+ICAgCW1vZGUt
PnBhbmVsX29yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTjsK
PiAKPiBUaGUgcmVwb3J0ZWQgZXJyb3IgYnkga2J1aWxkIHJpbmdzIGEgYmVsbC4gSSB0aGluayBJ
IHRyaWVkIHRvIGRvIHRoaXMsCj4gc2F3IHRoYXQgZXJyb3IsIGFuZCB0aGVuIGZvcmdvdCBhYm91
dCBpdC4KPiAKPiBMb29raW5nIG1vcmUgYXQgdGhlIGNvZGUgbm93LCBJIGRvbid0IHNlZSBhbnkg
aW4gYm9jaHMgdGhhdCBsb29rcwo+IHJlYWxseSB3cm9uZy4gRWl0aGVyIHdheSwgd2Ugc2hvdWxk
IGVpdGhlciBmaXggYm9jaHMsIG9yIGFkZCBhCj4gdW5pdC10ZXN0IHRvIGhhdmUgYSB0ZXN0IGZv
ciB0aGUgYm9jaHMgY2FzZSBzbyB0aGF0IHdlIGRvbid0IGhhdmUgdGhhdAo+IGlzc3VlIHNuZWFr
aW5nIGFyb3VuZC4KCk9rLCBmb3IgdGhvc2UgcmVhZGluZyBhbG9uZywgZm9yIHNvbWUgcmVhc29u
IFJlZCBIYXQncyBtYWlscyBzZXJ2ZXIKaGFzIGVhdGVuIHRoZSBrYnVpbGQgcmVwb3J0LiBpbiBj
YXNlIHRoaXMgaGFzIGhhcHBlbmVkIHRvIG1vcmUgcGVvcGxlCndlIGFyZSB0YWxraW5nIGFib3V0
IHRoaXMgcmVwb3J0OgoKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJp
LWRldmVsLzIwMTktTm92ZW1iZXIvMjQ0NTQxLmh0bWwKCk1heGltZSwgbG9va2luZyBhdCB0aGlz
IGNsb3NlciwgdGhlIGJvY2hzIGRyaXZlciBpbmRlZWQgZG9lcyBub3QgZG8KYW55dGhpbmcgd3Jv
bmcsIG15IHBhdGNoIGRvZXMuIEluc3RlYWQgb2YgdGhhdCBJIGRlbGV0ZWQgdGhlOgoKCQltb2Rl
LT5zcGVjaWZpZWQgPSBmYWxzZTsKCmxpbmUsIEkgZGVsZXRlZCB0aGU6CgoJCXJldHVybiBmYWxz
ZTsKCmxpbmUgaW5zdGVhZCwgc28gdGhlIG51bGwtcHRyIGRlcmVmIGlzIG9uIHRoZSBtb2RlX29w
dGlvbi4gTm8gaWRlYQp3aHkgdGhpcyBpcyBub3QgY3Jhc2hpbmcgdGhpbmdzIGV2ZXJ5d2hlcmUs
IGFzIEkndmUgcnVuIGEga2VybmVsIHdpdGgKdGhlc2UgcGF0Y2hlcywgYWxzbyB3aXRob3V0IGEg
dmlkZW89IG9wdGlvbiBvbiBzZXZlcmFsIGRldmljZXMuLi4KCkFueXdheXMgbGV0IG1lIHNlbmQg
b3V0IGEgdjMgb2YgdGhlIHNldCB3aXRoIHRoaXMgcGF0Y2NoIGZpeGVkIGFuZAp0aGFuayB5b3Ug
Zm9yIHRoZSByZXZpZXdzLgoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
