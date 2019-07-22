Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7F7039B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662289CB8;
	Mon, 22 Jul 2019 15:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB6A89CB8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:22:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s3so35605802wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CjN06kskuSN63zvz3I8U6ASqKJRxwYLJel4cw/9K0lw=;
 b=Z08JbLp7iFOs/TnkFEA4uCmxh5AOCse/AsI9+M0p2ltqw2JB9tLiooEEj2Kj/XJKgt
 CYHBw3RF4qXfCnffcqjRslY1DE5TJZQWM4nXf7wRwyeVaCyI6B3BKnmpy51myjNsGyKM
 D8wwhfDt+LSrJCl6njnLq2CFkNSfjHlldaS0uqwqyci4CrHZ7Ys2a5Fmmla4s/O/7/si
 yF0Cw1QKB2qJhON90VUMrxWDF8mjcxSMjEhe6OoJzlLxJizDuV4irIe/u26wxQo1iCNS
 CtQSKAKVocX9ZImnRk5mgQlvhRiKztSMV0lobvUmxwhC8Tk/WAh0bDxu0ZggOe1brji3
 B/xQ==
X-Gm-Message-State: APjAAAVEDlMA4PSsBG8EJ9gsFMrOp5KYWhDBVqonMEHI/YllmTE7dax/
 /ZXvfyj0QYmpk8uBXbIrz+uuwQ==
X-Google-Smtp-Source: APXvYqxEqJt2WlO+GoY0nM0FoV0BovseVpbAQSrNlFd4NlDuP4uXJmvali/FscgOt4YbJnNBVzR6bg==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr61057896wmk.99.1563808928497; 
 Mon, 22 Jul 2019 08:22:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i18sm51360450wrp.91.2019.07.22.08.22.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:22:07 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:22:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Message-ID: <20190722152206.bfjlws53yknq3xv4@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-7-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CjN06kskuSN63zvz3I8U6ASqKJRxwYLJel4cw/9K0lw=;
 b=SW2BLq/I4O/PnHgn1NA2q1TeVho/oHOeDcYpL3qFIQggNojxG22k4aZiFGmAg3qjZw
 sNH03/H7fUd1hP+JYWFhSUX8oVoTRU3bnRNRtsbc1lJviN3M++fuo80AkU9hWv+dRbu6
 mg0kIKTw66qN8Z3uRv1t8IVBOT8WAVgLsmzb74vtLhqfx+4hcnmk6kNrJvkgbtcno8JY
 0FDCNFNg9zgMDxr5NKN1TXvrZYwVniccPCYF6S1oN3eH/gHp9jUbauxk12vI4YbezNDT
 UsyQt5Z+DG/nC780HdW0gYFTNsc/rKkiLemjOICIiX9L0i2dF+lRJlhDPXFtvtYGgReH
 kIiA==
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDM6MDFQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoaXMgZmllbGQgaXMgdW51c2VkIG91dHNpZGUgb2YgcHJvYmUoKS4g
VGhlcmUncyBubyBuZWVkIHRvIHN0b3JlIGl0Lgo+IFdlIGNhbiBtYWtlIGl0IGludG8gYSBsb2Nh
bCB2YXJpYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9ncGlvX2JhY2tsaWdodC5jIHwgOSArKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMKPiBpbmRleCA3MDg4MjU1NmYwNDcuLmNkNmE3NWJjYTljYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IEBAIC0yMSw3ICsyMSw2
IEBACj4gIHN0cnVjdCBncGlvX2JhY2tsaWdodCB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsK
PiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwo+IC0JaW50IGRlZl92YWx1ZTsKPiAgfTsKPiAg
Cj4gIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmwpCj4gQEAgLTYxLDcgKzYwLDcgQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IGJhY2ts
aWdodF9kZXZpY2UgKmJsOwo+ICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Cj4gIAllbnVt
IGdwaW9kX2ZsYWdzIGZsYWdzOwo+IC0JaW50IHJldDsKPiArCWludCByZXQsIGRlZl92YWx1ZTsK
PiAgCj4gIAlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBf
S0VSTkVMKTsKPiAgCWlmIChnYmwgPT0gTlVMTCkKPiBAQCAtNzAsOCArNjksOCBAQCBzdGF0aWMg
aW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKPiAgCj4gLQlnYmwt
PmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1
bHQtb24iKTsKPiAtCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQ
SU9EX09VVF9MT1c7Cj4gKwlkZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKCZw
ZGV2LT5kZXYsICJkZWZhdWx0LW9uIik7Cj4gKwlmbGFncyA9IGRlZl92YWx1ZSA/IEdQSU9EX09V
VF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKPiAgCj4gIAlnYmwtPmdwaW9kID0gZGV2bV9ncGlvZF9n
ZXQoJnBkZXYtPmRldiwgTlVMTCwgZmxhZ3MpOwo+ICAJaWYgKElTX0VSUihnYmwtPmdwaW9kKSkg
ewo+IEBAIC05NCw3ICs5Myw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gUFRSX0VSUihibCk7Cj4gIAl9
Cj4gIAo+IC0JYmwtPnByb3BzLmJyaWdodG5lc3MgPSBnYmwtPmRlZl92YWx1ZTsKPiArCWJsLT5w
cm9wcy5icmlnaHRuZXNzID0gZGVmX3ZhbHVlOwo+ICAJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMo
YmwpOwo+ICAKPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGJsKTsKPiAtLSAKPiAyLjIx
LjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
