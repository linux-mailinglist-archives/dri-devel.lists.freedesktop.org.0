Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B19125B3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 02:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCCE89363;
	Fri,  3 May 2019 00:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC6989363
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 00:44:17 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id d62so3141951oib.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 17:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2hincFuCgvv5JHuCTV0zjcSgRetC4sQsA2RxJqwbHE=;
 b=t2D0fX7uDzHbG98Twc+nEFR2qbgfLjA5YOxNLN4xBCueEEvf0pJ5Q7lo1ojtLusr6u
 Io7eH+INrSfkZZGK4AjiHoBdTzIhG8nAwgjP7VTOgrgjdOx6iSbLZKfsvAR6ueVZ1/pS
 mazjHTCYu0X/u8EyvD/X7qW3YFADUS0OUBmCIoXqjj27n/t9rw1dmzj+lgnDZfvfr6qS
 nx/qXA8ZDuhX0JQVWjT/HQ8yKzpKXqTmQLFye3385ZbghlyOmFLwB9bdIyyHRmAU+See
 3TXh/bO1XeU0ERn592OlfPDI+/qn+TkkMVCeIKrfHaeM/t6w2JeMy0nchSCAJV9t1mCf
 QAnQ==
X-Gm-Message-State: APjAAAWioMlk+vh2TQ2auT3+bC68E7mAH+jkZFp2QXsX51dl15MKxr2+
 Uxj9HMbAPWqu1lf1LYK2jR5Pdp23pIF8403NMcz69Q==
X-Google-Smtp-Source: APXvYqyH7XhI3a/DkRyh575w1BCN/DsRH5SQN4U4GjnrWhviWpfRz21kNlgkWO7kwhjd2fwRpqP4aZoATeVVAm4A6kc=
X-Received: by 2002:aca:4586:: with SMTP id s128mr4131634oia.148.1556844256812; 
 Thu, 02 May 2019 17:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com>
 <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
In-Reply-To: <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 17:44:05 -0700
Message-ID: <CAFd5g47JiSXHvMEu9NovkGdG7ugMCwVO0pGwT7bC=NCghD0w-g@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A2hincFuCgvv5JHuCTV0zjcSgRetC4sQsA2RxJqwbHE=;
 b=OmqtnHqhiWeR9Oui8paJzv152rY6QABSkuQBz4HTi+7RcYfpqAMASWqQsmYpDFgDN6
 8u4QGxIX+281+PUfSj8hi/U7tm8NJ9VAxVw6f/1fIubO5IRk2JSVgWheDKh9YqA4Wsbf
 24sX8hJEdjs5npjlV/LbLiqkJxkPc5vfXFxPFLtHmaYVvwOT1Kl25XRCnzlFSWh2Q25H
 cUcrTa1e6pmnoMfZEaTHDQhpE68nGq58M6J2ln/kAXPBqhupBP9xcAgry1zyiFWDMuo5
 NRZs5NySNRdFsKgdLNe5bdoZ8f/LlUzn/ZIEd8r9DQV7aKNkXapSSaI0cJxyrsljswdm
 UMNw==
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA3OjA0IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDUvMi8xOSA0OjUwIEFNLCBHcmVnIEtIIHdyb3RlOgo+ID4gT24gV2VkLCBN
YXkgMDEsIDIwMTkgYXQgMDQ6MDE6MDlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
ID4+ICMjIFRMRFIKPiA+Pgo+ID4+IEkgcmViYXNlZCB0aGUgbGFzdCBwYXRjaHNldCBvbiA1LjEt
cmM3IGluIGhvcGVzIHRoYXQgd2UgY2FuIGdldCB0aGlzIGluCj4gPj4gNS4yLgo+ID4KPiA+IFRo
YXQgbWlnaHQgYmUgcnVzaGluZyBpdCwgbm9ybWFsbHkgdHJlZXMgYXJlIGFscmVhZHkgY2xvc2Vk
IG5vdyBmb3IKPiA+IDUuMi1yYzEgaWYgNS4xLWZpbmFsIGNvbWVzIG91dCB0aGlzIFN1bmRheS4K
PiA+Cj4gPj4gU2h1YWgsIEkgdGhpbmsgeW91LCBHcmVnIEtILCBhbmQgbXlzZWxmIHRhbGtlZCBv
ZmYgdGhyZWFkLCBhbmQgd2UgYWdyZWVkCj4gPj4gd2Ugd291bGQgbWVyZ2UgdGhyb3VnaCB5b3Vy
IHRyZWUgd2hlbiB0aGUgdGltZSBjYW1lPyBBbSBJIHJlbWVtYmVyaW5nCj4gPj4gY29ycmVjdGx5
Pwo+ID4KPiA+IE5vIG9iamVjdGlvbiBmcm9tIG1lLgo+ID4KPgo+IFllcy4gSSBjYW4gdGFrZSB0
aGVzZSB0aHJvdWdoIGtzZWxmdGVzdCB0cmVlIHdoZW4gdGhlIHRpbWUgY29tZXMuCgpBd2Vzb21l
LgoKPiBBZ3JlZSB3aXRoIEdyZWcgdGhhdCA1LjIgbWlnaHQgYmUgcnVzaGluZyBpdC4gNS4zIHdv
dWxkIGJlIGEgZ29vZAo+IHRhcmdldC4KCldob29wcy4gSSBndWVzcyBJIHNob3VsZCBoYXZlIHNl
bnQgdGhpcyBvdXQgYSBiaXQgZWFybGllci4gT2ggd2VsbCwgYXMKbG9uZyBhcyB3ZSBhcmUgb24g
b3VyIHdheSEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
