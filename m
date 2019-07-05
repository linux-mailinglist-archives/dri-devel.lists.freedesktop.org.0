Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546C61B01
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4589A44;
	Mon,  8 Jul 2019 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C142E6E4E3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 18:35:41 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id g20so11409332ioc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 11:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6RTglQDcnPhYZ6+ia3duitJHDfc8+bEhxKjHNNLaC3E=;
 b=PhHl4JPnPyqqD/eTKwNM8iC8T11f0KOrOkVeWDSBv358g7nID5MhGMAa0qytOXuskW
 yaFdTKgmPuy2JEnYSECFnFp397H38jp4dUzsWtohQ98XO9ysGsCxKHWmqr60k30ulIIP
 znZm909mvGeIf9BkFioQnR18RneGzE7ZwZcAbAbw80ao/T5OsZ5GKTKeHvq8KOAdphmD
 RvULJTb/nF5rzWJf8kxpl1VliOcrol7BPLi9Ald89THx4fxVIWbqWa1fYNNoyiDYnnvh
 /z0Q6hJ9sErsOHtpMRMoTk9L/kQz2SDuYoQVqVdOSkrFZfK2Ug89QM/OS4QxvgJAoG0k
 wTOA==
X-Gm-Message-State: APjAAAVclotI2QnAmOuBW5CzV33kISKkGgMjOPlHfuTCxsdh+jHfbsJK
 WHFlhyXajtyYBZrDQx0DOcNDJg01xT9rshrA2rA=
X-Google-Smtp-Source: APXvYqyd73dY/S9t5icoFq7nzm8pi6H5OC2r++hJMBl44SpiTDWX/+NV+P7GLXcL1rKew1ZlNNEFkwyeZXbwgWKdoq0=
X-Received: by 2002:a02:c95a:: with SMTP id u26mr5888920jao.15.1562351741149; 
 Fri, 05 Jul 2019 11:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
 <20190705172058.GA2788@ravnborg.org>
In-Reply-To: <20190705172058.GA2788@ravnborg.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 5 Jul 2019 12:35:30 -0600
Message-ID: <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B
 panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6RTglQDcnPhYZ6+ia3duitJHDfc8+bEhxKjHNNLaC3E=;
 b=BZ+9kgdje40skG8QZnBrGGdCq+a5PY3QRB1EP82Bv5D+ASw59GLdJ9nl/CXfWrv2Vb
 sdF/4tDpTcNbX29P0DW2295h/VzsyaIFf6sv2obahvhi1F+alJ5zWmaIJiJXRPUNeaYy
 WUaUabgcyn/IxOCELyyu3AD5IKOubFFL1lUj/Z7VEDe8z+Hz4XrYmBQwlw5UdwX4fwjD
 hC3UH/KOlUIB65U/iiQZL8bXUsDlJ5+vvTWOEFcdI8AoUkJzuUZdhsxDb3zR2QybccWT
 XnXvDsdZdq+wBp8GJNViKCsoaxzAeoKTh08miWZiKe3mFnjd5j8o0p6REXuo9vGXKrUk
 Y5Rg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMToyMSBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgSmVmZnJleS4KPgo+IFBhdGNoIGxvb2tzIGdvb2QsIGJ1dCB0
