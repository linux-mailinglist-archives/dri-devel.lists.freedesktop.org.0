Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360D12363
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1BC8989E;
	Thu,  2 May 2019 20:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAD58989E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:30:24 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n15so3372913ota.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDdiyphkogtVcXTbSVRyR+FjzQZde+G185126UMJh7I=;
 b=KZKdSfRwn2WYxP2bBclQEcfawWMwlFTBTb5J8Boywnr836Uwk6AK7+Fr0d24S88zuc
 Sw5NynSX5qjcJPxnnd19sbndrA3quvRyqi80BdKhUYw/umlVLQwPSIlS7bj12Dnqdds8
 8pV9yhfgnCOH7EMZ3wv2k2E8JB9GZ9/ZkDKhxIPuCKaIBs90av5DEe6KxrpH6sWEm5To
 iTDIzpWo+pQggT6vQyoS5lDezunyRvxfqeoiXK8RweI/SeY1RLF/LvVx79jGaVNz1e3Z
 XT1CLhOeCaHUkpyRXuSYcibhnabgLCev31LmYNjynu71kpHlyiqHPmNN3VXglJaGYyDu
 FRiA==
X-Gm-Message-State: APjAAAWFH10Kq4jXKozaf/qpMmNtJWUDMe4CVbAA0EA305REWnGYz78j
 jPxhjcbz0OppmRIm436tB9K9Wzd+DzikakJ4FSrqbQ==
X-Google-Smtp-Source: APXvYqz43GD9Ydk/3iHIuvGx3dSX5DTZZLzaJSUOTfbGyq2mCG6ID5DjuBQ5u6fo5kf0q+kWNBtbkFi3ckrHB0dUqUs=
X-Received: by 2002:a9d:7f19:: with SMTP id j25mr3854222otq.25.1556829023216; 
 Thu, 02 May 2019 13:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-8-brendanhiggins@google.com>
 <20190502105849.GB12416@kroah.com>
In-Reply-To: <20190502105849.GB12416@kroah.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 13:30:12 -0700
Message-ID: <CAFd5g44os8xEMMiROkmX_KM4-9yL=+y6kw4-JApxhdzJV5pwkg@mail.gmail.com>
Subject: Re: [PATCH v2 07/17] kunit: test: add initial tests
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EDdiyphkogtVcXTbSVRyR+FjzQZde+G185126UMJh7I=;
 b=gITVrJC9deQ8wHwXinOhDV5dI98+XHC/WuqFuL8GH7a8CRP7Weez43rOFpDLFNlC0p
 SurYDhddnsqnL5Ihvys33lK/4j+PLxs8IphZcAQuHXXE7X5COStC3ZBhj/5h/Hdg9FPW
 sQYG3mb/RBDu620PDIXl0abFAqievobMhbfvYW6GdeEoPEN8iXGYFBkxbfpJn8Y1y4f8
 F6SjQjXGRwZVR+lGXlZDhrUGxSdzCSH/YiD/bsD5q2GkFQLqoLWuw3S9nlwb/QcTf+/G
 D2dqk3uPHxSxGLiPz52WCid9DnN+TbYr8zJiLQQDEG4D0HgQVfXL2NqaKqq1E/1r4TBH
 gHpA==
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

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAzOjU4IEFNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDA0OjAxOjE2UE0g
LTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+IEFkZCBhIHRlc3QgZm9yIHN0cmluZyBz
dHJlYW0gYWxvbmcgd2l0aCBhIHNpbXBsZXIgZXhhbXBsZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+
ICBrdW5pdC9LY29uZmlnICAgICAgICAgICAgICB8IDEyICsrKysrKwo+ID4gIGt1bml0L01ha2Vm
aWxlICAgICAgICAgICAgIHwgIDQgKysKPiA+ICBrdW5pdC9leGFtcGxlLXRlc3QuYyAgICAgICB8
IDg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAga3VuaXQvc3Ry
aW5nLXN0cmVhbS10ZXN0LmMgfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTY1IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
a3VuaXQvZXhhbXBsZS10ZXN0LmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQvc3RyaW5n
LXN0cmVhbS10ZXN0LmMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEva3VuaXQvS2NvbmZpZyBiL2t1bml0
L0tjb25maWcKPiA+IGluZGV4IDY0NDgwMDkyYjJjMjQuLjVjYjUwMDM1NWM4NzMgMTAwNjQ0Cj4g
PiAtLS0gYS9rdW5pdC9LY29uZmlnCj4gPiArKysgYi9rdW5pdC9LY29uZmlnCj4gPiBAQCAtMTMs
NCArMTMsMTYgQEAgY29uZmlnIEtVTklUCj4gPiAgICAgICAgIHNwZWNpYWwgaGFyZHdhcmUuIEZv
ciBtb3JlIGluZm9ybWF0aW9uLCBwbGVhc2Ugc2VlCj4gPiAgICAgICAgIERvY3VtZW50YXRpb24v
a3VuaXQvCj4gPgo+ID4gK2NvbmZpZyBLVU5JVF9URVNUCj4gPiArICAgICBib29sICJLVW5pdCB0
ZXN0IGZvciBLVW5pdCIKPiA+ICsgICAgIGRlcGVuZHMgb24gS1VOSVQKPiA+ICsgICAgIGhlbHAK
PiA+ICsgICAgICAgRW5hYmxlcyBLVW5pdCB0ZXN0IHRvIHRlc3QgS1VuaXQuCj4gPiArCj4gPiAr
Y29uZmlnIEtVTklUX0VYQU1QTEVfVEVTVAo+ID4gKyAgICAgYm9vbCAiRXhhbXBsZSB0ZXN0IGZv
ciBLVW5pdCIKPiA+ICsgICAgIGRlcGVuZHMgb24gS1VOSVQKPiA+ICsgICAgIGhlbHAKPiA+ICsg
ICAgICAgRW5hYmxlcyBleGFtcGxlIEtVbml0IHRlc3QgdG8gZGVtbyBmZWF0dXJlcyBvZiBLVW5p
dC4KPgo+IENhbid0IHRoZXNlIHRlc3RzIGJlIG1vZHVsZT8KCkF0IHRoaXMgdGltZSwgbm8uIEtV
bml0IGRvZXNuJ3Qgc3VwcG9ydCBsb2FkaW5nIHRlc3RzIGFzIGtlcm5lbAptb2R1bGVzOyBpdCBp
cyBzb21ldGhpbmcgd2UgY291bGQgYWRkIGluIGluIHRoZSBmdXR1cmUsIGJ1dCBJIHdvdWxkCnJh
dGhlciBub3Qgb3BlbiB0aGF0IGNhbiBvZiB3b3JtcyByaWdodCBub3cuIFRoZXJlIGFyZSBzb21l
IG90aGVyCnRoaW5ncyBJIHdvdWxkIGxpa2UgdG8gZG8gdGhhdCB3b3VsZCBwcm9iYWJseSBiZSBl
YXNpZXIgdG8gZG8gYmVmb3JlCmFkZGluZyBzdXBwb3J0IGZvciB0ZXN0cyBhcyBsb2FkYWJsZSBt
b2R1bGVzLgoKPgo+IE9yIGFtIEkgbWlzLXJlYWRpbmcgdGhlIHByZXZpb3VzIGxvZ2ljPwo+Cj4g
QW55d2F5LCBqdXN0IGEgcXVlc3Rpb24sIG5vdGhpbmcgb2JqZWN0aW5nIHRvIHRoaXMgYXMtaXMg
Zm9yIG5vdy4KCkNvb2wKCkNoZWVycyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
