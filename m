Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5FA52E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F47B89217;
	Mon,  2 Sep 2019 09:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A778789A94
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:35:19 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 201so2417015qkd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=38YIQw9rYXVcXSnz01ylMn1XuQgT2tKgepHXTvRAlmI=;
 b=bv3OmliUyzBCglhYNQ1BI1OG5Tzec4SbyZ6734XP4jvKLHcln6R0mbPbjM1ilcTS/T
 GBYd92DLVmu/D4oRFRZDjO48ikoUKZul+JSi04CiKhw4TMhD51VU30P8jfdwqbCpQZwL
 DMbG07zkoGgX+ee4/pV3E8VSKit2OkozrHmyAVj5CjwCKCR3L0Cj+h1N2y6t/CEm1cJT
 ZHS0CD5eTwAOqc4p/OYFds0Co8vkKD9e6XXyK/U8VNVHuESuP95UjKkd63EO+qGEbNYj
 cuFerFTBENHS1Upp5aPiXTuUVJYEgs78vllM6zzwOd7JQR8cKNq//xGTGEyKwE71WRjr
 zXQA==
X-Gm-Message-State: APjAAAU0+X1K87rLGW837zialMF8/MBJwMBHnn9+3NGVAhetPegoyK1K
 X9/+wXfZdEBeYEsUGkUzbbh+nMxpU9IUOWpN2tX+UQ==
X-Google-Smtp-Source: APXvYqzstwtUHC+bSs9WdknmyMWA119lZrPIEt6ddRW8DWeESXgG8Thvv6/PsX8pItz2k9fLmDu/VaDOP/UcM6Gga/c=
X-Received: by 2002:a37:8547:: with SMTP id h68mr6152302qkd.219.1567416918785; 
 Mon, 02 Sep 2019 02:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <1564757262-6166-1-git-send-email-yannick.fertre@st.com>
 <ada48bc2-ac6a-8732-9aa6-03ef1c104abf@st.com>
In-Reply-To: <ada48bc2-ac6a-8732-9aa6-03ef1c104abf@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 2 Sep 2019 11:35:07 +0200
Message-ID: <CA+M3ks6MurXFitY24Cm9jCVx8h+VxTDFARxKuqg7MmhUk58X7w@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: add pinctrl for DPI encoder mode
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=38YIQw9rYXVcXSnz01ylMn1XuQgT2tKgepHXTvRAlmI=;
 b=MrtEnvsPeKbpdEE6n4t+yRTgqlactOV8g1SI+5jk0ZIyXDWGDbTrfXIz12VxRvYixu
 SI8Ls/by2Tn0tT31+NYhrzpSyE5Qa9YGGnyhVIPRyvIcUhdZeF3bi3rdJehdc0tDmz98
 CTP/uleQTCSkAmNWdqVCC0BkzhNBysidHkm9VFiK2EhUzjY3+sHD3BjBFcGIETlSLr27
 i6Qiijo8rqb36DwmQYlzWbmf2lxeJ2FOYX04K4zDuxcziu8LoskVWRvp4bG8nMy1wfVs
 bPt6NY0feBStC430sECK7fDZ4b8hOSs4S7Lbxq8HXiYsTdy5BQedyRMgkTk2AqWIjazR
 8/Vw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K2RyaS1kZXZlbCBtYWlsaW5nIGxpc3QKCkxlIGx1bi4gMiBzZXB0LiAyMDE5IMOgIDEwOjQ3LCBQ
aGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBZ
YW5uaWNrLAo+Cj4gT24gOC8yLzE5IDQ6NDcgUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiA+
IFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBmdW5jdGlvbnMgZW5jb2Rlcl9lbmFibGUgYW5kIGVuY29k
ZXJfZGlzYWJsZQo+ID4gbWFrZSBwb3NzaWJsZSB0byBjb250cm9sIHRoZSBwaW5jdHJsIGFjY29y
ZGluZyB0byB0aGUgZW5jb2RlciB0eXBlLgo+ID4gVGhlIHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0
ZWQgb25seSBpZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQSS4KPiA+IFRoaXMgaGVscHMgdG8gbW92
ZSB0aGUgRFBJLXJlbGF0ZWQgcGluY3RybCBjb25maWd1cmF0aW9uIGZyb20KPiA+IGFsbCB0aGUg
cGFuZWwgb3IgYnJpZGdlIHRvIHRoZSBMVERDIGR0IG5vZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gPiAtLS0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jCj4gPiBpbmRleCAzYWI0ZmJmLi4xYzRmZGUwIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4gPiAgICNpbmNsdWRlIDxs
aW51eC9vZl9ncmFwaC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+
Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICAgI2luY2x1ZGUg
PGxpbnV4L3BtX3J1bnRpbWUuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4gPiBA
QCAtMTA0MCw2ICsxMDQxLDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVu
Y3MgbHRkY19lbmNvZGVyX2Z1bmNzID0gewo+ID4gICAgICAgLmRlc3Ryb3kgPSBkcm1fZW5jb2Rl
cl9jbGVhbnVwLAo+ID4gICB9Owo+ID4KPiA+ICtzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlz
YWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gPiArewo+ID4gKyAgICAgc3RydWN0
IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4gPiArCj4gPiArICAgICBEUk1fREVC
VUdfRFJJVkVSKCJcbiIpOwo+ID4gKwo+ID4gKyAgICAgLyogU2V0IHRvIHNsZWVwIHN0YXRlIHRo
ZSBwaW5jdHJsIHdoYXRldmVyIHR5cGUgb2YgZW5jb2RlciAqLwo+ID4gKyAgICAgcGluY3RybF9w
bV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGlj
IHZvaWQgbHRkY19lbmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4g
PiArewo+ID4gKyAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4g
PiArCj4gPiArICAgICBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+ID4gKwo+ID4gKyAgICAgLyoK
PiA+ICsgICAgICAqIFNldCB0byBkZWZhdWx0IHN0YXRlIHRoZSBwaW5jdHJsIG9ubHkgd2l0aCBE
UEkgdHlwZS4KPiA+ICsgICAgICAqIE90aGVycyB0eXBlcyBsaWtlIERTSSwgZG9uJ3QgbmVlZCBw
aW5jdHJsIGR1ZSB0bwo+ID4gKyAgICAgICogaW50ZXJuYWwgYnJpZGdlICh0aGUgc2lnbmFscyBk
byBub3QgY29tZSBvdXQgb2YgdGhlIGNoaXBzZXQpLgo+ID4gKyAgICAgICovCj4gPiArICAgICBp
ZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBJKQo+ID4gKyAg
ICAgICAgICAgICBwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRkZXYtPmRldik7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1
bmNzIGx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7Cj4gPiArICAgICAuZGlzYWJsZSA9IGx0
ZGNfZW5jb2Rlcl9kaXNhYmxlLAo+ID4gKyAgICAgLmVuYWJsZSA9IGx0ZGNfZW5jb2Rlcl9lbmFi
bGUsCj4gPiArfTsKPiA+ICsKPiA+ICAgc3RhdGljIGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiA+ICAgewo+
ID4gICAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwo+ID4gQEAgLTEwNTUsNiArMTA4
Niw4IEBAIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRk
ZXYsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gPiAgICAgICBkcm1fZW5jb2Rlcl9pbml0
KGRkZXYsIGVuY29kZXIsICZsdGRjX2VuY29kZXJfZnVuY3MsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgIERSTV9NT0RFX0VOQ09ERVJfRFBJLCBOVUxMKTsKPiA+Cj4gPiArICAgICBkcm1fZW5j
b2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsICZsdGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiA+
ICsKPiA+ICAgICAgIHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGJyaWRnZSwgTlVM
TCk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiAgICAgICAgICAgICAgIGRybV9lbmNvZGVyX2Ns
ZWFudXAoZW5jb2Rlcik7Cj4gPiBAQCAtMTI4MCw2ICsxMzEzLDggQEAgaW50IGx0ZGNfbG9hZChz
dHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiA+Cj4gPiAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUobGRldi0+cGl4ZWxfY2xrKTsKPiA+Cj4gPiArICAgICBwaW5jdHJsX3BtX3NlbGVjdF9zbGVl
cF9zdGF0ZShkZGV2LT5kZXYpOwo+ID4gKwo+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51
IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Cj4KPiBUaGFua3MKPiBQaGlsaXBwZSA6KQo+Cj4gPiAg
ICAgICBwbV9ydW50aW1lX2VuYWJsZShkZGV2LT5kZXYpOwo+ID4KPiA+ICAgICAgIHJldHVybiAw
Owo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
