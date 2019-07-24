Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7372D28
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D326E50C;
	Wed, 24 Jul 2019 11:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB64E6E50C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:14:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so33211872wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7NyRu0tx3w+dLLQ6/dneDxJh1D9iVMTSGGH2CPUAo/c=;
 b=UW0+0B4uwPA7I0AYy3kOAF07WkGbxI7nMtsDIzy2x8KnHPKfmPQ2Oko1ZECnQeDKtB
 ISu8idoPioU+OL2hBGLMXfCbGeAXElHzbdm5DqUOKSsPECFrVD7+955GNQqLIB1pOp3C
 adKkcrNZl9wDm8m71+wPr2UF18IbKELxt8NDYnhUkvhv0NdaWpo/7vBPQxD13o/4rx6X
 zlw8nkx1xKxm3wB2N+mSxFAJszeKE0gPclJBLEz5pRID29aLzqdxoPDGuKykZ4FoCq3b
 YR4mMEXQ5OrlCFv8bOGVi6LuQjOUwSsbn9lhbjRAgNnHMb4bN1vjkCQTZzP9n+vIEG4y
 CJtg==
X-Gm-Message-State: APjAAAUpF/h6+820KXqYS8+yqShk7M4h8rYLesLiG1oXP/jBbPCHXEy4
 nnD+xxwFhWnpB3a0gmWZ4F4cpA==
X-Google-Smtp-Source: APXvYqzfMApTQXYMpBScWR9bk4kJ2771Xs86B/GfU/9afdNHqXHh096SssyjdsJTlYUpAz1NrlsIJg==
X-Received: by 2002:a1c:c742:: with SMTP id x63mr78332968wmf.0.1563966841429; 
 Wed, 24 Jul 2019 04:14:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u13sm54703536wrq.62.2019.07.24.04.14.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:14:00 -0700 (PDT)
Date: Wed, 24 Jul 2019 12:13:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190724111359.c262dcwwikn3j7fu@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7NyRu0tx3w+dLLQ6/dneDxJh1D9iVMTSGGH2CPUAo/c=;
 b=ufYYjVec/kvhmg39Q3zq/jFjiLdLC9vtny5aJgVO4Lp225heuEYfYuddTPewKY68GB
 GFd9hONJsyc/pjx7948e2iiOHpwjxBH1adsyByDlp2IVTXsmBc5J/T2Q13mP4Je306Ah
 whztj9zZujrWsLF/GxRhou1EKUfVQDIs4rhTUix2oaCIlIXcFEK7YVAGTTNpgg1S3bcc
 cTG22FbrfXPgn1yleXnMI4R3t7xJeEXNJ42G4rL0u1j+slO9cBA/AeIeUBd4PW1SQ3EE
 GvXB6ePJhAsLZCprxL28nuwbJtvJZvpQlsOm/o+9bMvbOG8wD/nXyunAit68PGMWKZEh
 CkoA==
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

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDhBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwg
dXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBi
YXlsaWJyZS5jb20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMgfCAxOSArKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYwo+IGluZGV4IGNkNmE3NWJjYTljYy4uN2RjNGY5MGQ5MjZiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gQEAgLTU0LDI5ICs1
NCwyOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgZ3Bpb19iYWNrbGlnaHRf
b3BzID0gewo+ICAKPiAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gLQlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSAqcGRhdGEgPQo+IC0JCWRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7Cj4gKwlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICsJc3RydWN0IGdwaW9fYmFja2xpZ2h0
X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0YShkZXYpOwo+ICAJc3RydWN0
IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwo+ICAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2Ug
KmJsOwo+ICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Cj4gIAllbnVtIGdwaW9kX2ZsYWdz
IGZsYWdzOwo+ICAJaW50IHJldCwgZGVmX3ZhbHVlOwo+ICAKPiAtCWdibCA9IGRldm1fa3phbGxv
YygmcGRldi0+ZGV2LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwo+ICsJZ2JsID0gZGV2bV9r
emFsbG9jKGRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKPiAgCWlmIChnYmwgPT0gTlVM
TCkKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRl
diA9IHBkYXRhLT5mYmRldjsKPiAgCj4gLQlkZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVh
ZF9ib29sKCZwZGV2LT5kZXYsICJkZWZhdWx0LW9uIik7Cj4gKwlkZWZfdmFsdWUgPSBkZXZpY2Vf
cHJvcGVydHlfcmVhZF9ib29sKGRldiwgImRlZmF1bHQtb24iKTsKPiAgCWZsYWdzID0gZGVmX3Zh
bHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwo+ICAKPiAtCWdibC0+Z3Bpb2Qg
PSBkZXZtX2dwaW9kX2dldCgmcGRldi0+ZGV2LCBOVUxMLCBmbGFncyk7Cj4gKwlnYmwtPmdwaW9k
ID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBmbGFncyk7Cj4gIAlpZiAoSVNfRVJSKGdibC0+
Z3Bpb2QpKSB7Cj4gIAkJcmV0ID0gUFRSX0VSUihnYmwtPmdwaW9kKTsKPiAgCQlpZiAocmV0ICE9
IC1FUFJPQkVfREVGRVIpIHsKPiAtCQkJZGV2X2VycigmcGRldi0+ZGV2LAo+ICsJCQlkZXZfZXJy
KGRldiwKPiAgCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGlu
dmFsaWQuXG4iKTsKPiAgCQl9Cj4gIAkJcmV0dXJuIHJldDsKPiBAQCAtODUsMTEgKzg1LDEwIEBA
IHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgCW1lbXNldCgmcHJvcHMsIDAsIHNpemVvZihwcm9wcykpOwo+ICAJcHJvcHMudHlw
ZSA9IEJBQ0tMSUdIVF9SQVc7Cj4gIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IDE7Cj4gLQlibCA9
IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcigmcGRldi0+ZGV2LCBkZXZfbmFtZSgmcGRl
di0+ZGV2KSwKPiAtCQkJCQkmcGRldi0+ZGV2LCBnYmwsICZncGlvX2JhY2tsaWdodF9vcHMsCj4g
LQkJCQkJJnByb3BzKTsKPiArCWJsID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKGRl
diwgZGV2X25hbWUoZGV2KSwgZGV2LCBnYmwsCj4gKwkJCQkJICAgICZncGlvX2JhY2tsaWdodF9v
cHMsICZwcm9wcyk7Cj4gIAlpZiAoSVNfRVJSKGJsKSkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRl
diwgImZhaWxlZCB0byByZWdpc3RlciBiYWNrbGlnaHRcbiIpOwo+ICsJCWRldl9lcnIoZGV2LCAi
ZmFpbGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodFxuIik7Cj4gIAkJcmV0dXJuIFBUUl9FUlIoYmwp
Owo+ICAJfQo+ICAKPiAtLSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
