Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8C5E3CC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 14:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6E46E12B;
	Wed,  3 Jul 2019 12:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B736E12B;
 Wed,  3 Jul 2019 12:25:45 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w20so1905056edd.2;
 Wed, 03 Jul 2019 05:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPb7Hz/aUpRJZzTZLNZiyzmAnZP9z54WdoZUYMn88X0=;
 b=lsGCJUcuGTemXwHqpbcmDPNpxxrEjHj66MtKi6OkkmMPHehSKCwl1IfYm/7KFGRJCk
 Wc4jLse102ktql0/aq51vpJAWKJopbGRzsfcDHaXS4sHBvN3zwNmVXLAQ/msrEfqI3aH
 cZCuHira2QBJBkDhhI6FgyvONaoB9N3VY5hMdk/RuWsaJLgQROs03FWOCgXhIJtGYL5z
 R/kSjAfzn6Ru+IKsRJk+0VzpAOe4so7/x3+3QZB8+gVNPAbAGJlFflKaT7KuyaleC+1t
 yGyW8f88Vb9z2VF2tRZvTpesSAWhkWu7pcwXDerXJl1k0of9joqlP/dKVguh6zQ7/oN0
 hFeA==
X-Gm-Message-State: APjAAAVm/lXytFbOb8UJk3KYRZjBlSMPQ39ycP18b8RGc2hCKB0LvJoA
 5OlRBy2HJl3+i4KptbXK7Lc3zdLEDyRovYuGBTh4YY7mcAg=
X-Google-Smtp-Source: APXvYqwwqBwoR0MKYgtbC2RmXe+Vq0vZxW7XMvoTuUUUmhoh1kZpu2I3IiFIpogQ8NwcLjzrOgckudH6yN1/qTMZEO8=
X-Received: by 2002:a17:906:3612:: with SMTP id
 q18mr34803196ejb.278.1562156744041; 
 Wed, 03 Jul 2019 05:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
 <20190703040843.GA27383@builder>
In-Reply-To: <20190703040843.GA27383@builder>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jul 2019 05:25:27 -0700
Message-ID: <CAF6AEGvwMj+R6KbFYbatx8AuF+5mztc7246ocKXfRWnpphv9NA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address
 space
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MPb7Hz/aUpRJZzTZLNZiyzmAnZP9z54WdoZUYMn88X0=;
 b=vHchkMOvsHv8kCbADBZUi1vqLd4RTY+FiPP9Lcmq+0/ksI+sEADt3BL/B6j1XPh4sv
 8mVZ5lV2G5n5tMEJRJFIZ0fo979d1UN6QoxOmHlllEUg3J1Pwy2ex1GT3DhC1CpuQtWl
 2gXnxt80cMG1BqF8rJSpfWYyGXRpHG8QCgnHjyNStOeM3/WYWkFB3oyfCYxA5xm0DUxc
 x9s6+4ojoKtayGxCeER/E4qGN6dWO2A/1tiAUiMgIpdOyxz3m267eY7/dEf651rPsIzO
 edygRg5PthgrTVRS6jqy504BnS7OQUcdBI4bM2kXuffv+e/FTrmLzf/3XoY/PuZrOtVf
 nVRw==
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA5OjA4IFBNIEJqb3JuIEFuZGVyc3Nvbgo8Ympvcm4uYW5k
ZXJzc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uIDAxIEp1bCAxMDozOSBQRFQgMjAx
OSwgSmVmZnJleSBIdWdvIHdyb3RlOgo+Cj4gPiBDcmVhdGluZyB0aGUgbXNtIGdlbSBhZGRyZXNz
IHNwYWNlIHJlcXVpcmVzIGEgcmVmZXJlbmNlIHRvIHRoZSBkZXYgd2hlcmUKPiA+IHRoZSBpb21t
dSBpcyBsb2NhdGVkLiAgVGhlIGRyaXZlciBjdXJyZW50bHkgYXNzdW1lcyB0aGlzIGlzIHRoZSBz
YW1lIGFzCj4gPiB0aGUgcGxhdGZvcm0gZGV2aWNlLCB3aGljaCBicmVha3Mgd2hlbiB0aGUgaW9t
bXUgaXMgb3V0c2lkZSBvZiB0aGUKPiA+IHBsYXRmb3JtIGRldmljZS4gIFVzZSB0aGUgZHJtX2Rl
dmljZSBpbnN0ZWFkLCB3aGljaCBoYXBwZW5zIHRvIGFsd2F5cyBoYXZlCj4gPiBhIHJlZmVyZW5j
ZSB0byB0aGUgcHJvcGVyIGRldmljZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1
Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPgo+IFNvcnJ5LCBidXQgb24gZGI4MjBjIHRo
aXMgcGF0Y2ggcmVzdWx0cyBpbjoKPgo+IFsgICA2NC44MDMyNjNdIG1zbV9tZHAgOTAxMDAwLm1k
cDogW2RybTptZHA1X2ttc19pbml0IFttc21dXSAqRVJST1IqIGZhaWxlZCB0byBhdHRhY2ggaW9t
bXU6IC0xOQo+Cj4gRm9sbG93ZWQgYnkgMyBvb3BzZXMgYXMgd2UncmUgdHJ5aW5nIHRvIGZhaWwg
dGhlIGluaXRpYWxpemF0aW9uLgoKeWVhaCwgdGhhdCBpcyBraW5kYSB3aGF0IEkgc3VzcGVjdGVk
IHdvdWxkIGhhcHBlbi4gIEkgZ3Vlc3MgdG8gZGVhbAp3aXRoIGhvdyB0aGluZ3MgYXJlIGhvb2tl
ZCB1cCBvbiA4OTk4LCBwZXJoYXBzIHRoZSBiZXN0IHRoaW5nIGlzIHRvCmZpcnN0IHRyeSAmcGRl
di0+ZGV2LCBhbmQgdGhlbiBpZiB0aGF0IGZhaWxzIHRyeSBkZXYtPmRldgoKQlIsCi1SCgo+IFJl
Z2FyZHMsCj4gQmpvcm4KPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
a21zLmMKPiA+IGluZGV4IDRhNjBmNWZjYTZiMC4uMTM0N2E1MjIzOTE4IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+ID4gQEAgLTcwMiw3ICs3MDIs
NyBAQCBzdHJ1Y3QgbXNtX2ttcyAqbWRwNV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQo+ID4gICAgICAgbWRlbGF5KDE2KTsKPiA+Cj4gPiAgICAgICBpZiAoY29uZmlnLT5wbGF0Zm9y
bS5pb21tdSkgewo+ID4gLSAgICAgICAgICAgICBhc3BhY2UgPSBtc21fZ2VtX2FkZHJlc3Nfc3Bh
Y2VfY3JlYXRlKCZwZGV2LT5kZXYsCj4gPiArICAgICAgICAgICAgIGFzcGFjZSA9IG1zbV9nZW1f
YWRkcmVzc19zcGFjZV9jcmVhdGUoZGV2LT5kZXYsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25maWctPnBsYXRmb3JtLmlvbW11LCAibWRwNSIpOwo+ID4gICAgICAgICAgICAg
ICBpZiAoSVNfRVJSKGFzcGFjZSkpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBQ
VFJfRVJSKGFzcGFjZSk7Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
