Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F05121AA
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 20:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B55897C5;
	Thu,  2 May 2019 18:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC32897C5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:08:23 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id a10so2914183otl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 11:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79fGKeHlH9FAaVSR1O2RxcfKwTsSnTq5QCRHjsEaUQU=;
 b=OOvjsH1bF6whNx20tRi1+KabBtkeTLw+yPzXTAzjgZHc7mvfUkVkdgCKAGXUk9zsrV
 nVaM/iBH6NJBRfIbwP02fWeipr/70BdOfO4XMD77oGo3AvtCndvk0LiUdx/uGMd1LYR6
 NUz5QCc169nXy90CqZxtMA8u1CWIJCZfGnLjz9VJZBufmTk6/ZSFPOrXN3Sr9vK3GJZd
 t58X+HjGxzHzwXAKkIMlJbvGEzLhQaLszJ+i+h6zbmNgsaUdn02TdWzbJkFdxu3UZewp
 H5/VjUAEJ2Wl3d0U/UvZbn76Muk8c0JyVDMUjiOluTNi92cq6JKre+eNq8H2OnI8tOO4
 C8LA==
X-Gm-Message-State: APjAAAWBwlF6iEXfqKSTpgcsoUNvOQhB1OTG7qdN8WAuOrdbKI8gsuXO
 gz3L0oDkit74yk1+kEgVSAmTtisIewBo5Dl8QbcrQA==
X-Google-Smtp-Source: APXvYqw/nI7b+z83V0GIDl0oQazXtqsfs+CMRGbHgYqDLdBGzPB7zXqfHkbXMcNZ2dozl9lGwjO1NMDSJQAOJdRu1uE=
X-Received: by 2002:a9d:3621:: with SMTP id w30mr3409606otb.98.1556820502021; 
 Thu, 02 May 2019 11:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
In-Reply-To: <20190502110220.GD12416@kroah.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 11:07:57 -0700
Message-ID: <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=79fGKeHlH9FAaVSR1O2RxcfKwTsSnTq5QCRHjsEaUQU=;
 b=p6+GkF2pa0r8kIFWr3Ue5xSJ4hl91lXS3nyMKkOj5gQv9nBUeqd4BeLUxnZv1anIlK
 lg1rsW/DG5+gG35Q6B+ZLV3xvGi60oYqbQR6qqrpeA01srJDWSHy+u56ea2PsXrn8x+q
 dAZDe0q27TZ76u7UainpJzKpuJcdKWXXDrVVYsacHOUkrblZnv39zmUQ3mgKo/PyMxtj
 cBGYHB2uWwE8NxbLX7q9WWmg2lFe3RBeI4j2lZBmhh5c2j8csXxGrExgKmjwwY08DAy9
 PMxuPc1keMhPOI13z500WCy1D+qUSgNiYEXKQhnXWgZ+09G9ndEGtieagtsVwWkzEqOt
 uIWw==
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
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

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA0OjAyIEFNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDA0OjAxOjIxUE0g
LTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+IEZyb206IEZlbGl4IEd1byA8ZmVsaXhn
dW94aXVwaW5nQGdtYWlsLmNvbT4KPiA+Cj4gPiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBjcmVh
dGUgbWluaW1hbCBpc29sYXRlZCB0ZXN0IGJpbmFyaWVzOyBpbiB0aGUKPiA+IG1lYW50aW1lIHdl
IGFyZSB1c2luZyBVTUwgdG8gcHJvdmlkZSB0aGUgaW5mcmFzdHJ1Y3R1cmUgdG8gcnVuIHRlc3Rz
LCBzbwo+ID4gZGVmaW5lIGFuIGFic3RyYWN0IHdheSB0byBjb25maWd1cmUgYW5kIHJ1biB0ZXN0
cyB0aGF0IGFsbG93IHVzIHRvCj4gPiBjaGFuZ2UgdGhlIGNvbnRleHQgaW4gd2hpY2ggdGVzdHMg
YXJlIGJ1aWx0IHdpdGhvdXQgYWZmZWN0aW5nIHRoZSB1c2VyLgo+ID4gVGhpcyBhbHNvIG1ha2Vz
IHByZXR0eSBhbmQgZHluYW1pYyBlcnJvciByZXBvcnRpbmcsIGFuZCBhIGxvdCBvZiBvdGhlcgo+
ID4gbmljZSBmZWF0dXJlcyBlYXNpZXIuCj4gPgo+ID4ga3VuaXRfY29uZmlnLnB5Ogo+ID4gICAt
IHBhcnNlIC5jb25maWcgYW5kIEtjb25maWcgZmlsZXMuCj4gPgo+ID4ga3VuaXRfa2VybmVsLnB5
OiBwcm92aWRlcyBoZWxwZXIgZnVuY3Rpb25zIHRvOgo+ID4gICAtIGNvbmZpZ3VyZSB0aGUga2Vy
bmVsIHVzaW5nIGt1bml0Y29uZmlnLgo+ID4gICAtIGJ1aWxkIHRoZSBrZXJuZWwgd2l0aCB0aGUg
YXBwcm9wcmlhdGUgY29uZmlndXJhdGlvbi4KPiA+ICAgLSBwcm92aWRlIGZ1bmN0aW9uIHRvIGlu
dm9rZSB0aGUga2VybmVsIGFuZCBzdHJlYW0gdGhlIG91dHB1dCBiYWNrLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPgo+
IEFoLCBoZXJlJ3MgcHJvYmFibHkgbXkgYW5zd2VyIHRvIG15IHByZXZpb3VzIGxvZ2dpbmcgZm9y
bWF0IHF1ZXN0aW9uLAo+IHJpZ2h0PyAgV2hhdCdzIHRoZSBjaGFuY2UgdGhhdCB0aGVzZSB3cmFw
cGVycyBvdXRwdXQgc3R1ZmYgaW4gYSBzdGFuZGFyZAo+IGZvcm1hdCB0aGF0IHRlc3QtZnJhbWV3
b3JrLXRvb2xzIGNhbiBhbHJlYWR5IHBhcnNlPyAgOikKCkl0IHNob3VsZCBiZSBwcmV0dHkgZWFz
eSB0byBkby4gSSBoYWQgc29tZSBwYXRjaGVzIHRoYXQgcGFjayB1cCB0aGUKcmVzdWx0cyBpbnRv
IGEgc2VyaWFsaXplZCBmb3JtYXQgZm9yIGEgcHJlc3VibWl0IHNlcnZpY2U7IGl0IHNob3VsZCBi
ZQpwcmV0dHkgc3RyYWlnaHRmb3J3YXJkIHRvIHRha2UgdGhlIHNhbWUgbG9naWMgYW5kIGp1c3Qg
Y2hhbmdlIHRoZQpvdXRwdXQgZm9ybWF0LgoKQ2hlZXJzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
