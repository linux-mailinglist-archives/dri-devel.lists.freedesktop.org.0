Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4570C19B9C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 12:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545DD89B42;
	Fri, 10 May 2019 10:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3898A89B42
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 10:27:45 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 203so4124624oid.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0uHZ1jppAcFBhTR/1pJQr4fDRVmFHkByLDGRo+AFRuU=;
 b=aVzb0gXcWpYf79YjwrzRQ6WcYVGrh9muWm6edvPBfFlb1YVyXQ55Xju0d23ChJxFia
 ziEnwqqm3h1heGm6/rcbNzXV6C+9Vp6oup1apM31ip9omc3OcJ9y4FzdxTs14IG4Elxe
 49dPcfALtFBQPf9NFEytW56DQuDFoloS2V0FXvQMGfr+ttZoI3911iA9l3l+lISnrXwW
 utPOLU16x1qT8Hv07ckyo2s/m2c36yDU6kv9KUwYcoo8TQz6Ms/laf58AMM9OaXYWppz
 j5I38HUU909qy9onuLdcVpUCCjvpp6dRN8S5Q/4gRPBwUJeizrHpR0l9rhWuas7xWhC8
 dUcQ==
X-Gm-Message-State: APjAAAWIDDuTY1QMBLlOFVeip82d9m7pW/94Kev6Spb7jAKnkjF+ILqk
 oHEN4DcsJ7mAOODLVQDnbu0vmXJC7GK9ZVC9DNjLYQ==
X-Google-Smtp-Source: APXvYqzItdyzdcRLdkdQjbdb1r5m6MPSdjbNOyMVXP3tR2XNB/TjHeBcC5zqpfKlvhj2ObI953CDQuJHYFWf+OOgkMY=
X-Received: by 2002:aca:43d5:: with SMTP id q204mr4737682oia.100.1557484064075; 
 Fri, 10 May 2019 03:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-7-brendanhiggins@google.com>
 <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
In-Reply-To: <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 10 May 2019 03:27:33 -0700
Message-ID: <CAFd5g47BNZ0gRz4SXb37XjyXF_LyNZrSmoqDbzaaCUrTg3O7Yg@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] kbuild: enable building KUnit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0uHZ1jppAcFBhTR/1pJQr4fDRVmFHkByLDGRo+AFRuU=;
 b=dsrwv0H2Rfrc01YiHmjTjaNBThgH0Ls0D+S54kv0UogNbIoQQubjPK8qT7L0mF33CS
 aYviEu/LNE9drmcPOAdswXb57a7sipQirjIlQ7Ynd6iOEeUmTl+PCZ+GBOOHxMXwo9/H
 j4gtOzrnEtCf/6EINxveE8MFRW5uJt9rldnOcDpx4xbhTJdLV7YP/WUGh+m3XZLAcGc9
 VEH6sMdw5imAeTPV6OEInKN7s7agTjKI9bFZXH+y+qga4ATyjX3DaKij5ONVkcQdV95p
 PteDCGEucmeJdXRwmJxetOEP+cggWxt3r6pDiaF7DdvsmqnhTbIkbLBpggd06dK5/E3N
 9y4A==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "Cc: Shuah Khan" <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDg6MDMgQU0gQnJlbmRhbiBIaWdnaW5zCj4gPGJyZW5k
YW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCBLVW5pdCB0byByb290IEtj
b25maWcgYW5kIE1ha2VmaWxlIGFsbG93aW5nIGl0IHRvIGFjdHVhbGx5IGJlIGJ1aWx0Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xl
LmNvbT4KPgo+IFlvdSBuZWVkIHRvIG1ha2Ugc3VyZQo+IHRvIG5vdCBicmVhayBnaXQtYmlzZWN0
J2FiaWxpbHR5Lgo+Cj4KPiBXaXRoIHRoaXMgY29tbWl0LCBJIHNlZSBidWlsZCBlcnJvci4KPgo+
ICAgQ0MgICAgICBrdW5pdC90ZXN0Lm8KPiBrdW5pdC90ZXN0LmM6MTE6MTA6IGZhdGFsIGVycm9y
OiBvcy5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICNpbmNsdWRlIDxvcy5oPgo+ICAg
ICAgICAgICBefn5+fn4KPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IG1ha2VbMV06ICoqKiBb
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDsyNzk6IGt1bml0L3Rlc3Qub10gRXJyb3IgMQo+IG1ha2U6
ICoqKiBbTWFrZWZpbGU7MTc2Mzoga3VuaXQvXSBFcnJvciAyCgpOaWNlIGNhdGNoISBUaGF0IGhl
YWRlciBzaG91bGRuJ3QgZXZlbiBiZSBpbiB0aGVyZS4KClNvcnJ5IGFib3V0IHRoYXQuIEkgd2ls
bCBoYXZlIGl0IGZpeGVkIGluIHRoZSBuZXh0IHJldmlzaW9uLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
