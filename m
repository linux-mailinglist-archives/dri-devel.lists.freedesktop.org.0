Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55772D01
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3F6E516;
	Wed, 24 Jul 2019 11:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47626E516
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:12:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c2so43307971wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3Mf8w5hPQ8vkoVY1yIn2y097hPhW6Wz39EJFUer/8/I=;
 b=QIG4HNeh75WS2q+gj/nstDOWEHnA5VZIl/tAIuWJU5Cz6NO2hrNQ84YJS7+Tyg0DaJ
 UevR8wofOHDi4DagfFgP4dW+iyRBRLyFd6bJ/JpGsNONwXPV27NHDHxd7PKBJW5/G2Ki
 JYoK0dwfot2HewvDMqe1TV/WK0FkG+atcbbkAV8o68v2FqU8HrUtJ0oGKzEEpqXbboW1
 FxpESB6QC11aO9ntbuUod4qujcTeYoBcSxyL7jPMfwQ/9Hk7vF09EUKV11L7RIk+pINw
 5usy+5P3K1H96Geiln8uMMSbik7B2MH1YTBp7xFtjtVt8i0o1VQ8ckGuyPWGAFc/+0Il
 gsUA==
X-Gm-Message-State: APjAAAWmzGjB+yTC2kmysXRaLmcWfL7Fdkrj4HOTQ4dp92B0uOpy5DDy
 wZQTvegK2OIr3ZPruB0cxn4MYg==
X-Google-Smtp-Source: APXvYqyGihY987W1wtDENE5DlizL290ek5v9J4SXoQGdoqEePNMqO7vAu54DHqwKZ688fzGQ2kh5wA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr15180099wrp.32.1563966745286; 
 Wed, 24 Jul 2019 04:12:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j33sm89874753wre.42.2019.07.24.04.12.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:12:24 -0700 (PDT)
Date: Wed, 24 Jul 2019 12:12:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 2/7] backlight: gpio: simplify the platform data
 handling
Message-ID: <20190724111222.6wcq72btthz4l3r7@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-3-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3Mf8w5hPQ8vkoVY1yIn2y097hPhW6Wz39EJFUer/8/I=;
 b=RmdGRok0fXh/6pwCnKE20oo1XLTAnNpBQ/haiHKDt849cme4tzL7w6Uy1QaQVOeraA
 kMQpxu6aEqhCWOvu9huGYWkRbYFu0UsdSxnrBRtjeqJ6f1M12j43TRDv+Trm3V5Dd2ZQ
 FEeqmte9nGupLrujUrDcfuhTbB+/Un26j7BM6cSbLsTTuxKUET2fMxOsat3mPOonuh0m
 jyPqjTQiF2GvoPNrKGJMLG94+hEiomyQ/71hbuMYwy43WgZtGoY+Kwi9b/S4+DH1+Nvn
 MqfRXgoQuMT23Xv/h+9H1/UMJQxy6Ewu8liXu08KkLR2jZPS6CpACmme/592N09VbnC3
 FlSA==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDNBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IE5vdyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0gZGF0YSAo