aGVyZSBpcyBhIGZldyBmaWVsZHMgdGhhdCBhcmUgbm90IGluaXRpYWxpemVkLgo+IERpZCB5b3Ug
Zm9yZ2V0IHRoZW0sIG9yIGFyZSB0aGV5IG5vdCBuZWVkZWQ/CgpUaGFua3MgZm9yIHRoZSByZXZp
ZXcuICBPdmVybG9va2VkIHNvbWUgb2YgdGhlbS4KCj4KPiBPbiBGcmksIEp1bCAwNSwgMjAxOSBh
dCAwOTo1Nzo1NUFNIC0wNzAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPiBUaGUgU2hhcnAgTEQt
RDUxMTZaMDFCIGlzIGEgMTIuMyIgZURQIHBhbmVsIHdpdGggYSAxOTIwWDEyODAgcmVzb2x1dGlv
bi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4g
PiBpbmRleCA1YTkzYzRlZGYxZTQuLmU2ZjU3ODY2NzMyNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiBAQCAtMjM1NCw2ICsyMzU0LDI5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBzYW1zdW5nX2x0bjE0MGF0MjlfMzAxID0gewo+ID4gICAg
ICAgfSwKPiA+ICB9Owo+ID4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgc2hhcnBfbGRfZDUxMTZ6MDFiX21vZGUgPSB7Cj4gPiArICAgICAuY2xvY2sgPSAxNjg0ODAs
Cj4gPiArICAgICAuaGRpc3BsYXkgPSAxOTIwLAo+ID4gKyAgICAgLmhzeW5jX3N0YXJ0ID0gMTky
MCArIDQ4LAo+ID4gKyAgICAgLmhzeW5jX2VuZCA9IDE5MjAgKyA0OCArIDMyLAo+ID4gKyAgICAg
Lmh0b3RhbCA9IDE5MjAgKyA0OCArIDMyICsgODAsCj4gPiArICAgICAudmRpc3BsYXkgPSAxMjgw
LAo+ID4gKyAgICAgLnZzeW5jX3N0YXJ0ID0gMTI4MCArIDMsCj4gPiArICAgICAudnN5bmNfZW5k
ID0gMTI4MCArIDMgKyAxMCwKPiA+ICsgICAgIC52dG90YWwgPSAxMjgwICsgMyArIDEwICsgNTcs
Cj4gPiArICAgICAudnJlZnJlc2ggPSA2MCwKPiA+ICt9Owo+IE5vIC5mbGFncz8gSXMgaXQgbm90
IG5lZWRlZCBmb3IgYW4gZURQIHBhbmVsPwoKVGhlIGZsYWdzIGRvbid0IGFwcGVhciB0byBtYWtl
IHNlbnNlIHBlciBteSB1bmRlcnN0YW5kaW5nIG9mIGVEUC4KVGhlcmVmb3JlIEkgaW50ZW5kZWQg
LmZsYWdzIHRvIGJlIDAsIHdoaWNoIGl0IGltcGxpY2l0bHkgaXMgYmVjYXVzZQp0aGlzIGlzIGEg
c3RhdGljIHN0cnVjdC4gIFdvdWxkIHlvdSBwcmVmZXIgSSBleHBsaWNpdGx5IGxpc3QgLmZsYWdz
ID0KMD8KCj4KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2hhcnBf
bGRfZDUxMTZ6MDFiID0gewo+ID4gKyAgICAgLm1vZGVzID0gJnNoYXJwX2xkX2Q1MTE2ejAxYl9t
b2RlLAo+ID4gKyAgICAgLm51bV9tb2RlcyA9IDEsCj4gPiArICAgICAuYnBjID0gOCwKPiA+ICsg
ICAgIC5zaXplID0gewo+ID4gKyAgICAgICAgICAgICAud2lkdGggPSAyNjAsCj4gPiArICAgICAg
ICAgICAgIC5oZWlnaHQgPSAxMjAsCj4gPiArICAgICB9LAo+ID4gK307Cj4gTm8gLmJ1c19mb3Jt
YXQ/CgpBaCwgeWVzLiAgTG9va3MgbGlrZSBpdCBzaG91bGQgYmUgTUVESUFfQlVTX0ZNVF9SR0I4
ODhfMVgyNApXaWxsIGZpeC4KCj4gTm8gLmJ1c19mbGFncz8KCmVEUCBpcyBkaWZmZXJlbnRpYWwg
c2lnbmFsaW5nLCBzbyB3aGF0IEkgc2VlIGdlbmVyYWxseSBkb2Vzbid0IGFwcGx5LApidXQgRFJN
X0JVU19GTEFHX0RBVEFfTVNCX1RPX0xTQiBkb2VzIGFwcGx5LCBzbyBJJ2xsIGFkZCB0aGF0Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
