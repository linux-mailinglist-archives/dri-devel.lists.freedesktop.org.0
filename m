Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3564107734
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 19:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CC16F54A;
	Fri, 22 Nov 2019 18:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2146F548;
 Fri, 22 Nov 2019 18:21:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so9760330wru.3;
 Fri, 22 Nov 2019 10:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBF8KOuIYHgX5AQUGnNEqK7fiaxXdl5FhJB4ieLAIBQ=;
 b=F6lhwj0SycHc1+2iY1hIaiZm++GK4fjZbNif0/vV8Xj1He1ZAd35WlxvUfE/4LbKgq
 5uO9LLvrS7ps8XFZkNrTtFLneUowBgLuwctbPR0wejnRRmzmea2WapVIyzxLfL/Ee2UY
 ODmlkYRYr3r5p1T0E5tHIMvTrj0/fQXxhDCZn6Sx5OVr09/sJFcv61jRWuF/gG87fTnB
 6ZIjb4r8T6xywrZOlh8yVudEEvPDuUQj++M8sLN8pdgDs9WKSp29yts10JJypprASHKH
 ltiDQONFQRD2gB4azIWa3whV4ydMC6shfPAQ+f4xIsrJtgWSn5/48n1g7PFWoOWz3qsx
 N42Q==
X-Gm-Message-State: APjAAAVQhOv2+I2GfSjhS7RgJ6wdEYYO2L1M36t0okznRVWUJSks8+y3
 9vk3/Zzk1SBT3TLC7p7Z8Xj6cUGNegXA790jx30=
X-Google-Smtp-Source: APXvYqytEwccvMir2K/ExKSR+iN9/YVslC4V3V2VCpQqnB/nAm+/+YD1Z6n6WOCTIaGw160dGdTfERASM3AumnzwiIA=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr1076502wrp.40.1574446905504; 
 Fri, 22 Nov 2019 10:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20191122063749.27113-1-kraxel@redhat.com>
 <20191122063749.27113-3-kraxel@redhat.com>
 <CAKMK7uFz3hmPT3OE8UtUQwmv+tXsjazUWT2RVHLxAq47X+EaXA@mail.gmail.com>
