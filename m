Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215EF7A419
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522716E45E;
	Tue, 30 Jul 2019 09:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04EA6E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:27:32 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w20so61913067edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 02:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mWYbiGchqs7Z2/3ZYBh4Bz6mi7RVSFE4P+K6kzNb0zw=;
 b=WhD9ecPlYYQ9CxrHStpPKuGfL4YgCpt8Vb+3mBZwqkQRq7CTgF8F7nYqPJ6bjFsIx6
 S6LEdfCv2MaaHHPUYHBCcBgnC/ba8VKJEVqkUsOqNI6POdh6RrBv2xzS/i8/n1IrK44c
 hYdR3orBRuz3bQNcn3r6cGXyKpZO9ESwFwdI9cNjY4SwkPw/MTvg0uVki/VErh0S3v3S
 NYg1WGgIRaxk07+b5qYeuSOh9dGTibAWFCunG6Vm5PdjRlvYTpx882+ks/iij80zqZDC
 O0SKBpqX9w39pWGs4Wu6RP/LFKgxvSHP2u0bXWmCIf7UL2Y1YmqT6tDxFr7B7j8S7BJr
 rbpA==
X-Gm-Message-State: APjAAAUt+Nvc5fghIknfae6FdojXh0mlbTi5uj9y4DQHEoiFQ+VkVPe1
 +qyu2r2kAMGb2eXWJ6tWXsHOoCfMIwo=
X-Google-Smtp-Source: APXvYqys/FZh6hWHzD/AZ7HU7xVaX090EdKjSdCRBWfj4xZcddu7nKEWxixg0eUkpew3SieG6XWR/g==
X-Received: by 2002:a17:907:384:: with SMTP id
 ss4mr89024164ejb.166.1564478851029; 
 Tue, 30 Jul 2019 02:27:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b15sm11988142ejp.7.2019.07.30.02.27.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:27:30 -0700 (PDT)
Date: Tue, 30 Jul 2019 11:27:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chunming Zhou <david1.zhou@amd.com>
Subject: Re: [PATCH] drm/syncobj: remove boring message
Message-ID: <20190730092728.GM15868@phenom.ffwll.local>
References: <20190729082039.23837-1-david1.zhou@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729082039.23837-1-david1.zhou@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mWYbiGchqs7Z2/3ZYBh4Bz6mi7RVSFE4P+K6kzNb0zw=;
 b=Ccxl9Wd/51ZUzAAkKQk8QfSX+Wi3Lk2fHSuzEeZMilK6gqXeLi4FeJ3FhfNPR3npqU
 mOxOjsqfD+2WVCU+1eJ+0NLkJ6x1tAuKVLFY9N1d11tOMhMB1PXoKaiVFrdbbOJJ9V73
 ad5Wnr9LSeeGiluoNjDbxIz20SPpDMbXF8nZE=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6MjA6MzlQTSArMDgwMCwgQ2h1bm1pbmcgWmhvdSB3
cm90ZToKPiBJdCBpcyBub3JtYWwgdGhhdCBiaW5hcnkgc3luY29iaiByZXBsYWNlcyB0aGUgdW5k
ZXJseWluZyBmZW5jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEu
emhvdUBhbWQuY29tPgoKRG8gd2UgaGl0IHRoaXMgd2l0aCBvbmUgb2YgdGhlIHN5bmNvYmogaWd0
cz8KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAzIC0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmou
Ywo+IGluZGV4IDkyOWY3YzY0ZjlhMi4uYmM3ZWMxNjc5ZTRkIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMKPiBAQCAtMTUxLDkgKzE1MSw2IEBAIHZvaWQgZHJtX3N5bmNvYmpfYWRkX3BvaW50KHN0
cnVjdCBkcm1fc3luY29iaiAqc3luY29iaiwKPiAgCXNwaW5fbG9jaygmc3luY29iai0+bG9jayk7
Cj4gIAo+ICAJcHJldiA9IGRybV9zeW5jb2JqX2ZlbmNlX2dldChzeW5jb2JqKTsKPiAtCS8qIFlv
dSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUsIHdoaWNoIGNvdWxkIGNh
dXNlIHBheWxvYWQgcmV0dXJuZWQgZnJvbSBxdWVyeV9pb2N0bCBpcyAwISAqLwo+IC0JaWYgKHBy
ZXYgJiYgcHJldi0+c2Vxbm8gPj0gcG9pbnQpCj4gLQkJRFJNX0VSUk9SKCJZb3UgYXJlIGFkZGlu
ZyBhbiB1bm9yZGVyIHBvaW50IHRvIHRpbWVsaW5lIVxuIik7Cj4gIAlkbWFfZmVuY2VfY2hhaW5f
aW5pdChjaGFpbiwgcHJldiwgZmVuY2UsIHBvaW50KTsKPiAgCXJjdV9hc3NpZ25fcG9pbnRlcihz
eW5jb2JqLT5mZW5jZSwgJmNoYWluLT5iYXNlKTsKPiAgCj4gLS0gCj4gMi4xNy4xCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
