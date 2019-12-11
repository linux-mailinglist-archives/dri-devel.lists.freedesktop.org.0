Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE811AA2C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 12:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895E26E89D;
	Wed, 11 Dec 2019 11:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30796E89D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 11:47:22 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id p191so6702184vkf.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 03:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KPw4BWkTUh66N/l+oHgRw2epWlItk5ePmLSBKI5Tyjc=;
 b=fLp0q+Aq+pCU0RkbRVrb2N2a9Cbry6BHuCOylVJULtiPiEObiSOxp/zavD8nzE+zj5
 lKyW0NHDPZ0wyI2Z9BVSwsGC29TKNdK8TOKRQdV2ICMjyhsvO2bGHVWapjhh/k6lyHgp
 4AL6rw3TQQnY6t3Zl8z9oJ4GdUKiSRVij2DWsfvZDXfk7GomIsw45hb55Y9zE9UTW+j6
 TOwDPrUo/s0V38hskklMtX9r46NWjQHRUmSZm7NxUXfwLOvEIoz/6AufILKs6XIXdsm8
 PKYRhpob37eGDMbF3pU5G4FSkNKnqZvW1/9POYZoYBcKlRQxtekSjqiGzYeL7s4sc/WE
 VR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KPw4BWkTUh66N/l+oHgRw2epWlItk5ePmLSBKI5Tyjc=;
 b=VziS8J/onfolmT+02JjiPA5CnCQz5E4DiE47XQBHFcT5L6NuYnkqjJ7NBfVfT6yC2K
 96S2KVBPzAWvWw7qD6LB5k8nePqLb2714jg0pAhPiEyR1be+Njxu3zhqy+WPpZd+9fiz
 Z28sIn0iViXFBSjben8LLxC1b/xhyiABcE1cwRmaOc9XCDK54Ew3MXNN8mks4zE9Luty
 6SsCiIGOsjY6OidNIsfxg1jUNvIObUvOGOHfc1vA1YfrTvguw0p0OYWq9TXIv4ZMx29d
 pGC4rfKg08fACwGpi1hgMxU7pvBRdruwheGDzTWDAAOEXAO77ZygEJzAisOAb3gMhMd8
 0JvQ==
X-Gm-Message-State: APjAAAWCpVkqP5NniyFwLIA4n92jSM3E9NE4cTUUZQI6NTCFOEew4LMw
 UdDJcmJ72NoSiQeuRdA0tSTAqDLx2EvHxQiJ39U=
X-Google-Smtp-Source: APXvYqy2WV0o0WTeidYaegKNg5xN9HKD7exGZ7ITgPnsyD2ep/rt00HnH9Ugu3XPBwH9a3J2kYJwc5f02NtnzlPD5SU=
X-Received: by 2002:a1f:3fcd:: with SMTP id m196mr2975528vka.28.1576064841951; 
 Wed, 11 Dec 2019 03:47:21 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo50Hgbb8ywX2RgFqkitxwBG64EhP9g1TSxgLkQf-6L6soA@mail.gmail.com>
 <CAFPSGXZMmfeBxkNhuNR59bX26_69_y5C13P7qY-UawVDa7Q3Jw@mail.gmail.com>
In-Reply-To: <CAFPSGXZMmfeBxkNhuNR59bX26_69_y5C13P7qY-UawVDa7Q3Jw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 11 Dec 2019 11:46:06 +0000
Message-ID: <CACvgo50wCKq76Wj0xjJcuWxz5gvaOSbj1Hz8-Vi6eOSGH106yg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/8] drm/sprd: add Unisoc's drm display controller
 driver
