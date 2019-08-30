Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF90A39F3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3366E22B;
	Fri, 30 Aug 2019 15:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E868B6E102;
 Fri, 30 Aug 2019 15:09:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g7so7355401wrx.2;
 Fri, 30 Aug 2019 08:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IX37xBGf5R5k6PbsX8zWqg1WxUYZJX8p+B51wVl4L5c=;
 b=ZaZwhRNSdu7JU30HIjI4iWfU0K4mVbWKuf9cF+iBCTWhO54rNADmxlIO8SmDjVT1+p
 CXwLX2dSJCzEZsPSOh377At16ToFQMRP5YA3vvQzJ9zBUPfYzA6wjWkEFfjDvPToxLys
 9rNpAQI1LVwHBYgeXP97xyo3Gb53rh39sCCMi+VEfsR0XI9zK/zgJg8bxxggBDA2xI/z
 XKOzxxRxQYIvfVH7Rr2a2UvWyiSg4Tgo+FSvLuHiw7L4FwkfFJeFykDWWL4ymT4U51l0
 lFboGIr0PDs8saoHsES+SoR2coi5OZqbQoOImcX/swHMBJ/2dx5nvHry8qy8hkT2YT/C
 xYjw==
X-Gm-Message-State: APjAAAWluf7wsYCW11jBfAsmQf3hUCsq0ZZgzvDAH4tv3viF0dJrF+ed
 BZmCdQVjqUo5XFrXzvj6+aurgKmjBNa6faqMoAc=
X-Google-Smtp-Source: APXvYqzZWxQhU7m8QEFCBHKWxT0rNy/0O2XDxDnWFdaE5Ry3PnbMsh2r9rE7CU+9Q7ik5LA8xZXXt54YpijGAL/MkYQ=
X-Received: by 2002:adf:8004:: with SMTP id 4mr18038118wrk.341.1567177798350; 
 Fri, 30 Aug 2019 08:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190830080704.GA29599@LGEARND20B15>
In-Reply-To: <20190830080704.GA29599@LGEARND20B15>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Aug 2019 11:09:43 -0400
Message-ID: <CADnq5_PZ8cuQBVXAAH8mefHbnbK9M4QexbTN_9X-yyqdeaLcbw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Move null pointer dereference check
To: Austin Kim <austindh.kim@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IX37xBGf5R5k6PbsX8zWqg1WxUYZJX8p+B51wVl4L5c=;
 b=q36KFh9FWXeiY7g0nLMvI/C8mlM9r6+D7Pq1xIxoB4DYMyN3UJNWG1qQbbXyBj90w4
 j6TBYQEcVNvNYbRKrHUydZ+Ftz1xUB9yoRW5NvDlliv5GoD90h/oOXxzgBfKKZdVV883
 c9xOUk2sVtI+M8K6+4nUA+dfyr/Bci3jUglrB5CpaGLw0BlCH8bya8kEOxGxQsSlJOEF
 QUCxobPT0A6LguDpYz0FFZeqCw9F6aU5Hxav/NPi5Ci1Y6XwUjL6h9gfkIZeorZQkgx0
 Vb/an/BD/1au+NHGmQUdTSq87ZrC4DihinhaWnj9lZRSdTN5sTOXfg9+KIBqpxinXbV7
 xVzg==
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
Cc: "Quan, Evan" <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgODo0MyBBTSBBdXN0aW4gS2ltIDxhdXN0aW5kaC5raW1A
Z21haWwuY29tPiB3cm90ZToKPgo+IE51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBjaGVjayBzaG91
bGQgaGF2ZSBiZWVuIGNoZWNrZWQsCj4gYWhlYWQgb2YgYmVsb3cgcm91dGluZS4KPiAgICAgICAg
IHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7Cj4KPiBXaXRoIHRoaXMg
Y29tbWl0LCBpdCBjb3VsZCBhdm9pZCBwb3RlbnRpYWwgTlVMTCBkZXJlZmVyZW5jZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3RpbmRoLmtpbUBnbWFpbC5jb20+CgpBcHBsaWVk
LiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211bWdyL3NtdThfc211bWdyLmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVtZ3Ivc211OF9zbXVtZ3IuYwo+IGluZGV4IDgxODlmZTQuLjQ3MjhhYTIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThf
c211bWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211
OF9zbXVtZ3IuYwo+IEBAIC03MjIsMTYgKzcyMiwxNyBAQCBzdGF0aWMgaW50IHNtdThfcmVxdWVz
dF9zbXVfbG9hZF9mdyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+Cj4gIHN0YXRpYyBpbnQgc211
OF9zdGFydF9zbXUoc3RydWN0IHBwX2h3bWdyICpod21ncikKPiAgewo+IC0gICAgICAgc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBod21nci0+YWRldjsKPiArICAgICAgIHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2Owo+Cj4gICAgICAgICB1aW50MzJfdCBpbmRleCA9IFNNTl9NUDFfU1JB
TV9TVEFSVF9BRERSICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgU01VOF9GSVJNV0FSRV9I
RUFERVJfTE9DQVRJT04gKwo+ICAgICAgICAgICAgICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1
Y3QgU01VOF9GaXJtd2FyZV9IZWFkZXIsIFZlcnNpb24pOwo+Cj4gLQo+ICAgICAgICAgaWYgKGh3
bWdyID09IE5VTEwgfHwgaHdtZ3ItPmRldmljZSA9PSBOVUxMKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPgo+ICsgICAgICAgYWRldiA9IGh3bWdyLT5hZGV2Owo+ICsKPiAgICAg
ICAgIGNnc193cml0ZV9yZWdpc3Rlcihod21nci0+ZGV2aWNlLCBtbU1QMFBVQl9JTkRfSU5ERVgs
IGluZGV4KTsKPiAgICAgICAgIGh3bWdyLT5zbXVfdmVyc2lvbiA9IGNnc19yZWFkX3JlZ2lzdGVy
KGh3bWdyLT5kZXZpY2UsIG1tTVAwUFVCX0lORF9EQVRBKTsKPiAgICAgICAgIHByX2luZm8oInNt
dSB2ZXJzaW9uICUwMmQuJTAyZC4lMDJkXG4iLAo+IC0tCj4gMi42LjIKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
