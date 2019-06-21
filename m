Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFA4E6B2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C2C6E866;
	Fri, 21 Jun 2019 11:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC09892AD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:05:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id s15so6405311qtk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 04:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWrjRbv5sT8Ycn8FrgxcuobL7x+daQ4VNzNCCGx2zM4=;
 b=OuFXHSmQYad1XkfehDsSvr3xRoqa/BasWLmnc49lT9N6uRXnVvI6gcElimfQvaq4T7
 /+JedeonhdtPwxLo6qBJwmN2l/ExJFmQhgbEj9SIJjYdv6Hzs0w8e8vRj1aG6c1k/VoX
 TiepB23xrlX4s/g8btI3da442kpkXhLkY1t2vxbYjGSlp7PNJtECF2/BchFUKGZiXWLo
 4E/4wzne1fcDEtmySAxXfp/IceXPtQtY6f+1E8ESccj0GShWnOkdpEv9tXz759y6jku+
 egPKur9LNjTQspt3C46DFBlmpxy2kGq99t+zyU4tC+J+IE/uLCoHM3M/jKYcQLOxy48i
 1jPA==
X-Gm-Message-State: APjAAAXHzrohbJOwyVg1BVhc8WnpPtlIDnaLZxNIwdBCbmU20Ju5ishJ
 ThFv1Y66FVqzIMPzvLPdEC5/7m7jmxkzQFB5zz0=
X-Google-Smtp-Source: APXvYqw5uqxdf+phL6riSVug0c30oEd9Ob3YA4KXECDUZ7l4rUQff3J+CqHtXgfdMec/Uqfgyj4gqSkdxcvTzscBjxU=
X-Received: by 2002:ac8:3485:: with SMTP id w5mr38463529qtb.142.1561115135877; 
 Fri, 21 Jun 2019 04:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190617131645epcas1p3340c80f9e83af93bcbb4c68128b1ea44@epcas1p3.samsung.com>
 <20190617131624.2382303-1-arnd@arndb.de>
 <1628618a-7cf6-506e-9d87-c0966a99fbea@samsung.com>
In-Reply-To: <1628618a-7cf6-506e-9d87-c0966a99fbea@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 21 Jun 2019 13:05:19 +0200
Message-ID: <CAK8P3a3qTCnJn7X1msg03Av71aZmmN8YB=WNs0JfzYoMH+uL-w@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: pvr2fb: fix link error for pvr2fb_pci_exit
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6NTggUE0gQmFydGxvbWllaiBab2xuaWVya2lld2lj
ego8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IE9uIDYvMTcvMTkgMzoxNiBQ
TSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IFdoZW4gdGhlIGRyaXZlciBpcyBidWlsdC1pbiBm
b3IgUENJLCB3ZSByZWZlcmVuY2UgdGhlIGV4aXQgZnVuY3Rpb24KPiA+IGFmdGVyIGRpc2NhcmRp
bmcgaXQ6Cj4gPgo+ID4gYHB2cjJmYl9wY2lfZXhpdCcgcmVmZXJlbmNlZCBpbiBzZWN0aW9uIGAu
cmVmLmRhdGEnIG9mIGRyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLm86IGRlZmluZWQgaW4gZGlz
Y2FyZGVkIHNlY3Rpb24gYC5leGl0LnRleHQnIG9mIGRyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZi
Lm8KPiA+Cj4gPiBKdXN0IHJlbW92ZSB0aGUgX19leGl0IGFubm90YXRpb24gYXMgdGhlIGVhc2ll
c3Qgd29ya2Fyb3VuZC4KPgo+IERvbid0IHdlIGFsc28gbmVlZCB0byBmaXggcHZyMmZiX2RjX2V4
aXQoKSBmb3IgQ09ORklHX1NIX0RSRUFNQ0FTVD15IGNhc2U/CgpJIHRoaW5rIHRoYXQncyBjb3Jy
ZWN0LCB5ZXMuIENhbiB5b3UgZml4IHRoYXQgdXAgd2hlbiBhcHBseWluZyB0aGUgcGF0Y2g/Cgog
ICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