To: tang pengchuan <kevin3.tang@gmail.com>
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
Cc: Baolin Wang <baolin.wang@linaro.org>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMSBEZWMgMjAxOSBhdCAwOToxOCwgdGFuZyBwZW5nY2h1YW4gPGtldmluMy50YW5n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaQo+Cj4gRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IOS6jjIwMTnlubQxMuaciDEx5pel5ZGo5LiJIOS4iuWNiDE6MTTlhpnpgZPv
vJoKPj4KPj4gSGkgS2V2aW4sCj4+Cj4+IE9uIFR1ZSwgMTAgRGVjIDIwMTkgYXQgMDg6NDEsIEtl
dmluIFRhbmcgPGtldmluMy50YW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBGcm9tOiBL
ZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNvYy5jb20+Cj4+ID4KPj4gPiBBZGRzIERQVShEaXNw
bGF5IFByb2Nlc3NvciBVbml0KSBzdXBwb3J0IGZvciB0aGUgVW5pc29jJ3MgZGlzcGxheSBzdWJz
eXN0ZW0uCj4+ID4gSXQncyBzdXBwb3J0IG11bHRpIHBsYW5lcywgc2NhbGVyLCByb3RhdGlvbiwg
UFEoUGljdHVyZSBRdWFsaXR5KSBhbmQgbW9yZS4KPj4gPgo+PiA+IENjOiBPcnNvbiBaaGFpIDxv
cnNvbnpoYWlAZ21haWwuY29tPgo+PiA+IENjOiBCYW9saW4gV2FuZyA8YmFvbGluLndhbmdAbGlu
YXJvLm9yZz4KPj4gPiBDYzogQ2h1bnlhbiBaaGFuZyA8emhhbmcubHlyYUBnbWFpbC5jb20+Cj4+
ID4gU2lnbmVkLW9mZi1ieTogS2V2aW4gVGFuZyA8a2V2aW4udGFuZ0B1bmlzb2MuY29tPgo+PiA+
IC0tLQo+PiA+ICBkcml2ZXJzL2dwdS9kcm0vc3ByZC9NYWtlZmlsZSAgICAgICB8ICAgIDYgKy0K
Pj4gPiAgZHJpdmVycy9ncHUvZHJtL3NwcmQvZGlzcF9saWIuYyAgICAgfCAgMjkwICsrKysrKysK
Pj4gPiAgZHJpdmVycy9ncHUvZHJtL3NwcmQvZGlzcF9saWIuaCAgICAgfCAgIDQwICsKPj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3NwcmQvZHB1L01ha2VmaWxlICAgfCAgICA4ICsKPj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3NwcmQvZHB1L2RwdV9yMnAwLmMgfCAxNDY0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4+ID4gIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHB1LmMgICAg
IHwgMTE1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gPiAgZHJpdmVycy9ncHUvZHJt
L3NwcmQvc3ByZF9kcHUuaCAgICAgfCAgMjE3ICsrKysrKwo+PiA+ICA3IGZpbGVzIGNoYW5nZWQs
IDMxNzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBBcyB3ZSBjYW4gc2VlIGZy
b20gdGhlIGRpZmYgc3RhdCB0aGlzIHBhdGNoIGlzIGh1Z2UuIFNvIGl0IHdvdWxkIGJlIGZhaXJs
eSBoYXJkCj4+IHRvIHByb3ZpZGUgbWVhbmluZ2Z1bCByZXZpZXcgYXMtaXMuCj4+Cj4+IE9uZSBj
YW4gY29tYmluZSBteSBlYXJsaWVyIHN1Z2dlc3Rpb24gKHRvIGtlZXAgbW9kZXNldC9hdG9taWMg
b3V0IG9mIDIvOCksIHdpdGgKPj4gdGhlIGZvbGxvd2luZyBzcGxpdDoKPj4gIC0gNC84IGFkZCBi
YXNpYyBhdG9taWMgbW9kZXNldCBzdXBwb3J0IC0gb25lIGZvcm1hdCwgb25lIHJvdGF0aW9uIDAs
IG5vIGV4dHJhCj4+ICBhdHRyaWJ1dGVzCj4+ICAtIDUvOCBhZGQgZXh0cmEgZm9ybWF0cwo+PiAg
LSA2LzggYWRkIGV4dHJhIHJvdGF0aW9uIHN1cHBvcnQKPj4gIC0gLi4uIGFkZCBjdXN0b20gYXR0
cmlidXRlcwo+Cj4gT2ssIGkgd2lsbCBzcGxpdCB0aGlzIHBhdGNoLCB1cHN0cmVhbSBtb2Rlc2V0
IGFuZCBhdG9taWMgYXQgZmlyc3QuIGNsb2NrLCBnbG9hYmwsIGVuaGFuY2UsIGV4dHJhCj4gYXR0
cmlidXRlcyAgYW5kIHNvIG9uIHdpbGwgYmUgdXBsb2FkIGxhdGVyLgoKQW1hemluZyB0aGFuayB5
b3UuIFBsZWFzZSBhcHBseSB0aGUgc2ltaWxhciBsb2dpYyBhbmQgc3BsaXQgcGF0Y2ggNi84Ci0g
dGhhdCBwYXRjaCBpcyB0d2ljZSBsYXJnZXIgdGhhbiB0aGlzIG9uZS4KClNvbWUgc21hbGwgZ2Vu
ZXJhbCByZXF1ZXN0cyAtIHBsZWFzZSB1c2UgcGxhaW4gdGV4dCBlbWFpbHMgKHNlZSBbMV0pCmFu
ZCB0cmltIHVucmVsYXRlZCBmcmFnbWVudHMgd2hlbiByZXBseWluZy4KT3RoZXJ3aXNlIGl0IGlz
IHZlcnkgZWFzeSB0byBtaXNzIHRoZSBjb21tZW50IHRoYXQgeW91IGFuZCBvdGhlcnMgaGF2ZSBt
YWRlLgoKSFRICkVtaWwKClsxXSBodHRwczovL3d3dy5saWZld2lyZS5jb20vaG93LXRvLXNlbmQt
YS1tZXNzYWdlLWluLXBsYWluLXRleHQtZnJvbS1nbWFpbC0xMTcxOTYzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
