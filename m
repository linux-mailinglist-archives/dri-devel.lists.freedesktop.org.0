Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B39BBE6
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 07:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D3B6E087;
	Sat, 24 Aug 2019 05:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05856E087
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 05:06:20 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id t14so10688226lji.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 22:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b54ed8P+GOfbb9XCrH1tk9TTfO2Mo3ikOCutAZLr98I=;
 b=am4cVAkPWjrrsPlb69/cYsiO/Xruck/+5Waqf5etFbCZO4z373SABP0I6zox23XNkC
 r3+QF/hyzeFwWFQ2n1Rm2PfnNuunGEdvFHGhuSAKdpCptMUp5G3UhFwNml3YVG0boj+k
 sHbEU3/PmHShqaNNp8tu8NQVE1SLhRebv1eoZt0DX/xYJNOvv4V+jqh2jV8qxKmXrMdI
 9+l36vPnZ1ED4+akaXgKL8F5oDhsi3DvSmAqFfrV/IWRa8IAvflXUuxv9PZbzrUwiGWa
 k4UR2kN9WPJuSKaiv2Mt49GW5VuvrZ9HmdKlLJ/B9tOfiw6pLMUjeVKC6/qwhc4XL3wr
 TeYQ==
X-Gm-Message-State: APjAAAXccbwQOz4+5LRafBTS7SvHew3wZKR4tZReb1FFnQ8cEJKe5htO
 Sx3MKWczpG4iyHm1XntCD/AeMtPqbhnxQAErf9E=
X-Google-Smtp-Source: APXvYqzE9ZELWFmem42Dlt+IaOJCFbhzPxO80m1Y/MB1CAh+9g2qYs2Iw0R6rqR9mI9vkf//LxTUvIBCYQHrW62ITy8=
X-Received: by 2002:a2e:6342:: with SMTP id x63mr4844822ljb.95.1566623178548; 
 Fri, 23 Aug 2019 22:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com>
 <20190824135300.23a5fcb4@canb.auug.org.au>
In-Reply-To: <20190824135300.23a5fcb4@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 24 Aug 2019 15:06:07 +1000
Message-ID: <CAPM=9tzQ=3BNveNZ_misvZXAUZo+b6uxrQUbHePuaeYnizhHcw@mail.gmail.com>
Subject: Re: next/master build: 218 builds: 4 failed, 214 passed, 10 errors,
 786 warnings (next-20190823)
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=b54ed8P+GOfbb9XCrH1tk9TTfO2Mo3ikOCutAZLr98I=;
 b=KxTepgc0UP2zRQaxxNfC1vKUfrPn9sfTF5/1Lyx+xcNyD5INsLgRMhffR8SxBPqD/T
 WkI4TF5y0JldI1PiHmK7wHAJaj+faas1ytTTrrnyC5SKDZuguGEpJPsQ+PH3A8wab4Dm
 mGq5TGnru4EVLJRjea6qkCKY1ChtItoEPy2hpeLKyqZw7GOopmP+1Ap6/6DY962hC5t3
 ACe3tA0hDVyiQooncb36Blv6dzFfHObbymrENDwtuq+HhK0rET1r5OAwIkzDanAhAccu
 eryX16z5lTBey5TUgj9mgk+Zq1ciUkBQswF87mf4mRzAUaJYCgREmiaIs/fGuoARNMzq
 cHJA==
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
Cc: Dave Airlie <airlied@linux.ie>, linux-next <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyNCBBdWcgMjAxOSBhdCAxMzo1MywgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIu
YXV1Zy5vcmcuYXU+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gT24gRnJpLCAyMyBBdWcgMjAxOSAx
NzowMDozOSAtMDcwMCAoUERUKSAia2VybmVsY2kub3JnIGJvdCIgPGJvdEBrZXJuZWxjaS5vcmc+
IHdyb3RlOgo+ID4KPiA+ICAgICAyICAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jOjI5MTo4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2Rt
YV9zZXRfbWF4X3NlZ19zaXplJzsgZGlkIHlvdSBtZWFuICdkcm1fcmVjdF9hZGp1c3Rfc2l6ZSc/
IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ID4gICAgIDIgICAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmM6MjkxOjUyOiBlcnJvcjogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ0RNQV9CSVRfTUFTSyc7IGRpZCB5b3UgbWVhbiAn
QklUX01BU0snPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ICAg
ICAxICAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jOjI5MTo4OiBlcnJv
cjogdGhpcyBmdW5jdGlvbiBkZWNsYXJhdGlvbiBpcyBub3QgYSBwcm90b3R5cGUgWy1XZXJyb3Is
LVdzdHJpY3QtcHJvdG90eXBlc10KPiA+ICAgICAxICAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jOjI5MTo4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24gJ2RtYV9zZXRfbWF4X3NlZ19zaXplJyBbLVdlcnJvciwtV2ltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQo+ID4gICAgIDEgICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmM6MjkxOjUyOiBlcnJvcjogdGhpcyBmdW5jdGlvbiBkZWNsYXJhdGlvbiBpcyBub3Qg
YSBwcm90b3R5cGUgWy1XZXJyb3IsLVdzdHJpY3QtcHJvdG90eXBlc10KPiA+ICAgICAxICAgIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jOjI5MTo1MjogZXJyb3I6IGltcGxp
Y2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdETUFfQklUX01BU0snIFstV2Vycm9yLC1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4KPiBDYXVzZWQgYnkgY29tbWl0Cj4KPiAgIDA3
MDk1NTU1OGU4MiAoImRybS9tZWRpYXRlazogc2V0IERNQSBtYXggc2VnbWVudCBzaXplIikKPgo+
IChmcm9tIHRoZSBkcm0tZml4ZXMgdHJlZSkgd2hpY2ggc2hvdWxkIGhhdmUgaW5jbHVkZWQgbGlu
dXgvZG1hLW1hcHBpbmcuaAo+CgptdXN0IGJlIHNvbWUgS2NvbmZpZyBjYXNlcywgaXQgYnVpbGRz
IGhlcmUgZmluZSAoaW4gLWZpeGVzIGF0IGxlYXN0KS4KCk1heWJlIHNvbWV0aGluZyBpbiBuZXh0
IHdoYWNrZWQgdGhlIGluY2x1ZGUgZmlsZS4KCkknbGwgYWRkIHRoZSBpbmNsdWRlIGFueXdheXMg
YW5kIHNlbmQgdG8gTGludXMsCgpEYXZlLgoKPiAtLQo+IENoZWVycywKPiBTdGVwaGVuIFJvdGh3
ZWxsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
