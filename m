Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF6B14B6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 21:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798D89E15;
	Thu, 12 Sep 2019 19:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C580289E15
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 19:12:08 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w6so135347oie.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 12:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qE+MEdXk0MzsKVyAEvZmNjMPwL0It1emf2De2gCl8bo=;
 b=mBMd13Z0Fa7kfUDutwGy3PGFZ7DJo7FV5vhra0H+8KNLKM2f33m9kro5l49nd+KTFv
 uwuzJNiTpDAXBoHX9BfwIo+Re6Ja5TYYCm6bLzq+zarnk9jFMy3VVA84SqSOKfOBWrbg
 /LiQmxiPu+bD2jZXLvEQ+NN4H8KfWyIJ7TtvTCGcon66oxzuirpOohAAQEhzv4/c01C+
 J0UXHwteOt4VYvjKGZcNVDKfyjOwhFn/RBDMsLOZyjXLJsu9Bu02LG0DyY1pnF4oKug1
 69Uw3/wob8GwkMcqWE/u9y1fuMdSMtyWQBQ5+G0UgfoC7N9yYzRKcdLLjPBkbgoEVddJ
 8e5Q==
X-Gm-Message-State: APjAAAWocOZwcOeNyWtSaxKeDuRyNRskHKDU20Ts+fhVvZhOmPZ7oMx2
 T9lByRHHgcQgaJDPNya56H1na/7jaYw16GH/6f6iWg==
X-Google-Smtp-Source: APXvYqysWBPXJuB33MwueMlTUn/GwdZ36CutoaczDgcOd6WKPVpoa4NvctSyA+dT6/9v9uCVikaPBShHYA18hmyyCik=
X-Received: by 2002:a54:4596:: with SMTP id z22mr214324oib.128.1568315527817; 
 Thu, 12 Sep 2019 12:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <2944062.7iTOG62oOJ@solembum> <87a7b9l7nq.fsf@anholt.net>
In-Reply-To: <87a7b9l7nq.fsf@anholt.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 12 Sep 2019 21:11:56 +0200
Message-ID: <CAKMK7uGCuBTCgdrwbhCRJgR1O+e8gfhPjtpeC8ZE7Mvk1TLsoQ@mail.gmail.com>
Subject: Re: RFC: IOCTL to label BO in DRM Core
To: Eric Anholt <eric@anholt.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qE+MEdXk0MzsKVyAEvZmNjMPwL0It1emf2De2gCl8bo=;
 b=Ohf49rZaDPh1x53/iDHsYMVI7SbibPiooH5nmXo2ZEPPECckQ39XhbxX625Pltg5I4
 YS2ztqsgbtd8lX0fQ8+gBNzuIUzaMHTGwZgrm5N/lA9JOssr8umy0aV+Xf7/+mqzJ00K
 DEkZCajzvQnYO+A4xl6x5B0BunA1uJREgmV8w=
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
Cc: Rohan Garg <rohan.garg@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgNzo1NyBQTSBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQu
bmV0PiB3cm90ZToKPgo+IFJvaGFuIEdhcmcgPHJvaGFuLmdhcmdAY29sbGFib3JhLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBbIFVua25vd24gc2lnbmF0dXJlIHN0YXR1cyBdCj4gPiBIaQo+ID4gSSdtIGlu
dmVzdGlnYXRpbmcgYSB3YXkgdG8gbGFiZWwgQk8ncyBpbiBwYW5mcm9zdCwgc2ltaWxhciB0byBo
b3cgVkM0IGRvZXMgaXQKPiA+IGFuZCByZWFsaXNlZCB0aGF0IHRoaXMgY291bGQgYmUgc29tZXRo
aW5nIHRoYXQncyBtaWdodCBiZSB1c2VmdWwgdG8gYWxsCj4gPiBkcml2ZXJzLgo+ID4KPiA+IFdp
dGggdGhhdCBpbiBtaW5kLCB3b3VsZCBhbnlvbmUgYmUgb3Bwb3NlZCB0byBhZGQgYSBEUk1fSU9D
VExfQk9fU0VUX0xBQkVMIGluCj4gPiBEUk0gY29yZSB0aGF0IGNhbiBiZSB1dGlsaXNlZCBieSBh
bGwgZHJpdmVycyB0byBsYWJlbCBCTydzPwo+Cj4gSSB3b3VsZCBsb3ZlIHRvIHNlZSBzb21ldGhp
bmcgc2hhcmVkLiAgbXNtIGhhcyBhbiBvYmplY3QgbGFiZWxpbmcKPiBpbnRlcmZhY2UgYXMgd2Vs
bC4KPgo+IHZjNCdzIGhhZCBzb21lIG92ZXJlbmdpbmVlcmluZyBkdWUgdG8gd2FudGluZyB0byBr
ZWVwIGEgYnVja2V0ZWQtYnktbmFtZQo+IHVzYWdlIGxpc3Qgc28gd2UgY291bGQgZHVtcCB0aGF0
IHdoZW4gd2UgcmFuIG91dCBvZiBtZW1vcnkgb3IgZnJvbQo+IGRlYnVnZnMuICBJIHRoaW5rIHNv
bWV0aGluZyBtdWNoIHNpbXBsZXIgd291bGQgYmUgYmV0dGVyLgoKSSB0aGluayB0aGVyZSdzIGV2
ZW4gc29tZSBwYXRjaGVzIGZsb2F0aW5nIHRvIGxpZnQgdGhpcyB0byB0aGUgZG1hLWJ1ZgpsZXZl
bCAoYXQgbGVhc3QgZm9yIG91dHB1dCBpbmQgZGVidWdmcyksIGJ1dCB3ZSdkIHN0aWxsIG5lZWQg
YSBnZW5lcmljCnRoaW5nIGF0IHRoZSBkcm1fZ2VtX2JvIGxldmVsLiBJZiB3ZSBjYW4gc3Vic3Vt
ZSBhdCBsZWFzdCBzb21lIG9mIHRoZQpleGlzdGluZyBpb2N0bHMgKHdpdGggYSB0aGluIHdyYXBw
ZXIpIHRvIHRoaXMgbmV3IHRoaW5nIEknbSBhbGwgZm9yCml0LgotRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2
NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
