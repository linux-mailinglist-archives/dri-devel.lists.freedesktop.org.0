Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BB165C3A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 11:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60DA6ED25;
	Thu, 20 Feb 2020 10:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3093D6ED25;
 Thu, 20 Feb 2020 10:55:31 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id l6so1375285uap.13;
 Thu, 20 Feb 2020 02:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iUhND/jqbsHMtseTMJKjeevEhhNa9hcuttuXUB9R9mc=;
 b=Z56Pj0JVVHXf2NxaDElQgm6uyy2TZtCRD5QtcloVDS8PEhmqt2hppVKEeP3jSjUj0G
 Hr/aZQMakubaP1hNzzF4QJCl3HzoIBWYfExuENPYp2KqdgqyX0D0CDXRdd1YUI25SvpY
 vK7J6l2Yr2IODiL1IoB1hcFS1aZ1+GaS/hn73gmQb8fWQndaDPTYr8cLFZWoF2/aYR8c
 15DjbG8+yKFUTDN0R2K5VuPynVSG7DhjvhmM5+A7zv74++X+e2xarPny0fc+UY4UOSud
 y0e6crmnp7/3De1yQ8idrZy70cpkkWMnyfRIZ8SNxIU0WKO1CDYjaxGkxkIbfaJQG/dN
 LAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iUhND/jqbsHMtseTMJKjeevEhhNa9hcuttuXUB9R9mc=;
 b=XHqBDYo6VfcRVQsj4Bpl3JfP7Q0UMnJC79f8IPeGiv86vJQh4EqGrokvNQyNBG6xxh
 eFfG1g047hqjkv/sMfq/+HRy75UO+RDfzzx7x+cJugC5D9+IC+47RTpr1otA2WBCWA+c
 kAG5XEPzSv/ZjcYEWk0jdkSWaOQr06t3nqBWRK//LA748as/XnzvwQyF6RCReOO2DHH6
 Z9RX0/LvfUWh2t1ZA1Q0jMbYN/IpJGS6nW+lL4pJ8qFs8cuTR8mYKFwQ5sqEyAgv/NCA
 sjKadKS5w7NpBkstPBK0DOcgOnb/IaDc6kJ54FWu85nJ2fz3FyRYuKK4PwdSKsKa23jy
 Oolw==
X-Gm-Message-State: APjAAAVf5rHhEWxW9ijNtuCxXu/pJPoaBwKoCFjizC4E9f9qmkRPCse4
 yAZmD9eJFr5jcEYLqM3KwHK6tkQors7GPa2+GLkmWC1D
X-Google-Smtp-Source: APXvYqwZBCMfHkdZJ732EXCw4eYhFUg+OgQyC+dbTkhtRaZv8Ajhxexzf3mHS68udOZ5gz4Q4sRib6viJgCeNhSbu7Y=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr15588694uae.106.1582196130183; 
 Thu, 20 Feb 2020 02:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-2-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 10:55:18 +0000
Message-ID: <CACvgo53w0+anXrf0fSGkdAx8gctMFzLh311n74tBCQ7qt+_--A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/12] drm: Nuke mode->hsync
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNSwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IExldCdzIGp1c3QgY2FsY3VsYXRlIHRoZSBo
c3luYyByYXRlIG9uIGRlbWFuZC4gTm8gcG9pbnQgaW4gd2FzdGluZwo+IHNwYWNlIHN0b3Jpbmcg
aXQgYW5kIHJpc2tpbmcgdGhlIGNhY2hlZCB2YWx1ZSBnZXR0aW5nIG91dCBvZiBzeW5jCj4gd2l0
aCByZWFsaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5j
ICAgICAgICAgICAgICAgICAgfCAxNCArKy0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8ICAxIC0KPiAgaW5jbHVkZS9kcm0vZHJtX21v
ZGVzLmggICAgICAgICAgICAgICAgICAgICAgfCAxMCAtLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMK
PiBpbmRleCBkNGQ2NDUxOGUxMWIuLmZlN2U4NzJhNjIzOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMK
PiBAQCAtNzUyLDI0ICs3NTIsMTQgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9zZXRfbmFtZSk7
Cj4gICAqIEBtb2RlOiBtb2RlCj4gICAqCj4gICAqIFJldHVybnM6Cj4gLSAqIEBtb2RlcydzIGhz
eW5jIHJhdGUgaW4ga0h6LCByb3VuZGVkIHRvIHRoZSBuZWFyZXN0IGludGVnZXIuIENhbGN1bGF0
ZXMgdGhlCj4gLSAqIHZhbHVlIGZpcnN0IGlmIGl0IGlzIG5vdCB5ZXQgc2V0Lgo+ICsgKiBAbW9k
ZXMncyBoc3luYyByYXRlIGluIGtIeiwgcm91bmRlZCB0byB0aGUgbmVhcmVzdCBpbnRlZ2VyCj4g
ICAqLwo+ICBpbnQgZHJtX21vZGVfaHN5bmMoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUpCj4gIHsKPiAtICAgICAgIHVuc2lnbmVkIGludCBjYWxjX3ZhbDsKPiAtCj4gLSAgICAg
ICBpZiAobW9kZS0+aHN5bmMpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBtb2RlLT5oc3luYzsK
PiAtCj4gICAgICAgICBpZiAobW9kZS0+aHRvdGFsIDw9IDApCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+Cj4gLSAgICAgICBjYWxjX3ZhbCA9IChtb2RlLT5jbG9jayAqIDEwMDApIC8gbW9k
ZS0+aHRvdGFsOyAvKiBoc3luYyBpbiBIeiAqLwo+IC0gICAgICAgY2FsY192YWwgKz0gNTAwOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogcm91bmQgdG8gMTAwMEh6ICovCj4gLSAg
ICAgICBjYWxjX3ZhbCAvPSAxMDAwOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB0
cnVuY2F0ZSB0byBrSHogKi8KPiAtCj4gLSAgICAgICByZXR1cm4gY2FsY192YWw7Cj4gKyAgICAg
ICByZXR1cm4gRElWX1JPVU5EX0NMT1NFU1QobW9kZS0+Y2xvY2ssIG1vZGUtPmh0b3RhbCk7Cj4g
IH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9oc3luYyk7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+IGluZGV4IGVlN2Q1NGNjZDNlNi4uZmFi
OTE0ODE5NDg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5LmMKPiBAQCAtODg2Nyw3ICs4ODY3LDYgQEAgdm9pZCBpbnRlbF9tb2RlX2Zyb21fcGlw
ZV9jb25maWcoc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCj4KPiAgICAgICAgIG1vZGUt
PmNsb2NrID0gcGlwZV9jb25maWctPmh3LmFkanVzdGVkX21vZGUuY3J0Y19jbG9jazsKPgo+IC0g
ICAgICAgbW9kZS0+aHN5bmMgPSBkcm1fbW9kZV9oc3luYyhtb2RlKTsKCldpdGggdGhpcyBnb25l
LCB3ZSBjb3VsZCBtYWtlIGRybV9tb2RlX2hzeW5jKCkgaW50ZXJuYWwgYW5kIG1vdmUgaXQgdG8K
ZHJtX2Zvb19pbnRlcm5hbC5oLgpNYWtpbmcgaXQgb2J2aW91cyB0aGF0IGRyaXZlcnMsIHNob3Vs
ZCBiZSBjb3B5L3Bhc3RpbmcgaXQuCgpSZWdhcmRsZXNzLCB0aGUgcGF0Y2ggaXM6ClJldmlld2Vk
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
