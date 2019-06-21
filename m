Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F14EA7B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 16:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5C6E8CE;
	Fri, 21 Jun 2019 14:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E456E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 14:22:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x47so7032307qtk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 07:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PE8+ZmRqaDgbYz+jdvymCbhXbNAet42InIv22KkQoU=;
 b=BMgia58lhF6tecovjvZPLuOURGkIq8de8Drt1/7R3IFbpIsIst4wxkDYsS2CWB6rkm
 K5bSvEFImHJSs2Jss7o0mvWSJOUqfJx+TE0eZk1OfKGZdAU51nlQHrh0nkjLHYP++W+d
 S6+LYSo02AkiJ5eCbA8dn/epJI2cSMSbIetFn1YrNVeF94OU7JO0B+wGRlbD7yWtq4DL
 JnETZj/ZMcKKpKFKzijYqoaJqNT8KQt6LPkXL/nvtaJ2A4lB1P3Z1+8lqcZuUieEQWYj
 Hh0EPQSHgZTaBBQ7dT1NQGel5vwfdnWbDb5eJajuDrFAu3JETb6y71nTC2l18lFCtB0h
 TGqw==
X-Gm-Message-State: APjAAAUYmEYRJp5l8/TZJdG0kE0nN4DVtrdiGIMbvFEGr06WtW3PwVzW
 C6FKQOQi19rtuCj5KidhlzniPmFUKxkHInauFAo=
X-Google-Smtp-Source: APXvYqz3TBMq9Z1vELupCLHXwlkzS26b6LIblcvrrh3roMREnWTSham3Z/PLOuj2kZ81P3IeXjjYn+8wNsf1fKYBPRQ=
X-Received: by 2002:ac8:8dd:: with SMTP id y29mr51176855qth.304.1561126943626; 
 Fri, 21 Jun 2019 07:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190617124822epcas2p2c93d6cec3b60d08d85f228945d5c7623@epcas2p2.samsung.com>
 <20190617124758.1252449-1-arnd@arndb.de>
 <3ee91294-044d-9bcd-0c4c-3365c0c97604@samsung.com>
In-Reply-To: <3ee91294-044d-9bcd-0c4c-3365c0c97604@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 21 Jun 2019 16:22:07 +0200
Message-ID: <CAK8P3a3=5iMx4UEi6pX6AGGsZWHzyiMQRNnUHuA4peZbGQRQZw@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: pvr2fb: fix compile-testing as module
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ira Weiny <ira.weiny@intel.com>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMToxNSBQTSBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
CjxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4KPiBPbiA2LzE3LzE5IDI6NDcg
UE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBCdWlsZGluZyBhbiBhbGxtb2Rjb25maWcga2Vy
bmVsIG5vdyBwcm9kdWNlcyBhIGhhcm1sZXNzIHdhcm5pbmc6Cj4gPgo+ID4gZHJpdmVycy92aWRl
by9mYmRldi9wdnIyZmIuYzo3MjY6MTI6IGVycm9yOiB1bnVzZWQgZnVuY3Rpb24gJ3B2cjJfZ2V0
X3BhcmFtX3ZhbCcgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dCj4gPgo+ID4gU2h1dCB0aGlz
IHVwIHRoZSBzYW1lIHdheSBhcyB3ZSBkbyBmb3Igb3RoZXIgdW51c2VkIGZ1bmN0aW9ucwo+ID4g
aW4gdGhlIHNhbWUgZmlsZSwgdXNpbmcgdGhlIF9fbWF5YmVfdW51c2VkIGF0dHJpYnV0ZS4KPiA+
Cj4gPiBGaXhlczogMGY1YTU3MTJhZDFlICgidmlkZW86IGZiZGV2OiBwdnIyZmI6IGFkZCBDT01Q
SUxFX1RFU1Qgc3VwcG9ydCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPgo+Cj4gVGhhbmtzIGJ1dCBJJ3ZlIGZpeGVkIGl0IGFscmVhZHkgYnkgYWRkaW5n
ICNpZm5kZWYgTU9EVUxFIChzaW5jZSBvdGhlcgo+IGZ1bmN0aW9ucyBpbiB0aGUgc2FtZSBmaWxl
IHVzaW5nIF9fbWF5YmVfdW51c2VkIGRlcGVuZCBvbiBlaXRoZXIgUENJIG9yCj4gU0hfRFJFQU1D
QVNUIEkndmUgcHJlZmVycmVkIG5vdCB0byB1c2UgdGhpcyBhdHRyaWJ1dGUpOgo+Cj4gaHR0cHM6
Ly9tYXJjLmluZm8vP2w9bGludXgtZmJkZXYmbT0xNTYwNTA5MDQwMTA3Nzgmdz0yCgpPaywgZHJv
cHBpbmcgbXkgcGF0Y2ggZnJvbSB0aGUgbG9jYWwgcXVldWUsIHlvdXIgdmVyc2lvbiBpcyBvYnZp
b3VzbHkKY29ycmVjdCBhcyB3ZWxsLgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
