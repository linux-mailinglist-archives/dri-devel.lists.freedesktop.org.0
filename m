Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18F5AD37
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 21:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A825C6E9B4;
	Sat, 29 Jun 2019 19:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004076E9B3;
 Sat, 29 Jun 2019 19:56:16 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z25so16619910edq.9;
 Sat, 29 Jun 2019 12:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEEhZe9y6Tj5RmcezO+cewOsrq7aqdui6cDX8dh2Q2k=;
 b=BsJGzIOZMObI5SaqwC0wPgptgmZqLJMIDxqdV4PHi0Hdq5xkfma9wCBEb5SZPI6zOe
 lXbF/+DIGyjRyrEsHmOGc6npGOKD4f18Z3mNgEakc7nl08ZdlbEKFf6HDWlJ+6dib6h5
 lZ+3Y3VooEXg4skcalZAtuET+wwe8mlyZHXyNZi2ZK+917MC6bu6kOaLf5qBD2gD8HBC
 Qp/8ByXrCwOSwJclOODCua4fb8AkuO9mvldwoDCQvW54/LuGC8Mjvmg089JZaSMFqVyL
 rCjfyCT6sLBuu+Tpu0rOZN5+o0iyGijLQlDTBvAL6bypS9Tv3DJa+IWs9n72t1yjdNFB
 b4AA==
X-Gm-Message-State: APjAAAUFNEddSIsuSSZEr7S6ga8J0paQ/wpeyPqWfummI/5KwsLM9YFK
 FFyb1qH9ilUj6UgW8rh26PzXGEI6xJsiWPa/thY=
X-Google-Smtp-Source: APXvYqxN8gyKudU+Xnn2u4IYRblYxfkXdpeZl+cSB3KMU/hJ1uQ2wvTMlirxK6ZIgGSs/Sn7JnpPaVq3iwWKiFzvauw=
X-Received: by 2002:a17:906:3612:: with SMTP id
 q18mr15527385ejb.278.1561838175538; 
 Sat, 29 Jun 2019 12:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
 <CAF6AEGuLvgfWYdGm-0caGbWcvzt7raCWkz_sBCxFKV99YQZmeg@mail.gmail.com>
In-Reply-To: <CAF6AEGuLvgfWYdGm-0caGbWcvzt7raCWkz_sBCxFKV99YQZmeg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 29 Jun 2019 12:55:59 -0700
Message-ID: <CAF6AEGty6eJwi5ORm5z5xtC6pKe5iKiSAVLaT_++Qn_ZTX-0zw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Transition console to msm framebuffer
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KEEhZe9y6Tj5RmcezO+cewOsrq7aqdui6cDX8dh2Q2k=;
 b=JdzMUl+g0sgQi4R0D+GbHLxaAa5c7AWRgFEEklS/7g6WAeoD6rJIKsdrMTwlbY9rXP
 oLHHjRu5HRgDSjiwgAgR2TdDmljNPySDVTB16UX/vaiIppKpOjBUNVG6px1Vd64zi5iz
 VIktfHa4jIIRFZVScW6Su4o6aDd3Tu+RzPh4n/KOLvxOsVZzOhoRxm7bwD3MaUfKLbpO
 UpEUmQWsHVI8E/tk4c9rVWDmqy3GcC3zlZWnnv4teHQuw2qtnZtmsL4wzWbjqyBVEnwc
 MyqiZ4WSMKt00UHmIzosXVqHIW9RPCtaZubzJw60t7vFIXOToT1Ls7e0NgNOJ0uFYSRp
 TkZw==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjksIDIwMTkgYXQgMTA6NDYgQU0gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDk6MjggQU0gSmVmZnJl
eSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IElmIGJvb3Rp
bmcgYSBkZXZpY2UgdXNpbmcgRUZJLCBlZmlmYiB3aWxsIGxpa2VseSBjb21lIHVwIGFuZCBjbGFp
bSB0aGUKPiA+IGNvbnNvbGUuICBXaGVuIHRoZSBtc20gZGlzcGxheSBzdGFjayBmaW5hbGx5IGNv
bWVzIHVwLCB3ZSB3YW50IHRoZQo+ID4gY29uc29sZSB0byBtb3ZlIG92ZXIgdG8gdGhlIG1zbSBm
Yiwgc28gYWRkIHN1cHBvcnQgdG8ga2ljayBvdXQgYW55Cj4gPiBmaXJtd2FyZSBiYXNlZCBmcmFt
ZWJ1ZmZlcnMgdG8gYWNjb21wbGlzaCB0aGUgY29uc29sZSB0cmFuc2l0aW9uLgo+ID4KPiA+IFN1
Z2dlc3RlZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4KPiBsZ3RtLAo+
Cj4gUmV2aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KCmFuZCBJJ2xs
IGFsc28gYWRkLCBvbiB5b2dhIGM2MzAsCgpUZXN0ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT4KCgo+Cj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Zi
ZGV2LmMgfCAzICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2ZiZGV2LmMKPiA+IGluZGV4IDI0MjlkNWU2Y2U5Zi4uZTM4MzZjNzcy
NWE2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYwo+ID4gQEAgLTE2OSw2ICsxNjks
OSBAQCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqbXNtX2ZiZGV2X2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKPiA+ICAgICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgICBnb3RvIGZp
bmk7Cj4gPgo+ID4gKyAgICAgICAvKiB0aGUgZncgZmIgY291bGQgYmUgYW55d2hlcmUgaW4gbWVt
b3J5ICovCj4gPiArICAgICAgIGRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1l
YnVmZmVycyhOVUxMLCAibXNtIiwgZmFsc2UpOwo+ID4gKwo+ID4gICAgICAgICByZXQgPSBkcm1f
ZmJfaGVscGVyX2luaXRpYWxfY29uZmlnKGhlbHBlciwgMzIpOwo+ID4gICAgICAgICBpZiAocmV0
KQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZmluaTsKPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