c2ggZWNvdmVjMjQpIGRlZmluZXMgYSBwcm9wZXIKPiBHUElPIGxvb2t1cCBhbmQgc2V0cyB0aGUg
J2RlZmF1bHQtb24nIGRldmljZSBwcm9wZXJ0eSwgd2UgY2FuIGRyb3AgdGhlCj4gcGxhdGZvcm1f
ZGF0YS1zcGVjaWZpYyBHUElPIGhhbmRsaW5nIGFuZCB1bmlmeSBhIGJpZyBjaHVuayBvZiBjb2Rl
Lgo+IAo+IFRoZSBvbmx5IGZpZWxkIHVzZWQgZnJvbSB0aGUgcGxhdGZvcm0gZGF0YSBpcyBub3cg
dGhlIGZiZGV2IHBvaW50ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDY0ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggZTg0ZjMwODdl
MjlmLi4wMTI2MjE4NmZhMWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMKPiBAQCAtNTUsMzAgKzU1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGln
aHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKPiAgCS5jaGVja19mYgk9IGdwaW9fYmFja2xp
Z2h0X2NoZWNrX2ZiLAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9i
ZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+IC0JCQkJICAgc3RydWN0IGdwaW9f
YmFja2xpZ2h0ICpnYmwpCj4gLXsKPiAtCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7
Cj4gLQllbnVtIGdwaW9kX2ZsYWdzIGZsYWdzOwo+IC0JaW50IHJldDsKPiAtCj4gLQlnYmwtPmRl
Zl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVmYXVsdC1vbiIpOwo+
IC0JZmxhZ3MgPSBnYmwtPmRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xP
VzsKPiAtCj4gLQlnYmwtPmdwaW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBmbGFncyk7
Cj4gLQlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7Cj4gLQkJcmV0ID0gUFRSX0VSUihnYmwtPmdw
aW9kKTsKPiAtCj4gLQkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKSB7Cj4gLQkJCWRldl9lcnIo
ZGV2LAo+IC0JCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1ldGVyIGlzIG1pc3Npbmcgb3IgaW52
YWxpZC5cbiIpOwo+IC0JCX0KPiAtCQlyZXR1cm4gcmV0Owo+IC0JfQo+IC0KPiAtCXJldHVybiAw
Owo+IC19Cj4gLQo+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9y
bV9kYXRhICpwZGF0YSA9Cj4gQEAgLTg2LDYgKzYyLDcgQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IGJhY2ts
aWdodF9wcm9wZXJ0aWVzIHByb3BzOwo+ICAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsOwo+
ICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Cj4gKwllbnVtIGdwaW9kX2ZsYWdzIGZsYWdz
Owo+ICAJaW50IHJldDsKPiAgCj4gIAlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6
ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKPiBAQCAtOTQsMzUgKzcxLDIwIEBAIHN0YXRpYyBpbnQg
Z3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4g
IAlnYmwtPmRldiA9ICZwZGV2LT5kZXY7Cj4gIAo+IC0JaWYgKHBkZXYtPmRldi5md25vZGUpIHsK
PiAtCQlyZXQgPSBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChwZGV2LCBnYmwpOwo+IC0JCWlmIChy
ZXQpCj4gLQkJCXJldHVybiByZXQ7Cj4gLQl9IGVsc2UgaWYgKHBkYXRhKSB7Cj4gLQkJLyoKPiAt
CQkgKiBMZWdhY3kgcGxhdGZvcm0gZGF0YSBHUElPIHJldHJpZXZlYWwuIERvIG5vdCBleHBhbmQK
PiAtCQkgKiB0aGUgdXNlIG9mIHRoaXMgY29kZSBwYXRoLCBjdXJyZW50bHkgb25seSB1c2VkIGJ5
IG9uZQo+IC0JCSAqIFNIIGJvYXJkLgo+IC0JCSAqLwo+IC0JCXVuc2lnbmVkIGxvbmcgZmxhZ3Mg
PSBHUElPRl9ESVJfT1VUOwo+IC0KPiArCWlmIChwZGF0YSkKPiAgCQlnYmwtPmZiZGV2ID0gcGRh
dGEtPmZiZGV2Owo+IC0JCWdibC0+ZGVmX3ZhbHVlID0gcGRhdGEtPmRlZl92YWx1ZTsKPiAtCQlm
bGFncyB8PSBnYmwtPmRlZl92YWx1ZSA/IEdQSU9GX0lOSVRfSElHSCA6IEdQSU9GX0lOSVRfTE9X
Owo+IC0KPiAtCQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoZ2JsLT5kZXYsIHBkYXRhLT5n
cGlvLCBmbGFncywKPiAtCQkJCQkgICAgcGRhdGEgPyBwZGF0YS0+bmFtZSA6ICJiYWNrbGlnaHQi
KTsKPiAtCQlpZiAocmV0IDwgMCkgewo+IC0JCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJ1bmFibGUg
dG8gcmVxdWVzdCBHUElPXG4iKTsKPiAtCQkJcmV0dXJuIHJldDsKPiArCj4gKwlnYmwtPmRlZl92
YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24i
KTsKPiArCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9EX09V
VF9MT1c7Cj4gKwo+ICsJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5V
TEwsIGZsYWdzKTsKPiArCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKPiArCQlyZXQgPSBQVFJf
RVJSKGdibC0+Z3Bpb2QpOwo+ICsJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgewo+ICsJCQlk
ZXZfZXJyKCZwZGV2LT5kZXYsCj4gKwkJCQkiRXJyb3I6IFRoZSBncGlvcyBwYXJhbWV0ZXIgaXMg
bWlzc2luZyBvciBpbnZhbGlkLlxuIik7Cj4gIAkJfQo+IC0JCWdibC0+Z3Bpb2QgPSBncGlvX3Rv
X2Rlc2MocGRhdGEtPmdwaW8pOwo+IC0JCWlmICghZ2JsLT5ncGlvZCkKPiAtCQkJcmV0dXJuIC1F
SU5WQUw7Cj4gLQl9IGVsc2Ugewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwKPiAtCQkJImZhaWxl
ZCB0byBmaW5kIHBsYXRmb3JtIGRhdGEgb3IgZGV2aWNlIHRyZWUgbm9kZS5cbiIpOwo+IC0JCXJl
dHVybiAtRU5PREVWOwo+ICsJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+ICAJbWVtc2V0KCZwcm9w
cywgMCwgc2l6ZW9mKHByb3BzKSk7Cj4gLS0gCj4gMi4yMS4wCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
