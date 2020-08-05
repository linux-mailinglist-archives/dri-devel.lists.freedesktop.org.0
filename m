Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E000723C531
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD876E4CF;
	Wed,  5 Aug 2020 05:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A196E4CF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:45:20 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id n141so21014064ybf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b0P1cKIuNkSz1RzlJlj63vra5OopplnvFoCk8au2o1M=;
 b=mSyku1I0RqJt/gtydSkJuxckB0I95ivQVDGbUriAwCJ/sNe0Cmyf4VXFXdQRmjD4Ql
 fjBjXLr4oQ9vHbrQT8pDLyUv9I+QmmXjjjh+f+Cf7IJ4R8ty288Ul3QCzG3uuuZVokDu
 GD1nWPQlBIm8HFcYQce7zykjyid8qBteVac2YUkBXRwmdxL1lRA3Fazl7RejJ/B0nMUe
 PdlqfPBfMJ4idLM9+ToyRAsHgv8k3iMJznihscmnw038kZBmLwaFp/SDoHMBaMtPVVFF
 CJ7rhFia9pw/0nmCn5BEmm8I5X2L2uWgNaEUfezQ6D8O8KNPdAVrnK41hBB3lz6SWvNr
 WR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b0P1cKIuNkSz1RzlJlj63vra5OopplnvFoCk8au2o1M=;
 b=AFdJ10+ODeB25uksGqQrYgfcYFZOcB01DujLggCah7kGzUs+3P8d7E95OsQDJY19xn
 /uXoai8HWoTwn9m/YS7S73uKaV+isrCY/6aAxs+SqfXayJbLpsKPQrPWYzHQnKPz9dvG
 yV0TnR7gQdeHIEH6H3DU0+kt8xh3a0vIK3vHy4/8JN0weZFH6lRPyaMunMBYviRHfG8j
 gpXYP+IkGm55HOks1FWf+gkCPqpcqhvuvW54dCd/h1jP0/nH/jJmUBCgL4m7welsRBIL
 aR8IVLParC3y8ieV4mBaPkQVi65lKLsiJe3xZK1Mcjx2SwMw1bzWT73DynUDUBCrXx6d
 pdFg==
X-Gm-Message-State: AOAM531jNO9hrpw1P2jDxv/+8T3SjW3SCpCblHHQlvts2MyJ7mN0B5Lq
 r5zYMQ+WBPa/5jHBFdybHBEZFJ08KOqcmB+EuElXtq4ADCI=
X-Google-Smtp-Source: ABdhPJyOrdGPtXsYdwrIkiSGCHCEN0YlD28usLIBNV6kFlPwXdVIX3pPiugyiIN5JDhP4Phbji2VIFC559mxczyXY9g=
X-Received: by 2002:a25:3803:: with SMTP id f3mr2275266yba.470.1596606319995; 
 Tue, 04 Aug 2020 22:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-35-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-35-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:45:08 +1000
