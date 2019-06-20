Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB84D016
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6F96E59E;
	Thu, 20 Jun 2019 14:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6286E5A9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:12:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so3150840wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bG3LwUQ3b/ooL8xbW03CBf7XGi5u2mtGy531+G/TlfQ=;
 b=e4AM7gUPqxpAoMaJZhqRJpiD6CaV6wCfx2+RbPwxch7Mgg4GZz07n+hHZvulPSmTKp
 cr4yuaKRk5zwceV2+zQc6TKIl4nWOsbtx6KRrb/HR6RJ16qnpmkURnSipvh9dUlagtmJ
 lAI74mrnEw/5MzOinx45lN9SffBhKrppnSd/UXWmqMGTHwxRiJUzrpfaMoqAi8jwNABb
 jbKWknPbirjgJyKpHa5i4I10LpKIf7CBKRpGBUFL63m40cC3Y2mOd77k/JrT1KNtXgK+
 cSaA1YEnRL/cCa5mrtSIf2ogiUlfWSihoheyltG4J+zr7IepHbrNPAob5gEYjUCgkm4g
 ZyuA==
X-Gm-Message-State: APjAAAWL2pqE4alddnFuunl9YmNlinzz1zI9AcUV48RI7IJnWdxPovyH
 0/cSk3YgpOurQCIei/gbTgwaO3RDsR7ceg==
X-Google-Smtp-Source: APXvYqw8T5ZAfsE490G/k0y4XCKLCnHT27dJ7xfDNPUzSB8lG8Bqm0SUH2plpEIwFHgyMjpDJTPM5Q==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr79110734wrp.277.1561039926987; 
 Thu, 20 Jun 2019 07:12:06 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id 90sm3018140wrn.97.2019.06.20.07.12.05
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 07:12:06 -0700 (PDT)
Subject: Re: [PATCH v1] backlight: gpio_backlight: Enable ACPI enumeration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20190619152127.11670-1-andriy.shevchenko@linux.intel.com>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <8919f52e-c745-503d-806d-aa605ddc8325@linaro.org>
Date: Thu, 20 Jun 2019 15:12:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619152127.11670-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bG3LwUQ3b/ooL8xbW03CBf7XGi5u2mtGy531+G/TlfQ=;
 b=pU49cWPwpjz3swS19Ge2cqwhCQu4c4diuWNV6sGEPjScYmGJDhLrxFTwlBeBdONTZg
 aBkqKyN/N483A9XaLHczD/x9KWc5roBGdsfmlYDAd0Z7fiR8+JHeFRkA8wmfMsMo5gyU
 6IxyYJMSnFpICLin6gqM9F2CH5y6qtCRPa/avG9oAg+m5QZarvjFIpyw4xWu/65d5B/V
 78SVGH/0w4mrjcIakEZj3RvJZWUkmSz9w8pI7nHuVEcK2GzVmqIvXG2oFdixr9y8AuGn
 dhkEapXrUewzSeJ/FInwnxTgyX6b/Zhi6BfGKGRZyKPxsnWxJkICH0xPMYkXetxNUBwe
 oYvg==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMDYvMjAxOSAxNjoyMSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IEFDUEkgYWxsb3dz
