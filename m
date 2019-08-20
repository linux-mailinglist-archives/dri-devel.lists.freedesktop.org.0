Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925596916
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34886E852;
	Tue, 20 Aug 2019 19:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A566E852
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 19:11:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g67so3620162wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 12:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vb3whGXfiiHwXLx0GBsKPRedv/L70OQIeLnBwUSPho4=;
 b=kSbD/sKwOEJYas8rMGcXpbNNyT+IyH6Q7S+TVuAe+Dh9RcMzoVUmxMhzam0CeQu9OK
 fwIBuaXepbASLQkheT7QVMANcyB1NzhOr+SYzGJpHMIhd2TMLTrzuYfniD36JlIy6G2G
 1CCzqRzYIlkDdXMSz4y2IcSUyNoxK9bCu/3Cqfm0Ptz21dTjiFZneMXPU3uIORUlcOmP
 HjMtXQCIM2pbqFPshufuFW5Vl3rHN1I4Aoi23QfTHyUNNV8dSTg0sTUGTWuIjwvz7+EW
 WHMnBKnJmvRpC2bGChHmKj19WC5q92dhqlR1rgYMyffhPsJiWfvR//zHVzqeT25ZFkGu
 jymA==
X-Gm-Message-State: APjAAAUE3o0fFTOH/vEQsWJsk/dF9gREmT44M+o0n7Mi4ZA8f1G0EEsb
 5sMgPmFjfgDDkixnury2mWzHamddXBEYoQ==
X-Google-Smtp-Source: APXvYqwlqkgjEfxRupwJEmpErYjVtp/jSgAzIq6qKhRlt/3+LyV6g4u2P1JUo73tJP1oXG79+2JXyA==
X-Received: by 2002:a1c:dd43:: with SMTP id u64mr1604542wmg.92.1566328306760; 
 Tue, 20 Aug 2019 12:11:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 74sm2025367wma.15.2019.08.20.12.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 12:11:45 -0700 (PDT)
Date: Tue, 20 Aug 2019 20:11:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] backlight: add include guards to platform_lcd.h and
 ili9320.h
Message-ID: <20190820191143.hzl5je4wrbkhcyyz@holly.lan>
References: <20190721073940.11422-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190721073940.11422-1-yamada.masahiro@socionext.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vb3whGXfiiHwXLx0GBsKPRedv/L70OQIeLnBwUSPho4=;
 b=KFWgQ3ZYkhfnlCdgpjG/KUIv6XkDo2u0s/mnHp0J8Kpd6kZHVr83+f26mP6nDGIRZ0
 r8hojDqxQZj7VXAXcrRTIFFftM+teZGSZpI+U67uShnl+L1wc7/gvVwLZw+Y+uyIVTWs
 p0bm9OQp/6uGGOVbNzXO2Db9xrqnbltfX53gpCb7LVE/k7fJseKVOOk2ZQBLyDbteYTn
 RGo1+sumqhTdckmD4a6BpxGFH0QJBs5ZDYlrVQR9pe95GPKT6APv6kQbYPYYgOr4qDFL
 +N4YLGVBdzHpyrv3IJmMvQ7sPBgo2Yfu6ISYadaXVVSKP0hj/puKTXuyCWbN2A/wsvVF
 PyTQ==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgMDQ6Mzk6NDBQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IEFkZCBoZWFkZXIgaW5jbHVkZSBndWFyZHMganVzdCBpbiBjYXNlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5j
b20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJv
Lm9yZz4KCj4gLS0tCj4gCj4gIGluY2x1ZGUvdmlkZW8vaWxpOTMyMC5oICAgICAgfCA0ICsrKysK
PiAgaW5jbHVkZS92aWRlby9wbGF0Zm9ybV9sY2QuaCB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3ZpZGVvL2lsaTkz
MjAuaCBiL2luY2x1ZGUvdmlkZW8vaWxpOTMyMC5oCj4gaW5kZXggNjJmNDI0ZjBiYzUyLi5iNzZh
MGI4ZjE2ZmMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS92aWRlby9pbGk5MzIwLmgKPiArKysgYi9p
bmNsdWRlL3ZpZGVvL2lsaTkzMjAuaAo+IEBAIC05LDYgKzksOSBAQAo+ICAgKiBodHRwOi8vYXJt
bGludXguc2ltdGVjLmNvLnVrLwo+ICAqLwo+ICAKPiArI2lmbmRlZiBfVklERU9fSUxJOTMyMF9I
Cj4gKyNkZWZpbmUgX1ZJREVPX0lMSTkzMjBfSAo+ICsKPiAgI2RlZmluZSBJTEk5MzIwX1JFRyh4
KQkoeCkKPiAgCj4gICNkZWZpbmUgSUxJOTMyMF9JTkRFWAkJCUlMSTkzMjBfUkVHKDB4MDApCj4g
QEAgLTE5NiwzICsxOTksNCBAQCBzdHJ1Y3QgaWxpOTMyMF9wbGF0ZGF0YSB7Cj4gIAl1bnNpZ25l
ZCBzaG9ydAlpbnRlcmZhY2U2Owo+ICB9Owo+ICAKPiArI2VuZGlmIC8qIF9WSURFT19JTEk5MzIw
X0ggKi8KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS92aWRlby9wbGF0Zm9ybV9sY2QuaCBiL2luY2x1
ZGUvdmlkZW8vcGxhdGZvcm1fbGNkLmgKPiBpbmRleCA2YTk1MTg0YTI4YzEuLmM2OGYzZjQ1YjVj
MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3ZpZGVvL3BsYXRmb3JtX2xjZC5oCj4gKysrIGIvaW5j
bHVkZS92aWRlby9wbGF0Zm9ybV9sY2QuaAo+IEBAIC03LDYgKzcsOSBAQAo+ICAgKiBHZW5lcmlj
IHBsYXRmb3JtLWRldmljZSBMQ0QgcG93ZXIgY29udHJvbCBpbnRlcmZhY2UuCj4gICovCj4gIAo+
ICsjaWZuZGVmIF9WSURFT19QTEFURk9STV9MQ0RfSAo+ICsjZGVmaW5lIF9WSURFT19QTEFURk9S
TV9MQ0RfSAo+ICsKPiAgc3RydWN0IHBsYXRfbGNkX2RhdGE7Cj4gIHN0cnVjdCBmYl9pbmZvOwo+
ICAKPiBAQCAtMTYsMyArMTksNCBAQCBzdHJ1Y3QgcGxhdF9sY2RfZGF0YSB7Cj4gIAlpbnQJKCpt
YXRjaF9mYikoc3RydWN0IHBsYXRfbGNkX2RhdGEgKiwgc3RydWN0IGZiX2luZm8gKik7Cj4gIH07
Cj4gIAo+ICsjZW5kaWYgLyogX1ZJREVPX1BMQVRGT1JNX0xDRF9IICovCj4gLS0gCj4gMi4xNy4x
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
