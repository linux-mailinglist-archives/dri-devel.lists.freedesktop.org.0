Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA7159CA0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9096E91E;
	Fri, 28 Jun 2019 13:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8920D6E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:10:42 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w17so6130984qto.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 06:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2c7eqcB3k0o55ijnQbOy72m754FPugjxJ+siH2Ukek=;
 b=B9G87TREHSVdoGNpDEeUXuhQvkgmT0eWueGiditTNdGYgeCkbPISqkP4X2hHIwxHgI
 MEH/wYERL7ogpJRIYWlr1aPklHnogXvgpstFOfEYNp3WYZaf4sLDqcaa7hCxF3JNEJoc
 r20p5D2briQF4XaEcubuldBzo7XSFdXIxaoyQiDRdYfPWir3Zkc04afvbK6QYQnXHpnX
 H6KEPrpwZA0yYz8vqo+h/WAhUJHA+SPT5kOTw2vihOHBAneFKcBvTu541z6Rw3g4Antb
 hzm6eMpwvLmAdPPApwj9k0lrypnHLdK/PfrbyAPuUQdp9uwNj72KhxqXAM5XS5RMnJR+
 ky/w==
X-Gm-Message-State: APjAAAXs5afnzRtNtpcaL4kEoBozajR7QKV0vr0/c4zultiKWLH/yCEY
 mTJ8NkzPaXnkTpz4OiY6LFamtvYJnAmMe2dEwrE=
X-Google-Smtp-Source: APXvYqz/s4dkECw2z/P+uA1hvyLBd3yUyH88Udt175wZ/fRy6rW3brojQZS2t73cDQNFyMgCM5vYR0cjyt88WHuexRA=
X-Received: by 2002:a0c:ba2c:: with SMTP id w44mr8171926qvf.62.1561727441607; 
 Fri, 28 Jun 2019 06:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190628103359.2516007-1-arnd@arndb.de>
 <20190628124832.cedpoabfiqgjhtkq@shell.armlinux.org.uk>
In-Reply-To: <20190628124832.cedpoabfiqgjhtkq@shell.armlinux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 28 Jun 2019 15:10:25 +0200
Message-ID: <CAK8P3a3=tf987CdTHWFxfXd2BAXwbwfmHDsLK3VjaKPpPP7zQA@mail.gmail.com>
Subject: Re: [PATCH] drm/armada: fix debugfs link error
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMjo0OCBQTSBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgg
YWRtaW4KPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyOCwg
MjAxOSBhdCAxMjozMzo0MFBNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gRGVidWdm
cyBjYW4gYmUgZGlzYWJsZWQgYXQgY29tcGlsZSB0aW1lLCBjYXVzaW5nIGEgbGluayBlcnJvcgo+
ID4gd2l0aCB0aGUgbmV3bHkgcmVzdHJ1Y3R1cmVkIGNvZGU6Cj4gPgo+ID4gZHJpdmVycy9ncHUv
ZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5vOiBJbiBmdW5jdGlvbiBgYXJtYWRhX2RybV9jcnRjX2xh
dGVfcmVnaXN0ZXInOgo+ID4gYXJtYWRhX2NydGMuYzooLnRleHQrMHg5NzQpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBhcm1hZGFfZHJtX2NydGNfZGVidWdmc19pbml0Jwo+ID4KPiA+IE1ha2Ug
dGhlIGNvZGUgaW50byB0aGUgZGVidWdmcyBpbml0IGZ1bmN0aW9uIGNvbmRpdGlvbmFsLgo+Cj4g
VGhhbmtzIEFybmQsIG1pbmQgaWYgSSByb2xsIHRoaXMgaW50byB0aGUgb3JpZ2luYWwgY29tbWl0
PwoKVGhhdCB3b3VsZCBiZSBiZXN0LCBwbGVhc2UgZG8gc28uCgogICAgICBBcm5kCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