IHRvIGVudW1lcmF0ZSBzcGVjaWZpYyBkZXZpY2VzIGJ5IHVzaW5nIGNvbXBhdGlibGUgc3RyaW5n
cy4KPiBFbmFibGUgdGhhdCBlbnVtZXJhdGlvbiBmb3IgR1BJTyBiYXNlZCBiYWNrbGlnaHQgZGV2
aWNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMgfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggZTQ3MGRhOTVkODA2Li4wNWMxMmRm
NjJiMjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGln
aHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBA
QCAtMTgsNiArMTgsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KPiAgICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0Lmg+Cj4gICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgo+
ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgIAo+ICAgc3RydWN0IGdwaW9fYmFja2xpZ2h0
IHsKPiBAQCAtNjEsMTEgKzYyLDEwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmVf
ZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgIAkJCQkgICBzdHJ1Y3QgZ3Bpb19i
YWNrbGlnaHQgKmdibCkKPiAgIHsKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Owo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPiAgIAllbnVtIGdw
aW9kX2ZsYWdzIGZsYWdzOwo+ICAgCWludCByZXQ7Cj4gICAKPiAtCWdibC0+ZGVmX3ZhbHVlID0g
b2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiZGVmYXVsdC1vbiIpOwo+ICsJZ2JsLT5kZWZfdmFs
dWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgImRlZmF1bHQtb24iKTsKPiAgIAlm
bGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwo+
ICAgCj4gICAJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxhZ3MpOwo+
IEBAIC04OSwyNiArODksMTkgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGll
cyBwcm9wczsKPiAgIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7Cj4gICAJc3RydWN0IGdw
aW9fYmFja2xpZ2h0ICpnYmw7Cj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2
Lm9mX25vZGU7Cj4gICAJaW50IHJldDsKPiAgIAo+IC0JaWYgKCFwZGF0YSAmJiAhbnApIHsKPiAt
CQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gLQkJCSJmYWlsZWQgdG8gZmluZCBwbGF0Zm9ybSBkYXRh
IG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsKPiAtCQlyZXR1cm4gLUVOT0RFVjsKPiAtCX0KPiAt
Cj4gICAJZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tF
Uk5FTCk7Cj4gICAJaWYgKGdibCA9PSBOVUxMKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+
ICAgCWdibC0+ZGV2ID0gJnBkZXYtPmRldjsKPiAgIAo+IC0JaWYgKG5wKSB7Cj4gKwlpZiAocGRl
di0+ZGV2LmZ3bm9kZSkgewo+ICAgCQlyZXQgPSBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChwZGV2
LCBnYmwpOwo+ICAgCQlpZiAocmV0KQo+ICAgCQkJcmV0dXJuIHJldDsKPiAtCX0gZWxzZSB7Cj4g
Kwl9IGVsc2UgaWYgKHBkYXRhKSB7Cj4gICAJCS8qCj4gICAJCSAqIExlZ2FjeSBwbGF0Zm9ybSBk
YXRhIEdQSU8gcmV0cmlldmVhbC4gRG8gbm90IGV4cGFuZAo+ICAgCQkgKiB0aGUgdXNlIG9mIHRo
aXMgY29kZSBwYXRoLCBjdXJyZW50bHkgb25seSB1c2VkIGJ5IG9uZQo+IEBAIC0xMjksNiArMTIy
LDEwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgIAkJZ2JsLT5ncGlvZCA9IGdwaW9fdG9fZGVzYyhwZGF0YS0+Z3Bpbyk7
Cj4gICAJCWlmICghZ2JsLT5ncGlvZCkKPiAgIAkJCXJldHVybiAtRUlOVkFMOwo+ICsJfSBlbHNl
IHsKPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gKwkJCSJmYWlsZWQgdG8gZmluZCBwbGF0Zm9y
bSBkYXRhIG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsKClNob3VsZCB0aGUgc3RyaW5nIGFsc28g
YmUgdXBkYXRlZD8KCklmIHdoYXQgaXMgdXBkYXRlZCB0byBhY2tub2xlZGdlIG9wdGlvbiB0byB1
c2UgQUNQSSB0aGVuOgpBY2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25A
bGluYXJvLm9yZz4KCgoKCj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gICAJfQo+ICAgCj4gICAJbWVt
c2V0KCZwcm9wcywgMCwgc2l6ZW9mKHByb3BzKSk7Cj4gQEAgLTE0OSwxOSArMTQ2LDE3IEBAIHN0
YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC0jaWZkZWYgQ09ORklHX09GCj4gICBzdGF0
aWMgc3RydWN0IG9mX2RldmljZV9pZCBncGlvX2JhY2tsaWdodF9vZl9tYXRjaFtdID0gewo+ICAg
CXsgLmNvbXBhdGlibGUgPSAiZ3Bpby1iYWNrbGlnaHQiIH0sCj4gICAJeyAvKiBzZW50aW5lbCAq
LyB9Cj4gICB9Owo+ICAgCj4gICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBncGlvX2JhY2tsaWdo
dF9vZl9tYXRjaCk7Cj4gLSNlbmRpZgo+ICAgCj4gICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBncGlvX2JhY2tsaWdodF9kcml2ZXIgPSB7Cj4gICAJLmRyaXZlcgkJPSB7Cj4gICAJCS5u
YW1lCQk9ICJncGlvLWJhY2tsaWdodCIsCj4gLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hf
cHRyKGdwaW9fYmFja2xpZ2h0X29mX21hdGNoKSwKPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBncGlv
X2JhY2tsaWdodF9vZl9tYXRjaCwKPiAgIAl9LAo+ICAgCS5wcm9iZQkJPSBncGlvX2JhY2tsaWdo
dF9wcm9iZSwKPiAgIH07Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
