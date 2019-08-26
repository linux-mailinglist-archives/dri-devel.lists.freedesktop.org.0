Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F09CC5E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 11:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7E76E21A;
	Mon, 26 Aug 2019 09:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9806E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 09:15:10 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id y8so11559644oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 02:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JEFfadbHp5n6rlwPWoFkwjHtgvrrz5/yV2RfW0HzHEk=;
 b=nzRjPq+PWmnEAEV8AtUQwMu/uAAvymqoTcbe0TTSeOgKdy6uCxTXhW/lW8D+J5ABdv
 ZWteR04VFAOcbMDG3etwdBa2pvEatVGuEN6seGNldEys1IVHjP0MZKyFvwJvQiuErtz1
 +7GZOarBGqQU1MFnHVLOlPdO6GlWCMRS87D2Fq3y8LXPuYuumP7Nvkq3zZCdccyrE+5/
 dcdresdPnG6Qw2JjCXwQ6eEVdPibOz91aAJPHpT4qeMyiD1uN25Zyjlz3uEziKPYGfUd
 Qw7gV/h62xklHXrvnDAzsCMuDsavEv+siLlm8HdGCG3nH5HICjEqgn26nlVJZihWwRo2
 zAyg==
X-Gm-Message-State: APjAAAU0ScLNTdtz0Xy4Rad3DY+4hqDMSphMGcmwrNdzIPWfSbmJtQev
 L1Zsyq5p+cleJKHngezUKD1WiWfDk0lXSvccli7OQg==
X-Google-Smtp-Source: APXvYqyQ7jbQee0b4yHRlHAjWV3qD+KuP9pZZp2rb1T1tZWJZ8fE0lE8QUpKxAogqK3kWBkbOzwVfUimXQz4rWq9eyE=
X-Received: by 2002:aca:6742:: with SMTP id b2mr6240211oiy.14.1566810910013;
 Mon, 26 Aug 2019 02:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <CADAXeK10uN6wM2NgSxyLwr9cjBLU5qpAKzr=Ctfhv-qXkzbd1Q@mail.gmail.com>
 <b0583c4d-7704-8cdc-12b9-8c617dc528e1@suse.de>
In-Reply-To: <b0583c4d-7704-8cdc-12b9-8c617dc528e1@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Aug 2019 11:14:58 +0200
Message-ID: <CAKMK7uEAzryZ9G2r6TgrVWbxAnaP_du-2NkgB=KNNFanNE5==Q@mail.gmail.com>
Subject: Re: XGI DRM driver as a practice?
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JEFfadbHp5n6rlwPWoFkwjHtgvrrz5/yV2RfW0HzHEk=;
 b=huSLM2Le0QJVfnfV5MbxOjjct8h06Sxjcwt1VE88Qh9uLl9CNrzRoyKjeHLS139ba0
 UxbJXzNNHnZ/0cBxYym69/Lyt3Gn12+YM+I44F127yEpmV11AO5xyaFoWGmRHfcg1Hmf
 bPzgUn/HPdjJTGlwce1xSFXw9rI6YF8WvSCpw=
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, jong_lin@xgitech.com,
 Ian Romanick <idr@freedesktop.org>, thomas@winischhofer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, Ivan D <ivdivd0@gmail.com>,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgOToxMSBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMjUuMDguMTkgdW0gMTM6MjUgc2No
