Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9F4F99F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 05:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0CC89CD4;
	Sun, 23 Jun 2019 03:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6789CD4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 03:18:22 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r185so390368iod.6
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 20:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wt3xjQ5RAsPCKjNF8xOm70W9OHsmPMqo06u/Arlk64Q=;
 b=ct3v4s8wfTwUn1Nk9VlfkgaGYdeALgmHBEQrZCedsvFm2690GUcODzNRuJAQuXTw6n
 vUqYZ25KX3HYDXIYSyfI4lGvtzYpUz9rFO1p9jf1nMd4cPyAcNg3611eAvGSZYKgykh7
 0GWcFh3VOe7/VSokXWMyQWj0qpnE87tEW+0h/TgsisDvyp6PLyWIIMQViTbQ3iYdAnkg
 CDxNSIznuGya0pr2yVOeJYdKbaAYdEDLcVf7Q7Z6D/xlNgPWmQSLT6NddmqHu5xyWTW+
 cZvnXPutuX44LdSrDXvp3s2ezlsErDbngoJyjg85fevsbDhHmWLTWmevJ7MVs6wcvEml
 zyng==
X-Gm-Message-State: APjAAAWXWRZrQM+dMnDXcqsHJfwt0qH5Oxd86YXPpWauOp3FvUG8k9Si
 wEGCs2g8MN0GlrHiXlt4QUlBxs91wFMwzzUzeww864/1lXYRJA==
X-Google-Smtp-Source: APXvYqyTHzwArTC4KiRT1IPX4CNm6uqu89+eIkg88AjtBGh1KAm8050QLwI3XoLcAOvV19Se5XCP89cuH9nV859/AYs=
X-Received: by 2002:a5e:8412:: with SMTP id h18mr10275235ioj.268.1561259901755; 
 Sat, 22 Jun 2019 20:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
 <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 23 Jun 2019 11:18:10 +0800
