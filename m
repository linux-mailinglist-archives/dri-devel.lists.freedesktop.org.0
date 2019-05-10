Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28519BB4
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 12:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F848930E;
	Fri, 10 May 2019 10:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D88B8930E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 10:34:04 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id m204so4201157oib.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5i4JvNF6NE98fRMKxmZ6W6+U1GIOfAXdGdvVU9jpjk=;
 b=frOSRYDfYaQh35wRmMEyyBSO6YubVs6uOArPqsrSpfkgupouC4EoHcdGSc3FKZGLRR
 qcwnAJ8BZaMsbKoIm9onoWBz7lxYSxU6I8QX27Ktj6jGj4urBgQS64X0bFppCM4O5fxB
 PUKAXNmZbNcDnAVmhNcwgWbiN4SCDOue5KmzywQRdvfi8iQ27SWLgpdsqi8+0Q5+YkXg
 70kLQ301pYwvMg6J0KEFXvFW1kmgibwHEQisNPa/6fl0+zNKQQYzvf/S7qf//iftbzAY
 sKg1+UnM3xmwjkAvvjYqsYFoGnrjY/jSIMHh7zsXETMwb2Sj60irBD6fa0HWGNQsTe/5
 phhg==
X-Gm-Message-State: APjAAAWLqoZj1/reVgeEVF/FvWtHp4Myr+yf6Pvn7Nn4GoBYiPGTq1vV
 S0IW6ipEqX0BiksF44hkrXDLvE4ocuKC9CShQufjtw==
X-Google-Smtp-Source: APXvYqw3UEwomNcXxGCJaZ//T6xFRuS5gGaGa2izLjE212DrWEolETcTjMzpUq+WB1E+1p0WPdjF9j5Z9zciCUj1NAM=
X-Received: by 2002:aca:43d5:: with SMTP id q204mr4754067oia.100.1557484443394; 
 Fri, 10 May 2019 03:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-7-brendanhiggins@google.com>
 <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
 <CAFd5g47BNZ0gRz4SXb37XjyXF_LyNZrSmoqDbzaaCUrTg3O7Yg@mail.gmail.com>
 <CAK7LNAR3DW5UxtsTNtW6mtQic8cukJwJ18=KitC2HX+jO5eo4g@mail.gmail.com>
In-Reply-To: <CAK7LNAR3DW5UxtsTNtW6mtQic8cukJwJ18=KitC2HX+jO5eo4g@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 10 May 2019 03:33:52 -0700
Message-ID: <CAFd5g46dE78f3bx33Sv-CPNx9i8VV=v0Ezwytp8eiQU1MzWbbQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] kbuild: enable building KUnit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v5i4JvNF6NE98fRMKxmZ6W6+U1GIOfAXdGdvVU9jpjk=;
 b=nGd+cWkGzEXpGtZkuP9oYYd4GvoVDkXbYEKFNyvJGe431T1PPUpkS/xcdVyU93/oC+
 iOY/sgkoPSzzreHzKz9kgEHxhJHg1jJT8nh/GBB77UaWYZ2cmcii9Cf0IBR0PkuXrFU2
 X2zcaWr/4tLTgZ0RLrGMyhMI1p7cfpR2FessPvThJmqe71Qb5xQZDjgKunaL0C5W2w2E
 x4thQ7WxDuTbLul4U5kX4SSYFL36trckMOrHWRhsmbpzjo17LECFKM9VLEYLBlSkUN9W
 WbwCW0njc6inKI9wGkqJbW4iWV889QBYK+bjWkcnAcu6ZIOkfieUOoCuotJ9MJZnAWKM
 Rhpw==
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

PiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCA3OjI3IFBNIEJyZW5kYW4gSGlnZ2lucwo+IDxicmVu
ZGFuaGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiA+IE9uIFRodSwgTWF5IDIsIDIw
MTkgYXQgODowMyBBTSBCcmVuZGFuIEhpZ2dpbnMKPiA+ID4gPGJyZW5kYW5oaWdnaW5zQGdvb2ds
ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gQWRkIEtVbml0IHRvIHJvb3QgS2NvbmZpZyBh
bmQgTWFrZWZpbGUgYWxsb3dpbmcgaXQgdG8gYWN0dWFsbHkgYmUgYnVpbHQuCj4gPiA+ID4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2ds
ZS5jb20+Cj4gPiA+Cj4gPiA+IFlvdSBuZWVkIHRvIG1ha2Ugc3VyZQo+ID4gPiB0byBub3QgYnJl
YWsgZ2l0LWJpc2VjdCdhYmlsaWx0eS4KPiA+ID4KPiA+ID4KPiA+ID4gV2l0aCB0aGlzIGNvbW1p
dCwgSSBzZWUgYnVpbGQgZXJyb3IuCj4gPiA+Cj4gPiA+ICAgQ0MgICAgICBrdW5pdC90ZXN0Lm8K
PiA+ID4ga3VuaXQvdGVzdC5jOjExOjEwOiBmYXRhbCBlcnJvcjogb3MuaDogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQo+ID4gPiAgI2luY2x1ZGUgPG9zLmg+Cj4gPiA+ICAgICAgICAgICBefn5+
fn4KPiA+ID4gY29tcGlsYXRpb24gdGVybWluYXRlZC4KPiA+ID4gbWFrZVsxXTogKioqIFtzY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkOzI3OToga3VuaXQvdGVzdC5vXSBFcnJvciAxCj4gPiA+IG1ha2U6
ICoqKiBbTWFrZWZpbGU7MTc2Mzoga3VuaXQvXSBFcnJvciAyCj4gPgo+ID4gTmljZSBjYXRjaCEg
VGhhdCBoZWFkZXIgc2hvdWxkbid0IGV2ZW4gYmUgaW4gdGhlcmUuCj4gPgo+ID4gU29ycnkgYWJv
dXQgdGhhdC4gSSB3aWxsIGhhdmUgaXQgZml4ZWQgaW4gdGhlIG5leHQgcmV2aXNpb24uCj4KPgo+
IEJUVywgSSBhcHBsaWVkIHdob2xlIG9mIHRoaXMgc2VyaWVzCj4gdG8gbXkga2VybmVsLm9yZyBy
ZXBvc2l0b3J5Lgo+Cj4gMGRheSBib3Qgc3RhcnRlZCB0byByZXBvcnQgaXNzdWVzLgo+IEkgaG9w
ZSBzZXZlcmFsIHJlcG9ydHMgcmVhY2hlZCB5b3UsCj4gYW5kIHRoZXkgYXJlIHVzZWZ1bCB0byBm
aXggeW91ciBjb2RlLgoKWWVwLCBJIGhhdmUgcmVjZWl2ZWQgc2V2ZXJhbC4gVGhleSBhcmUgdmVy
eSBoZWxwZnVsLgoKSSBncmVhdGx5IGFwcHJlY2lhdGUgaXQuCgpUaGFua3MhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
