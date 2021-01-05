Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AE2EA357
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 03:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73B189BA1;
	Tue,  5 Jan 2021 02:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F25D89BA1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 02:27:26 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id n25so20339653pgb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 18:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=PRqghBQCezpF4101r4+aeMVY7BndpqHmm2VKbm8JDpY=;
 b=F2qbqxFbUlgt2yhECjDqxxONwyjp+UMru0yvfQ1E6IFD1VphsMPCK9L8Vm7qm587Ls
 2PLA6DUgmFwmsDSFbyAh7LArEFEfwUS0QzsGU26ZSQw4k38kYTAI66LXCyRkUbGSV76d
 T+8POfBWb+oVKy2Tm6BQnlfDqM+iGois6sfHb5BWVkau/yL/BN3nEH6EfgOo1EVZ8rc8
 nkF466xuP0waoduQObyPGSGIsvt5Fu+pdwje/1fC3OlEU+c4n79sN15m/qmlaeSrBAQb
 0aZp4uGhswV+nGHX+PdwKoelnqd1/keC8DfR+umKRjMQoyCVmM7BMjdUBtXsIC7gygKt
 J0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=PRqghBQCezpF4101r4+aeMVY7BndpqHmm2VKbm8JDpY=;
 b=dfP27Ny8+bdqZ26mOE+XyFL6q/jFxzeTunP4xrVYmPczYCGYGWa4lOmQZU87p0nSw7
 uy9vJGOl3KNsUyxor6wIi5Tq746W9YXnHoDAA5rta2NnHrjJHufAZ6Wv85U8e6QQsd7/
 YQM6sK41yWI5RWd/LbkEjbzwLaFcANUvj2U8yf4TJyb6/RsDHgQCZo3aCcwOlnqaG4Mm
 TkXFzeKOEO2rmjB4dJY0biFD4ybTPpnm0NJmCskGZx4xVELsiNvUXYwXIMVTttDKLt+E
 gEREBrCaoBn9ht6x7v2PuR1ZzKb26tfOPTLOadfQ0Napxw0aVVkQm4/reQqpVjBYa37d
 pI7Q==
X-Gm-Message-State: AOAM531xit97BnGexaSDWsT+6LY+5Bu9EGoaxeKUfaGe/tiRaDsFxjxL
 ObEQXSOOOLOzNXl7UyTUQyY=
X-Google-Smtp-Source: ABdhPJwVs/+l19N7R69vDvY824a+P6c8VUB3XnFA8IpjUSmI9ddcz7mEl+Vfozs5zDyGEcP/Ecu8tQ==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr74096667pgc.185.1609813645940; 
 Mon, 04 Jan 2021 18:27:25 -0800 (PST)
Received: from [192.168.1.8] (50-47-106-83.evrt.wa.frontiernet.net.
 [50.47.106.83])
 by smtp.gmail.com with ESMTPSA id s5sm55454610pfh.5.2021.01.04.18.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 18:27:25 -0800 (PST)
