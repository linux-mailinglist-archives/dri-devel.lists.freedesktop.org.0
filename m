Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9231AD764
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 12:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016E48982C;
	Mon,  9 Sep 2019 10:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0F8982C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 10:57:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q19so13257279wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 03:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RlXHN5Ix30FP88bBs/TiJIVQtqEqdtYjO/ksq2NpWCg=;
 b=uDm07VQZUAwJxrbhoYGyX5ue1VPwxuPjvTiy+s7rrAyU1MvSZ5oDBgUTwH6TO0yWX9
 L57icsxExrFISMK5l+3dgYlsT6No8KqGqAEcZJ16+AQ2yWdKVQFsIebVltqNcHUa15Nc
 kW08J7Ei5sEfPbAewnxOcdtrNelXoF90gU69hScvW0KsSXzOYXO5utGfNGi52OgL2msd
 TptuLag+tu1mmrleax7c1JNsm3TCzeTn8MhR4hHvwNfMv2C3/k3CEgVAtx1GUGYvnmhQ
 M00haQxcr3IU2JyK8WMbbsduizBDUdUyIBHkWa06Yd9fQbSfQv8+TbFo6RW5RZUryKF5
 sv1Q==
X-Gm-Message-State: APjAAAUCVvVZn49GHEBMa+2ik92gzo4eD8oKWHzNr/cuRTMU6Zu6SOG1
 qC1ZA5rpv3DgJx/g9gfVJC3edA==
X-Google-Smtp-Source: APXvYqyWb29kdhIDW8uaIKHqPrGrRW0QDeYEfi/ticz66TJeFeLmc7gPIPjGFV3JDIWoJ302JjquKQ==
X-Received: by 2002:a1c:cb83:: with SMTP id b125mr19176609wmg.43.1568026651947; 
 Mon, 09 Sep 2019 03:57:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s12sm4418832wrn.90.2019.09.09.03.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 03:57:30 -0700 (PDT)
Date: Mon, 9 Sep 2019 11:57:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190909105729.w5552rtop7rhghy2@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190908203704.30147-2-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RlXHN5Ix30FP88bBs/TiJIVQtqEqdtYjO/ksq2NpWCg=;
 b=pgan3/KEQnhn7ZcaynKzZHra/KGSzMg74XSUwMiPg68U30ANdU3IbUc2+NTbH5uHuV
 2f+BqabSS2vknJtIwazP57ZLuTWgbQg9OU9yur/ody+/dRsLSgpGkBcPuueJaAWrDWL5
 p39Vc5SC2gbKjUVK5a+Z3NpB52GGp1LJ9XlZiKyj/E55rVt/qAGE9dteFfT7uV/ZwUpA
 hOGxj/qvf4pFkh/P++GQ30oH8rEmREpPutfQRAWmuHUBvpZuhfBuxlp1MPsjKhPjNKr7
 5la4M5cNiLZ7+wGs6M1BalVnhrEywn9IvP0Wo13j3hmD7LUy0N+lBIZZ0lpMkS7xWHTz
 69vQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMTA6Mzc6MDNQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IEZvciBub3cganVzdCBlbmFibGUgaXQgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIHRv
IGFsbG93IGkyYwo+IGFjY2VzcyBhbmQgZGlzYWJsZSBpdCBvbiByZW1vdmUuIERpc2FibGluZyBh
bHNvIG1lYW5zIHJlc2V0dGluZwo+IHRoZSByZWdpc3RlciB2YWx1ZXMgdG8gZGVmYXVsdC4KPiAK
PiBUZXN0ZWQgb24gS29ibyBDbGFyYSBIRC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEtl
bW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9sbTM2MzBhX2JsLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvbG0zNjMwYV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5j
Cj4gaW5kZXggYjA0YjM1ZDAwN2EyLi4zYjQ1YTE3MzMxOTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvbG0zNjMwYV9ibC5jCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4
L3VhY2Nlc3MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcmVnbWFwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9ncGlvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wd20uaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvbG0zNjMwYV9ibC5oPgo+ICAKPiBAQCAtNDgsNiArNTAs
NyBAQCBzdHJ1Y3QgbG0zNjMwYV9jaGlwIHsKPiAgCXN0cnVjdCBsbTM2MzBhX3BsYXRmb3JtX2Rh
dGEgKnBkYXRhOwo+ICAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsZWRhOwo+ICAJc3RydWN0
IGJhY2tsaWdodF9kZXZpY2UgKmJsZWRiOwo+ICsJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dw
aW87Cj4gIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
ZDsKPiAgfTsKPiBAQCAtNTA2LDYgKzUwOSwxNCBAQCBzdGF0aWMgaW50IGxtMzYzMGFfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCXBjaGlw
LT5kZXYgPSAmY2xpZW50LT5kZXY7Cj4gIAo+ICsJcGNoaXAtPmVuYWJsZV9ncGlvID0gZGV2bV9n
cGlvZF9nZXRfb3B0aW9uYWwoJmNsaWVudC0+ZGV2LCAiZW5hYmxlIiwKPiArCQkJCQkJR1BJT0Rf
QVNJUyk7CgpJbml0aWFsaXppbmcgR1BJT0RfQVNJUyBkb2Vzbid0IGxvb2sgcmlnaHQgdG8gbWUu
CgpJZiB5b3UgaW5pdGlhbGl6ZSBBU0lTIHRoZW4gdGhlIGRyaXZlciBtdXN0IGNvbmZpZ3VyZSB0
aGUgcGluIGFzIGFuCm91dHB1dC4uLiBmYXIgZWFzaWVyIGp1c3QgdG8gc2V0IEdQSU9EX09VVF9I
SUdIIGR1cmluZyB0aGUgZ2V0LgoKTm90ZSBhbHNvIHRoYXQgdGhlIGNhbGwgdG8gdGhpcyBmdW5j
dGlvbiBzaG91bGQgYWxzbyBiZSBtb3ZlZCAqYmVsb3cqCnRoZSBjYWxscyBwYXJzZSB0aGUgRFQu
CgoKPiArCWlmIChJU19FUlIocGNoaXAtPmVuYWJsZV9ncGlvKSkgewo+ICsJCXJ2YWwgPSBQVFJf
RVJSKHBjaGlwLT5lbmFibGVfZ3Bpbyk7Cj4gKwkJcmV0dXJuIHJ2YWw7Cj4gKwl9Cj4gKwo+ICsK
PiAgCXBjaGlwLT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X2kyYyhjbGllbnQsICZsbTM2MzBh
X3JlZ21hcCk7Cj4gIAlpZiAoSVNfRVJSKHBjaGlwLT5yZWdtYXApKSB7Cj4gIAkJcnZhbCA9IFBU
Ul9FUlIocGNoaXAtPnJlZ21hcCk7Cj4gQEAgLTUzNSw2ICs1NDYsMTAgQEAgc3RhdGljIGludCBs
bTM2MzBhX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gIAl9Cj4gIAlwY2hpcC0+
cGRhdGEgPSBwZGF0YTsKPiAgCj4gKwlpZiAocGNoaXAtPmVuYWJsZV9ncGlvKSB7Cj4gKwkJZ3Bp
b2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHBjaGlwLT5lbmFibGVfZ3BpbywgMSk7CgpOb3QgbmVlZGVk
LCB1c2UgR1BJT0RfT1VUX0hJR0ggaW5zdGVhZC4KCgo+ICsJCXVzbGVlcF9yYW5nZSgxMDAwLCAy
MDAwKTsKCk5vdCBuZWVkZWQsIHRoaXMgc2xlZXAgaXMgYWxyZWFkeSBwYXJ0IG9mIGxtMzYzMGFf
Y2hpcF9pbml0KCkuCgoKPiArCX0KPiAgCS8qIGNoaXAgaW5pdGlhbGl6ZSAqLwo+ICAJcnZhbCA9
IGxtMzYzMGFfY2hpcF9pbml0KHBjaGlwKTsKPiAgCWlmIChydmFsIDwgMCkgewo+IEBAIC01ODYs
NiArNjAxLDkgQEAgc3RhdGljIGludCBsbTM2MzBhX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50KQo+ICAJaWYgKHJ2YWwgPCAwKQo+ICAJCWRldl9lcnIocGNoaXAtPmRldiwgImkyYyBm
YWlsZWQgdG8gYWNjZXNzIHJlZ2lzdGVyXG4iKTsKPiAgCj4gKwlpZiAocGNoaXAtPmVuYWJsZV9n
cGlvKQo+ICsJCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChwY2hpcC0+ZW5hYmxlX2dwaW8sIDAp
Owo+ICsKCklzIHRoaXMgbmVlZGVkPwoKVGhpcyBpcyBhIHJlbW92ZSBwYXRoLCBub3QgYSBwb3dl
ciBtYW5hZ2VtZW50IHBhdGgsIGFuZCB3ZSBoYXZlIG5vIGlkZWEKd2hhdCB0aGUgb3JpZ2luYWwg
c3RhdHVzIG9mIHRoZSBwaW4gd2FzIGFueXdheT8KCgo+ICAJaWYgKHBjaGlwLT5pcnEpIHsKPiAg
CQlmcmVlX2lycShwY2hpcC0+aXJxLCBwY2hpcCk7Cj4gIAkJZmx1c2hfd29ya3F1ZXVlKHBjaGlw
LT5pcnF0aHJlYWQpOwo+IC0tIAo+IDIuMjAuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
