Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48065BA3E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C42882C2;
	Mon,  1 Jul 2019 10:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C467882C2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 10:59:02 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id q64so8615810vsd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 03:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfk/jjGkf/Lxlb3LgSpgMUJ3yS5JZNLxxmzV44cIBp8=;
 b=cAXz5ja0mHDRpCGsrPKEhSw6W1auAdl4pU2thlv3UUOWIlbsit3JyAPjpPbwrgeR8g
 kybSgyPC31DjFRe3S4PUM9Pk7VJ4Q4fysFm+neNxV3sQ3QHos7+JhGU5S+mRz0BP7YH1
 oD6lodHZgPoFpGoLKUT6NIapZFucZ/aF49yScyc8MwXMvjleDPFsqLz0gZkZ1sWuuRYO
 Gr57t3A/dOWMNAbKQNhZcIWn2Z+hyp7GZz58fOY+73wchgmKK+lE9YSOCL8NNIKL7wxO
 3gLs5w6txU8V55DyJXZlqHRgta9e239ObYIX8w6leZQYy0yBSyZLJvh+f/0ZDvi8me7y
 PqKQ==
X-Gm-Message-State: APjAAAV+NowJI/bFKJEv0LoGb+3uFCLdxPq7PXfmTo4cJOXjl1O79Tz0
 HtJbJMXaLoExMBHIbRf9eYMzx7MkJEVOh2b84C4=
X-Google-Smtp-Source: APXvYqzz9iCp0RB+tyrLrRkYroguc3VC+ZEJB2jP3oxXD9suSt3k4hRWgbIxd0vxR0RPz1roruWlUz56OnB5yAD/818=
X-Received: by 2002:a67:ee12:: with SMTP id f18mr15098138vsp.186.1561978741328; 
 Mon, 01 Jul 2019 03:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190623103542.30697-1-sam@ravnborg.org>
 <20190623103542.30697-2-sam@ravnborg.org>
In-Reply-To: <20190623103542.30697-2-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 1 Jul 2019 11:59:15 +0100
Message-ID: <CACvgo52zo+gda-hhrUNDr+XFJGKa8Rh13dU3M8XdDYKNwtmt-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/mga: drop dependency on drm_os_linux.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wfk/jjGkf/Lxlb3LgSpgMUJ3yS5JZNLxxmzV44cIBp8=;
 b=HQ3vj1uhUbH22VHRzrTejBW4r2FrJtYVKhfO6hAmy7Z4jPRB2Qjc9DNfgW8QgsGaEe
 i6l06rAigWHEQaHFqQ/hzB6vAJy0h7XL2DCPzuG4DUZhlTd9sLPo09hSKMZN8Er+zCqA
 WUnljzdZ02oxSv4qrrm18ErfvA9my4ypBL+oOlH4SggXt4G5EnML1snZ60y1gLjR+YTX
 OV+ZmeuSTMuql5JspmhHlfDq3eUvdczEumuh/44tB8oekbn0nn7r7zMnSvs7CsKDRAPF
 oBxcd9iznxkUHaRptdlkl1/yKwFWHr/Mz4AKA6qgf/diZtF52IcRnBDhzNdPQsSHakkC
 FSjA==
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMyBKdW4gMjAxOSBhdCAxMTozNiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKCj4gLWludCBtZ2FfZHJpdmVyX2ZlbmNlX3dhaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdW5zaWduZWQgaW50ICpzZXF1ZW5jZSkKPiArdm9pZCBtZ2FfZHJpdmVyX2ZlbmNl
X3dhaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50ICpzZXF1ZW5jZSkKPiAg
ewo+ICAgICAgICAgZHJtX21nYV9wcml2YXRlX3QgKmRldl9wcml2ID0gKGRybV9tZ2FfcHJpdmF0
ZV90ICopIGRldi0+ZGV2X3ByaXZhdGU7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgY3VyX2ZlbmNl
Owo+IC0gICAgICAgaW50IHJldCA9IDA7Cj4KPiAgICAgICAgIC8qIEFzc3VtZSB0aGF0IHRoZSB1
c2VyIGhhcyBtaXNzZWQgdGhlIGN1cnJlbnQgc2VxdWVuY2UgbnVtYmVyCj4gICAgICAgICAgKiBi
eSBhYm91dCBhIGRheSByYXRoZXIgdGhhbiBzaGUgd2FudHMgdG8gd2FpdCBmb3IgeWVhcnMKPiAg
ICAgICAgICAqIHVzaW5nIGZlbmNlcy4KPiAgICAgICAgICAqLwo+IC0gICAgICAgRFJNX1dBSVRf
T04ocmV0LCBkZXZfcHJpdi0+ZmVuY2VfcXVldWUsIDMgKiBIWiwKPiArICAgICAgIHdhaXRfZXZl
bnRfdGltZW91dChkZXZfcHJpdi0+ZmVuY2VfcXVldWUsCj4gICAgICAgICAgICAgICAgICAgICAo
KChjdXJfZmVuY2UgPSBhdG9taWNfcmVhZCgmZGV2X3ByaXYtPmxhc3RfZmVuY2VfcmV0aXJlZCkp
Cj4gLSAgICAgICAgICAgICAgICAgICAgIC0gKnNlcXVlbmNlKSA8PSAoMSA8PCAyMykpKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgLSAqc2VxdWVuY2UpIDw9ICgxIDw8IDIzKSksCj4gKyAgICAg
ICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKDMwMDApKTsKPgo+ICAgICAgICAgKnNlcXVl
bmNlID0gY3VyX2ZlbmNlOwo+IC0KPiAtICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgpNb3N0IG9m
IHRoZSBwYXRjaCBpcyBhIHRyaXZpYWwgc3Vic3RpdHV0aW9uLiBUaGlzIHBpZWNlIGlzIG5vdCB0
aG91Z2ggOi1cCkZvciB0aGUgZnV0dXJlLCBwbGVhc2Uga2VlcCBtZWNoYW5pY2FsIGFuZCBmdW5j
dGlvbmFsIGNoYW5nZXMgaW4Kc2VwYXJhdGUgcGF0Y2hlcy4KClRoYW5rcwpFbWlsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