Message-ID: <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-hyperv@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Mon, 04 Jan 2021 18:27:24 -0800
In-Reply-To: <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
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
Cc: Wei Hu <weh@microsoft.com>, Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTAxLTA0IGF0IDE0OjAzICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPiBIaSwKPiAKPiBJJ3ZlIGJlZW4gbG9va2luZyBmb3J3YXJkIHRvIHRoaXMgcGF0Y2hzZXQu
IDopIFRoZSBjb2RlIGlzIHJlYWxseQo+IG5pY2UgCj4gYWxyZWFkeS4KClRoYW5rcyBUaG9tYXMg
Zm9yIHRoZSByZXZpZXcuCgoKPiA+IMKgIAo+ID4gK2NvbmZpZyBEUk1fSFlQRVJWCj4gPiArwqDC
oMKgwqDCoMKgwqB0cmlzdGF0ZSAiRFJNIFN1cHBvcnQgZm9yIGh5cGVydiBzeW50aGV0aWMgdmlk
ZW8gZGV2aWNlIgo+ID4gK8KgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIE1N
VSAmJiBIWVBFUlYKPiA+ICvCoMKgwqDCoMKgwqDCoHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ID4g
K8KgwqDCoMKgwqDCoMKgc2VsZWN0IERSTV9HRU1fU0hNRU1fSEVMUEVSCj4gCj4gU0hNRU0gaGVs
cGVycyBtaWdodCBub3QgYmUgYSBnb29kIGNob2ljZSwgYmVjYXVzZSB5b3UgbmVlZCB0aGlzIGJs
aXQgCj4gY29kZSwgd2hpY2ggaGFzIGEgbWVtY3B5Lgo+IAo+IEkgZ3Vlc3MgaXQncyBlYXNpbHkg
cG9zc2libGUgdG8gY29uZmlndXJlIDE2IE1pQiBvciBtb3JlIGZvciB0aGUKPiBndWVzdCdzIAo+
IFZSQU0/IElmIHNvLCBJIHN1Z2dlc3QgdG8gdXNlIFZSQU0gaGVscGVycy4gR3Vlc3RzIHdpbGwg
YmUgYWJsZSB0byAKPiByZW5kZXIgaW50byBWUkFNIGRpcmVjdGx5IHdpdGggdGhlIGRyaXZlcidz
IG1lbWNweS4gVGhlIGRyaXZlciB3aWxsCj4gZG8gCj4gcGFnZSBmbGlwcGluZy4gVGhlIGJvY2hz
IGRyaXZlciB3b3VsZCBiZSBhbiBleGFtcGxlLgo+IAo+IEh5cGVydiBkb2Vzbid0IG5lZWQgYnVm
ZmVyIHNoYXJpbmcgd2l0aCBvdGhlciBkZXZpY2VzLCBJIGd1ZXNzPwo+IAoKSXQncyBub3QgcG9z
c2libGUgdG8gZG8gcGFnZSBmbGlwIHdpdGggdGhpcyB2aXJ0dWFsIGRldmljZS4gVGhlIGNhbGwg
dG8KU1lOVEhWSURfVlJBTV9MT0NBVElPTiBpcyBvbmx5IGhvbm91cmVkIG9uY2UuIFNvIHVuZm9y
dHVuYXRlbHkgbmVlZCB0bwp1c2UgU0hNRU0gaGVscGVycy4KCj4gPiArI2RlZmluZSBQQ0lfVkVO
RE9SX0lEX01JQ1JPU09GVCAweDE0MTQKPiA+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSFlQRVJW
X1ZJREVPIDB4NTM1Mwo+ID4gKwo+ID4gK3N0cnVjdCBoeXBlcnZfZGV2aWNlIHsKPiAKPiBDb3Vs
ZCB0aGlzIG5hbWUgbGVhZCB0byBjb25mbGljdHMgd2l0aCBvdGhlciBoeXBlcnYgZHJpdmVycz8g
SQo+IHN1Z2dlc3QgCj4gdG8gbmFtZSBpdCBoeXBlcnZfZHJtX2RldmljZS4KPiAKPiAKClN1cmUg
bWFrZSBzZW5zZSB0byB1c2UgaHlwZXJ2X2RybV9kZXZpY2UuCgo+ID4gCj4gPiArCj4gPiArc3Ry
dWN0IHN5bnRodmlkX3BvaW50ZXJfc2hhcGUgewo+IAo+IERvIHlvdSBoYXZlIHBsYW5zIGZvciBh
ZGRpbmcgY3Vyc29yIHN1cHBvcnQ/Cj4gCgpZZXMgSSBoYXZlIHRlc3RlZCB3aXRoIGEgcHJvdG90
eXBlIGFuZCBjdXJzb3Igd29ya3MuIFdpbGwgYXR0ZW1wdCB0aGlzCmluIGZ1dHVyZSBpdGVyYXRp
b24uCgo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgLyogTmVnb3RpYXRlIHRoZSBwcm90b2NvbCB2
ZXJzaW9uIHdpdGggaG9zdCAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgc3dpdGNoICh2bWJ1c19wcm90
b192ZXJzaW9uKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIFZFUlNJT05fV0lOMTA6Cj4gPiAr
wqDCoMKgwqDCoMKgwqBjYXNlIFZFUlNJT05fV0lOMTBfVjU6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0ID0gc3ludGh2aWRfbmVnb3RpYXRlX3ZlcihoZGV2LAo+ID4gU1lO
VEhWSURfVkVSU0lPTl9XSU4xMCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKCFyZXQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZhbGx0aHJvdWdo
Owo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBWRVJTSU9OX1dJTjg6Cj4gPiArwqDCoMKgwqDCoMKg
wqBjYXNlIFZFUlNJT05fV0lOOF8xOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldCA9IHN5bnRodmlkX25lZ290aWF0ZV92ZXIoaGRldiwKPiA+IFNZTlRIVklEX1ZFUlNJT05f
V0lOOCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFyZXQpCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZhbGx0aHJvdWdoOwo+ID4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBWRVJTSU9OX1dTMjAwODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgVkVSU0lP
Tl9XSU43Ogo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHN5bnRodmlk
X25lZ290aWF0ZV92ZXIoaGRldiwKPiA+IFNZTlRIVklEX1ZFUlNJT05fV0lONyk7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBkZWZh
dWx0Ogo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHN5bnRodmlkX25l
Z290aWF0ZV92ZXIoaGRldiwKPiA+IFNZTlRIVklEX1ZFUlNJT05fV0lOMTApOwo+IAo+IEkgZG9u
J3QgZ2V0IHRoZSBsb2dpYyBvZiB0aGlzIHN3aXRjaCBzdGF0ZW1lbnQuIElmIHRoZSBob3N0IGlz
IFdpbjEwLAo+IEknZCBleHBlY3QgdGhlIGdyYXBoaWNzIGRldmljZSB0byB1c2UgV2luMTAncyBw
cm90b2NvbCwgaWYgdGhlIGhvc3QKPiBpcyAKPiBXaW44LCB0aGUgZ3JhcGhpY3MgZGV2aWNlIHVz
ZXMgd2luOCBwcm90b2NvbHMuIFNvIHdoYXQncyB0aGUgcG9pbnQgb2YKPiB0aGUgZmFsbHRocm91
Z2hzPyBDYW4gdGhlcmUgYmUgbmV3ZXIgdmVyc2lvbnMgb2Ygdm1idXNfcHJvdG9fdmVyc2lvbiAK
PiB0aGF0IG9ubHkgc3VwcG9ydCBvbGRlciBkZXZpY2VzPwo+IAo+IAoKVGhpcyBpcyBjb3BpZWQg
YXMgaXQgaXMgZnJvbSBoeXBlcnZfZmIgZHJpdmVyLiBJIHN1cHBvc2UgdGhpcyBpcyBqdXN0CnRv
IGFjY29tb2RhdGUgbmV3ZXIgdmVyc2lvbi4KPiAKCkRlZXBhawoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
