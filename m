Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D512346
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3098985A;
	Thu,  2 May 2019 20:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927138985A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:26:07 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g24so3356123otq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UjYVT5cAdmQKUfv9t8ccIVDdyBls+aL8RkatsPsXvcs=;
 b=ugoimbgX+EOx5QLkbj2wsg4NiHQdwoo8IeJAn5Z1cErKV4EwMCgLGQYyMYKsjByXuZ
 75TFdhXyZtSU73xtjNbMmR/KSRJtC9XYfFsLP33Jm+b2vhC3DQw40UM8x9mxnwef8FwF
 dNd1KCKQyltk1p0FqnBZcT0g6ejAFC906TF1uWZUmfUrmWT2nboPF6BZn0PbuYFJpF+k
 XfxDypMOYPiJVc0Q4dOiAV+8YTOq5WkwBqfb3jMmq/w/4I/0asltHOD9PW9c/lLFzITf
 X+uHP+NBd7Kc187salkGT1simDYdqLJP6ffoezMI63qlZG1f4Fz00qjNbzpmX2B6eyjI
 v3zQ==
X-Gm-Message-State: APjAAAWKO9xGGOMKiZ3y159Evnfc9OPzE0EnqWdH4lYOGWzWg+QxT/n+
 7LVtEhH7ABdzOCnoh6MNxsrmd+TmOUuV8ksPnomdIA==
X-Google-Smtp-Source: APXvYqxyYrm8zG8OMTTxqGADAYUvr/vXQpVESafN7Cz0pZWyjDkgKl1eFOtZxYdb1jr2uV1YoMkUpLh/i+1PnNqQJjM=
X-Received: by 2002:a05:6830:204a:: with SMTP id
 f10mr3731908otp.83.1556828766432; 
 Thu, 02 May 2019 13:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
 <20190502110008.GC12416@kroah.com>
In-Reply-To: <20190502110008.GC12416@kroah.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 13:25:54 -0700
Message-ID: <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like
 logger
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UjYVT5cAdmQKUfv9t8ccIVDdyBls+aL8RkatsPsXvcs=;
 b=S/NLBkmmg3Md+sTx08gED5HrktmpwZikr8idsPoedLBx4NGY0vsICG/2JByh1OPLMl
 SoIkyImRxqPDEOFyC2ZMo66T4y64AzxZJe60LUPIIZ+2whbKVnm1u/h2cZWzkh0Pg7xc
 EXNw4yJNZ9fhJbGVtdrs9Sah16nUmTboVs4KkvhykHpn/i4zj9XsNumXBLK6Ynb0YPNG
 +tpKFc1Qf+4khDJxrAPPVZg4LS8WUK6j1vznFw5a8jr0zVqX9peLg5vYA1eBwQqixHhg
 xvPSDH5tHp5fJ/MAFS5gSf8uCUub0+kg9vZwn+lDYmBqYVC0qg8nx8pyREf5ogAUd63R
 E26Q==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA0OjAwIEFNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDA0OjAxOjEzUE0g
LTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+IEEgbG90IG9mIHRoZSBleHBlY3RhdGlv
biBhbmQgYXNzZXJ0aW9uIGluZnJhc3RydWN0dXJlIHByaW50cyBvdXQgZmFpcmx5Cj4gPiBjb21w
bGljYXRlZCB0ZXN0IGZhaWx1cmUgbWVzc2FnZXMsIHNvIGFkZCBhIEMrKyBzdHlsZSBsb2cgbGli
cmFyeSBmb3IKPiA+IGZvciBsb2dnaW5nIHRlc3QgcmVzdWx0cy4KPgo+IElkZWFsbHkgd2Ugd291
bGQgYWx3YXlzIHVzZSBhIHN0YW5kYXJkIGxvZ2dpbmcgZm9ybWF0LCBsaWtlIHRoZQo+IGtzZWxm
dGVzdCB0ZXN0cyBhbGwgYXJlIGFpbWluZyB0byBkby4gIFRoYXQgd2F5IHRoZSBvdXRwdXQgY2Fu
IGJlIGVhc2lseQo+IHBhcnNlZCBieSB0b29scyB0byBzZWUgaWYgdGhlIHRlc3RzIHN1Y2NlZWQv
ZmFpbCBlYXNpbHkuCj4KPiBBbnkgY2hhbmNlIG9mIGhhdmluZyB0aGlzIGxvZ2dpbmcgZnJhbWV3
b3JrIGVuZm9yY2luZyB0aGF0IGZvcm1hdCBhcwo+IHdlbGw/CgpJIGFncmVlIHdpdGggeW91ciBj
b21tZW50IG9uIHRoZSBsYXRlciBwYXRjaCB0aGF0IHdlIHNob3VsZCBoYW5kbGUKdGhpcyBhdCB0
aGUgd3JhcHBlciBzY3JpcHQgbGF5ZXIgKEtVbml0IHRvb2wpLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