Message-ID: <CACAvsv4rqW2dWZ+QvgeSjrbrW6tkq=_OYmWZZ9JX5wsDCvZpCw@mail.gmail.com>
Subject: Re: [PATCH 34/59] drm/ttm: remove range manager legacy takedown path
To: Dave Airlie <airlied@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDEyOjU4LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+
IE5vdyBhbGwgZHJpdmVycyBoYXZlIGJlZW4gY29udmVydGVkLCBkcm9wIHRoZSBub24tZHJpdmVy
IHBhdGguCj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+ClJldmlld2VkLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMgfCAyOCArKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21h
bmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYwo+IGluZGV4IDk2
ZGEyMmJlNjcyYi4uODZiZjVlNzFlOTU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX21hbmFnZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21h
bmFnZXIuYwo+IEBAIC0xMjksMjYgKzEyOSwxMSBAQCBpbnQgdHRtX3JhbmdlX21hbl9pbml0KHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICB9Cj4gIEVYUE9SVF9TWU1CT0wodHRtX3Jhbmdl
X21hbl9pbml0KTsKPgo+IC1zdGF0aWMgaW50IHR0bV9ib19tYW5fdGFrZWRvd25fcHJpdmF0ZShz
dHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikKPiAtewo+IC0gICAgICAgc3RydWN0IHR0
bV9yYW5nZV9tYW5hZ2VyICpybWFuID0gKHN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqKSBtYW4t
PnByaXY7Cj4gLSAgICAgICBzdHJ1Y3QgZHJtX21tICptbSA9ICZybWFuLT5tbTsKPiAtCj4gLSAg
ICAgICBzcGluX2xvY2soJnJtYW4tPmxvY2spOwo+IC0gICAgICAgaWYgKGRybV9tbV9jbGVhbiht
bSkpIHsKPiAtICAgICAgICAgICAgICAgZHJtX21tX3Rha2Vkb3duKG1tKTsKPiAtICAgICAgICAg
ICAgICAgc3Bpbl91bmxvY2soJnJtYW4tPmxvY2spOwo+IC0gICAgICAgICAgICAgICBrZnJlZShy
bWFuKTsKPiAtICAgICAgICAgICAgICAgbWFuLT5wcml2ID0gTlVMTDsKPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gLSAgICAgICB9Cj4gLSAgICAgICBzcGluX3VubG9jaygmcm1hbi0+bG9j
ayk7Cj4gLSAgICAgICByZXR1cm4gLUVCVVNZOwo+IC19Cj4gLQo+ICBpbnQgdHRtX3JhbmdlX21h
bl9maW5pKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pCj4gIHsKPiArICAgICAgIHN0cnVj
dCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IChzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikg
bWFuLT5wcml2Owo+ICsgICAgICAgc3RydWN0IGRybV9tbSAqbW0gPSAmcm1hbi0+bW07Cj4gICAg
ICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICB0dG1fbWVtX3R5cGVfbWFuYWdlcl9kaXNhYmxlKG1h
bik7Cj4gQEAgLTE1Nyw3ICsxNDIsMTMgQEAgaW50IHR0bV9yYW5nZV9tYW5fZmluaShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4KPiAtICAgICAgIHR0bV9ib19tYW5fdGFrZWRvd25fcHJpdmF0ZShtYW4p
Owo+ICsgICAgICAgc3Bpbl9sb2NrKCZybWFuLT5sb2NrKTsKPiArICAgICAgIGRybV9tbV9jbGVh
bihtbSk7Cj4gKyAgICAgICBkcm1fbW1fdGFrZWRvd24obW0pOwo+ICsgICAgICAgc3Bpbl91bmxv
Y2soJnJtYW4tPmxvY2spOwo+ICsgICAgICAga2ZyZWUocm1hbik7Cj4gKyAgICAgICBtYW4tPnBy
aXYgPSBOVUxMOwo+ICsKPiAgICAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2NsZWFudXAobWFu
KTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gQEAgLTE3NCw3ICsxNjUsNiBAQCBzdGF0aWMg
dm9pZCB0dG1fYm9fbWFuX2RlYnVnKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+
ICB9Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0
bV9ib19tYW5hZ2VyX2Z1bmMgPSB7Cj4gLSAgICAgICAudGFrZWRvd24gPSB0dG1fYm9fbWFuX3Rh
a2Vkb3duX3ByaXZhdGUsCj4gICAgICAgICAuZ2V0X25vZGUgPSB0dG1fYm9fbWFuX2dldF9ub2Rl
LAo+ICAgICAgICAgLnB1dF9ub2RlID0gdHRtX2JvX21hbl9wdXRfbm9kZSwKPiAgICAgICAgIC5k
ZWJ1ZyA9IHR0bV9ib19tYW5fZGVidWcKPiAtLQo+IDIuMjYuMgo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