cmllYiBJdmFuIEQ6Cj4gPiBJJ2QgbGlrZSB0byBsZWFybiBEUk0gc3Vic3lzdGVtIGFuZCBHUFUg
ZHJpdmVyIGRldmVsb3BtZW50IGFuZCBJIHdhcwo+ID4gdGhpbmtpbmcgYWJvdXQgYWJvdXQgd3Jp
dGluZyBYR0kgRFJNIGRyaXZlciBhcyBhIHByYWN0aWNlIHByb2plY3QKPiA+IHNpbmNlOgo+ID4g
LSB0aGVyZSdzIChvciB3YXMgdW50aWwgcmVjZW50bHkpIHN0YWdpbmcgZmJkZXYgZHJpdmVyIHRo
YXQgc2hvdWxkCj4gPiBob3BlZnVsbHkgYmUgd29ya2luZwo+ID4gLSBpdCdzIHN0aWxsIHBvc3Np
YmxlIHRvIGJ1eSB0aGluIGNsaWVudCBIVyB3aXRoIFhHSSBaMTEgcnVubmluZyBMaW51eAo+ID4K
PiA+IERvZXMgaXQgbWFrZSBzZW5zZSBhdCBhbGw/Cj4KPiBUaGF0IG1ha2VzIHMgbG90IG9mIHNl
bnNlLiBIb3dldmVyIHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IGxpbmVzIG9mIFhHSQo+IGhhcmR3
YXJlOiBvbmUgaXMgU2lTLWJhc2VkIGFuZCB0aGUgb3RoZXIgaXMgVHJpZGVudC1iYXNlZC4gVGhv
c2UgYXJlCj4gaW5jb21wYXRpYmxlIEFGQUlLLiBUaGUgWjExIGlzIGJhc2VkIG9uIHRoZSBTaVMg
ZGVzaWduLiBbMV0gQW55dGhpbmcKPiB0aGF0IGlzIFRyaWRlbnQtYmFzZWQgd291bGQgcmVxdWly
ZSBhIGRpZmZlcmVudCBkcml2ZXIuCj4KPgo+ID4gSSBkbyBoYXZlIGtlcm5lbCBleHBlcmllbmNl
IGJ1dCBrbm93IHZlcnkKPiA+IGxpdHRsZSBhYm91dCBEUk0gYW5kIGdyYXBoaWNzLiBPbmUgaXNz
dWUgaXMgYWJzZW5jZSBvZiBkb2N1bWVudGF0aW9uLAo+ID4gYnV0IHRoZXJlIGNvdWxkIGJlIGFz
IHdlbGwgb3RoZXJzIEknbSBub3QgZXZlbiBhd2FyZSBvZi4KPgo+IEZvciBkb2N1bWVudGF0aW9u
IG9uIFZHQSBncmFwaGljcyB5b3UgY2FuIHJlYWQgWzJdIGFuZCBbM10uIFRoZXJlJ3MKPiBrZXJu
ZWwgZG9jdW1lbnRhdGlvbiBhdCBbNF0sIGFsdGhvdWdoIGl0IGxhY2tzIGdvb2QgdHV0b3JpYWxz
IG9uIHRoZQo+IGludGVyZmFjZXMgYW5kIHRoZSBvdmVyYWxsIGRlc2lnbi4KPgo+IFRoZSBiZXN0
IHdheSBmb3IgbGVhcm5pbmcgYWJvdXQgRFJNIGlzIHRvIHJlYWQgYW4gZXhpc3RpbmcgZHJpdmVy
LiBGb3IKPiBYR0ksIEknZCBzdGFydCB3aXRoIGJvY2hzLiBJdCdzIGZvciBxZW11LCBzbyB5b3Ug
YWxyZWFkeSBoYXZlIHRoZQo+ICJ0ZXN0aW5nIGhhcmR3YXJlIiBhcyBwYXJ0IG9mIHlvdXIgTGlu
dXggZGlzdHJpYnV0aW9uLiBCb2NocyB1c2VzCj4gZGVkaWNhdGVkIHZpZGVvIG1lbW9yeSBhbmQg
cHJvdmlkZXMgYXRvbWljIG1vZGUgc2V0dGluZy4gVGhhdCdzIGFsbCB5b3UKPiBzaG91bGQgbmVl
ZCBmb3IgYSBiYXNpYyBYR0kgZHJpdmVyLgoKSWYgdGhpcyBpcyBhIGdlbnVpbmUgVkdBIHJlZ2lz
dGVyIGJhc2VkIGRpc3BsYXkgYmxvY2ssIHRoZW4gdGhlcmUgaGFzCmJlZW4gYSBwYXRjaCBvbmNl
LCB5ZWFycyBiYWNrLCB0byBhZGQgdmdhIGhlbHBlcnMgdG8gZHJtLgpVbmZvcnR1bmF0ZWx5IHNv
bWUgZ29vZ2xpbmcgZGlkbid0IGZpbmQgaXQuIEFueXdheSB0aGV5IHdlcmUgc28gb2xkCnRoYXQg
dGhleSBkZWZpbml0ZWx5IHByZWRhdGVkIGF0b21pYywgc28gbW9zdCBsaWtlbHkgd2UnZCB3YW50
IHRvCnJld3JpdGUgdGhlbS4gQnV0IGlmIHRoaXMgaGFwcGVucyAoYW5kIHRoZXJlJ3Mgc29tZSBp
bnRlcmVzdGVkIGZvcgpvdGhlciBodyB3aXRoIHZnYSByZWdpc3RlciBzdXBwb3J0KSB0aGVuIEkg
dGhpbmsgYSBoZWxwZXIgdGhhdAppbXBsZW1lbnRzIHRoZSBhdG9taWMgY3J0YyZwbGFuZSAoZm9y
IHRoZSBwcmltYXJ5IHBsYW5lLCBJIHRoaW5rCmN1cnNvciB3YXMgYWx3YXlzIGFuIGFkZC1vbikg
aGVscGVyIGZ1bmNzIGluIHRlcm1zIG9mIFZHQSByZWdpc3Rlcgp3b3VsZCBiZSByZWFsbHkgbmVh
dC4gUGx1cyBzb21lIGdsdWUgdG8gc2V0IHRoYXQgdXAgZm9yIHlvdS4KCkNoZWVycywgRGFuaWVs
Cgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPgo+IFsxXSBodHRwczovL2VuLndpa2lwZWRp
YS5vcmcvd2lraS9YR0lfVGVjaG5vbG9neSNDYXJkcwo+IFsyXSBodHRwczovL3dpa2kub3NkZXYu
b3JnL1ZHQV9IYXJkd2FyZQo+IFszXSBodHRwOi8vd3d3Lm9zZGV2ZXIubmV0L0ZyZWVWR0EvaG9t
ZS5odG0KPiBbNF0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvZ3B1L2lu
ZGV4Lmh0bWwKPgo+ID4gSWYgdGhlcmUncyBhIGJldHRlciBhcHByb2FjaCB0aGFuIHRoaXMgcGxl
YXNlIGRyb3AgbWUgYSBsaW5lPgo+ID4gQWxzbyBwdXR0aW5nIHJlbGV2YW50IHBlb3BsZSBmcm9t
IGNvbW1pdCBsb2cgdG8gQ0MsIGhvcGUgaXQncyBvay4KPiA+Cj4gPiBUaGFua3MsCj4gPiBJdmFu
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKPiA+Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcgo+IFNVU0UgTGludXggR21iSCwgTWF4ZmVsZHN0cmFzc2UgNSwgOTA0MDkgTnVlcm5i
ZXJnLCBHZXJtYW55Cj4gR0Y6IEZlbGl4IEltZW5kw7ZyZmZlciwgTWFyeSBIaWdnaW5zLCBTcmkg
UmFzaWFoCj4gSFJCIDIxMjg0IChBRyBOw7xybmJlcmcpCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