In-Reply-To: <CAKMK7uFz3hmPT3OE8UtUQwmv+tXsjazUWT2RVHLxAq47X+EaXA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Nov 2019 13:21:33 -0500
Message-ID: <CADnq5_MvOE1Fw7-0g+Fo3Vvvu-c=Z9u+pZUEstv2cVXNKKL2=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: share address space for dma bufs
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dBF8KOuIYHgX5AQUGnNEqK7fiaxXdl5FhJB4ieLAIBQ=;
 b=cbK8yhq2kYP64/yIWyLjHR86Bm3hT1aLiBeXnIQCzYeAFUjICgmjDE/+xLcEVuwLur
 Ra+nrFRsMC7eQNxqrNOW/ye6me9w8AN2fs9Ol1t2CI3debIBu3cOwcFns6VKW7hv1w6T
 I0EKwsXSeXLtljibE347FywhcNQZn5dnS8ZdMSgNIiqCpUlghNQshb5momZR8sqsFmVP
 CSolsQnF66shqbenrz4kRJoJBhOOhl2zMpB7o33pZ/HplyWDm4NR1lOTj/S/jzXNNaRT
 ubZ+tVys888vjIUDnYcEr6IlkcqAG1zcbkP3HdskGSbHagjf3R1FMIpp9eOMmFopAxzy
 CT3g==
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
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgNDoxNyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgNzozNyBBTSBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gVXNlIHRoZSBzaGFyZWQg
YWRkcmVzcyBzcGFjZSBvZiB0aGUgZHJtIGRldmljZSAoc2VlIGRybV9vcGVuKCkgaW4KPiA+IGRy
bV9maWxlLmMpIGZvciBkbWEtYnVmcyB0b28uICBUaGF0IHJlbW92ZXMgYSBkaWZmZXJlbmNlIGJl
dHdlZW0gZHJtCj4gPiBkZXZpY2UgbW1hcCB2bWFzIGFuZCBkbWEtYnVmIG1tYXAgdm1hcyBhbmQg
Zml4ZXMgY29ybmVyIGNhc2VzIGxpa2UKPiA+IGRyb3BwaW5nIHB0ZXMgKHVzaW5nIG1hZHZpc2Uo
RE9OVE5FRUQpIGZvciBleGFtcGxlKSBub3Qgd29ya2luZwo+ID4gcHJvcGVybHkuCj4gPgo+ID4g
QWxzbyByZW1vdmUgYW1kZ3B1IGRyaXZlcidzIHByaXZhdGUgZG1hYnVmIHVwZGF0ZS4gIEl0IGlz
IG5vdCBuZWVkZWQKPiA+IGFueSBtb3JlIG5vdyB0aGF0IHdlIGFyZSBkb2luZyB0aGlzIGZvciBl
dmVyeWJvZHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPgo+IEJ1dCBJIHRoaW5rIHlvdSB3YW50IGF0IGxlYXN0IGFuIGFjayBmcm9tIGFt
ZCBndXlzIGZvciBkb3VibGUgY2hlY2tpbmcgaGVyZS4KPiAtRGFuaWVsCgpMb29rcyBjb3JyZWN0
IHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KCgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuYyB8IDQgKy0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgICAgICAg
ICAgICAgICAgfCA0ICsrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kbWFfYnVmLmMKPiA+IGluZGV4IGQ1YmNkZmVmYmFkNi4uNTg2ZGI0ZmI0NmJkIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+ID4gQEAg
LTM2MSwxMCArMzYxLDggQEAgc3RydWN0IGRtYV9idWYgKmFtZGdwdV9nZW1fcHJpbWVfZXhwb3J0
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiwKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
RVJSX1BUUigtRVBFUk0pOwo+ID4KPiA+ICAgICAgICAgYnVmID0gZHJtX2dlbV9wcmltZV9leHBv
cnQoZ29iaiwgZmxhZ3MpOwo+ID4gLSAgICAgICBpZiAoIUlTX0VSUihidWYpKSB7Cj4gPiAtICAg
ICAgICAgICAgICAgYnVmLT5maWxlLT5mX21hcHBpbmcgPSBnb2JqLT5kZXYtPmFub25faW5vZGUt
PmlfbWFwcGluZzsKPiA+ICsgICAgICAgaWYgKCFJU19FUlIoYnVmKSkKPiA+ICAgICAgICAgICAg
ICAgICBidWYtPm9wcyA9ICZhbWRncHVfZG1hYnVmX29wczsKPiA+IC0gICAgICAgfQo+ID4KPiA+
ICAgICAgICAgcmV0dXJuIGJ1ZjsKPiA+ICB9Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiBpbmRleCBh
OTYzM2JkMjQxYmIuLmMzZmMzNDE0NTNjMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbWUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiBA
QCAtMjQwLDYgKzI0MCw3IEBAIHZvaWQgZHJtX3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKHN0
cnVjdCBkcm1fcHJpbWVfZmlsZV9wcml2YXRlICpwcmltZV9mcHJpdikKPiA+ICBzdHJ1Y3QgZG1h
X2J1ZiAqZHJtX2dlbV9kbWFidWZfZXhwb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmX2V4cG9y
dF9pbmZvICpleHBfaW5mbykKPiA+ICB7Cj4gPiArICAgICAgIHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqID0gZXhwX2luZm8tPnByaXY7Cj4gPiAgICAgICAgIHN0cnVjdCBkbWFfYnVmICpkbWFf
YnVmOwo+ID4KPiA+ICAgICAgICAgZG1hX2J1ZiA9IGRtYV9idWZfZXhwb3J0KGV4cF9pbmZvKTsK
PiA+IEBAIC0yNDcsNyArMjQ4LDggQEAgc3RydWN0IGRtYV9idWYgKmRybV9nZW1fZG1hYnVmX2V4
cG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBk
bWFfYnVmOwo+ID4KPiA+ICAgICAgICAgZHJtX2Rldl9nZXQoZGV2KTsKPiA+IC0gICAgICAgZHJt
X2dlbV9vYmplY3RfZ2V0KGV4cF9pbmZvLT5wcml2KTsKPiA+ICsgICAgICAgZHJtX2dlbV9vYmpl
Y3RfZ2V0KG9iaik7Cj4gPiArICAgICAgIGRtYV9idWYtPmZpbGUtPmZfbWFwcGluZyA9IG9iai0+
ZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmc7Cj4gPgo+ID4gICAgICAgICByZXR1cm4gZG1hX2J1
ZjsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4xOC4xCj4gPgo+Cj4KPiAtLQo+IERhbmllbCBWZXR0ZXIK
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