Message-ID: <CAKGbVbs2UB-nfwUAJxBhyuVg22a39Tx5BraUBvB5N7+PT=eQLA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wt3xjQ5RAsPCKjNF8xOm70W9OHsmPMqo06u/Arlk64Q=;
 b=m959arvkk90yZk7YXjrGbIxse8RaTIzcLbMNGr/tmwdgqes+XUcRnTxTeV4JncLNQc
 YN5pM/vS5Mx/cU8yHEBxNHgfJl7IDi3LManX8AuuD2qAqDOqHwr7dG3yc4ag/kL96LKs
 PAksfOvU1TdpSFiXwu/IVd/UOKig3L2tywLCPhsOfMaAeTwb/WYx/EqdQ6Dt4ofgaGKp
 KmsQhMHUoIQABvO55MiiLXGy4esT+UdNA+v807NyOJKreIhhn7nXv40wb7nEysIiOagQ
 EddjsN/v0nWnyommduqTlSYFceuo6C/o4GUrbCZ4qjQo77tqKi9QHMqds+85BQKabrv+
 rUcg==
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
Cc: nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MjcgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDEyOjIxIFBNIFJheW1v
bmQgU21pdGggPFJheW1vbmQuU21pdGhAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkIHRoZSBE
Uk1fRk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBtb2RpZmllciB0bwo+
ID4gZGVub3RlIHRoZSAxNngxNiBibG9jayB1LWludGVybGVhdmVkIGZvcm1hdCB1c2VkIGluIEFy
bSBVdGdhcmQgYW5kCj4gPiBNaWRnYXJkIEdQVXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUmF5
bW9uZCBTbWl0aCA8cmF5bW9uZC5zbWl0aEBhcm0uY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmggfCAxMCArKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9k
cm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gaW5kZXggM2Zl
ZWFhMy4uOGVkN2VjZiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJj
Yy5oCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gQEAgLTc0Myw2
ICs3NDMsMTYgQEAgZXh0ZXJuICJDIiB7Cj4gPiAgI2RlZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNI
ICAgICAoMVVMTCA8PCAxMSkKPiA+Cj4gPiAgLyoKPiA+ICsgKiBBcm0gMTZ4MTYgQmxvY2sgVS1J
bnRlcmxlYXZlZCBtb2RpZmllcgo+ID4gKyAqCj4gPiArICogVGhpcyBpcyB1c2VkIGJ5IEFybSBN
YWxpIFV0Z2FyZCBhbmQgTWlkZ2FyZCBHUFVzLiBJdCBkaXZpZGVzIHRoZSBpbWFnZQo+ID4gKyAq
IGludG8gMTZ4MTYgcGl4ZWwgYmxvY2tzLiBCbG9ja3MgYXJlIHN0b3JlZCBsaW5lYXJseSBpbiBv
cmRlciwgYnV0IHBpeGVscwo+ID4gKyAqIGluIHRoZSBibG9jayBhcmUgcmVvcmRlcmVkLgo+ID4g
KyAqLwo+ID4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJM
RUFWRUQgXAo+ID4gKyAgICAgICBmb3VyY2NfbW9kX2NvZGUoQVJNLCAoKDFVTEwgPDwgNTUpIHwg
MSkpCj4KVGhhbmtzIGZvciB0aGUgcGF0Y2guCgo+IFRoaXMgc2VlbXMgdG8gYmUgYW4gZXh0cmVt
ZWx5IHJhbmRvbSBwaWNrIGZvciBhIG5ldyBudW1iZXIuIFdoYXQncyB0aGUKPiB0aGlua2luZyBo
ZXJlPyBBc2lkZSBmcm9tICJkb2VzbnQgbWF0Y2ggYW55IG9mIHRoZSBhZmJjIGNvbWJvcyIgb2Zj
Lgo+IElmIHlvdSdyZSBhbHJlYWR5IHVwIHRvIGhhdmluZyB0aHJvd24gYXdheSA1NWJpdHMsIHRo
ZW4gaXQncyBub3QgZ29pbmcKPiB0byBsYXN0IGxvbmcgcmVhbGx5IDotKQo+Cj4gSSB0aGluayBh
IGdvb2QgaWRlYSB3b3VsZCBiZSB0byByZXNlcnZlIGEgYnVuY2ggb2YgdGhlIGhpZ2ggYml0cyBh
cwo+IHNvbWUgZm9ybSBvZiBpbmRleCAoYWZiYyB3b3VsZCBnZXQgaW5kZXggMCBmb3IgYmFja3dh
cmRzIGNvbXBhdCkuIEFuZAo+IHRoZW4gdGhlIGxvd2VyIGJpdHMgd291bGQgYmUgZm9yIGZyZWUg
dXNlIGZvciBhIGdpdmVuIGluZGV4L21vZGUuIEFuZAo+IHRoZSBmaXJzdCBtb2RlIGlzIHByb2Jh
Ymx5IGFuIGVudW1lcmF0aW9uLCB3aGVyZSBwb3NzaWJsZSBtb2RlcyBzaW1wbGUKPiBnZXQgZW51
bWVyYXRlZCB3aXRob3V0IGZ1cnRoZXIgZmxhZ3Mgb3IgYW55dGhpbmcuCj4KVGhpcyBpZGVhIGlz
IGxpa2UgbXkgcHJldmlvdXMgcGF0Y2g6Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTA4NTI2MTkvCgpsaW1hIGRyaXZlciBqdXN0IG5lZWQgYSB1bmlxdWUgbW9kaWZpZXIgdG8g
cmVwcmVzZW50IHRoaXMgZm9ybWF0LCBzbyB0aGlzIHBhdGNoCmlzIGVub3VnaCBmb3IgbGltYSBu
ZWVkcy4KCkJ1dCBJJ20gYWxzbyBhIGxpdHRsZSB3b3JyeSBhYm91dCB0aGUgZXhwYW5zaW9uIG9m
IG9ubHkgcmVzZXJ2ZSB0aGUgdG9wIGJpdAooNTUpIGZvciBjbGFzc2lmaWNhdGlvbiBmcm9tIHRo
ZSBBUk0gcG9pbnQgb2Ygdmlldy4gQSBmZXcgbW9yZSBiaXQgKGF0IGxlYXN0IDIKZm9yIGJlaW5n
IGFibGUgdG8gcmVwcmVzZW50IDQgY2xhc3Mgb2YgZm9ybWF0KSBhbmQgbW9yZSBjbGVhciBjbGFz
cy9mb3JtYXQKZmllbGRzIGRpdmlzaW9uIHdvdWxkIGJlIGJldHRlci4KClRoYW5rcywKUWlhbmcK
CgoKCj4KPiBBbHNvIG9mYyBuZWVkcyBhY2tzIGZyb20gbGltYS9wYW5mcm9zdCBwZW9wbGUgc2lu
Y2UgSSBhc3N1bWUgdGhleSdsbAo+IGJlIHVzaW5nIHRoaXMsIHRvby4KPgo+IFRoYW5rcywgRGFu
aWVsCj4KPiA+ICsKPiA+ICsvKgo+ID4gICAqIEFsbHdpbm5lciB0aWxlZCBtb2RpZmllcgo+ID4g
ICAqCj4gPiAgICogVGhpcyB0aWxpbmcgbW9kZSBpcyBpbXBsZW1lbnRlZCBieSB0aGUgVlBVIGZv
dW5kIG9uIGFsbCBBbGx3aW5uZXIgcGxhdGZvcm1zLAo+ID4gLS0KPiA+IDIuNy40Cj4gPgo+Cj4K
PiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
