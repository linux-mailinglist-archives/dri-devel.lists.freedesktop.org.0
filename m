Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6A155C2
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 23:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016DE89C0D;
	Mon,  6 May 2019 21:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B081A89C0D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 21:43:05 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m204so5122529oib.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 14:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94ZZFjAz8L6vodxrYz5ZCQ36NJZDWbAB/OOZ4duFwS4=;
 b=PC2P321rRWJ+lhBzF381IoUR3t9BqysUJpq/E7znNb1s5HHVs/OOY7OGySkauzozXj
 /plQ0oEQtzzDQqoOpvrt7+edDVBeNqy9DLR40PRFnRXTs/8CUOlbK8TRlDOZJZAIaoU8
 St62fRfRR93SKoWW2HvG8xg9XxyLQPIKeV7OxbCfFQUH4ScQKYPV2g3pVbrWsDoRtKx6
 Ge04v0HiYE7O5Iv6kSrWZYauQitJHlEHnuJo8ZgqfWA85fIn+nrhButaQeUGymIGVcld
 FxnYqcXjEFi/SPhPWR+olj+5bijIJkhZvLMixrwc8XA5Z6FoEQlAY5FzdJl4Jb2ZMtEM
 IdEQ==
X-Gm-Message-State: APjAAAUy7NT6+msPXZUPq4e49kQO5VofoqHG5T+Gt7oXzKTsdmZtLvyq
 TEEnsSaWYKbvOccxDcoTfMiv88qkWp5WKAOdiIZ1Ig==
X-Google-Smtp-Source: APXvYqyhYHswKnB+01odEGOhapU2d1ybkbO7OVGv0qMcxCiM57xMXMGlQ7Mu0aMV2CefJNmt9LchrL7CnYaGHRcRbVk=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr192007oig.137.1557178984528; 
 Mon, 06 May 2019 14:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
 <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
 <1a5f3c44-9fa9-d423-66bf-45255a90c468@gmail.com>
 <CAFd5g45RYm+zfdJXnyp2KZZH5ojfOzy++aq+4zBeE5VDu6WgEw@mail.gmail.com>
 <052fa196-4ea9-8384-79b7-fe6bacc0ee82@gmail.com>
 <CAFd5g47aY-CL+d7DfiyTidY4aAVY+eg1TM1UJ4nYqKSfHOi-0w@mail.gmail.com>
 <63f63c7c-6185-5e64-b338-6a5e7fb9e27c@gmail.com>
 <CAGXu5jJpp2HyEWMtAde+VUt=9ni3HRu69NM4rUQJu4kBrnx9Kw@mail.gmail.com>
In-Reply-To: <CAGXu5jJpp2HyEWMtAde+VUt=9ni3HRu69NM4rUQJu4kBrnx9Kw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 6 May 2019 14:42:53 -0700
Message-ID: <CAFd5g47d-e31NecDEbMud0rUH55EbhcS0wJpjB1PZZaX5Udqmw@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
To: Kees Cook <keescook@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=94ZZFjAz8L6vodxrYz5ZCQ36NJZDWbAB/OOZ4duFwS4=;
 b=tLixckVpvUKIIP5RUjay0lZW7YNSS3dUAp/uUYFinYYsKHGVICkPCkOYGtF3sbBoWy
 WrEckQ4QP028zfHhbL5kBL+ohEGOP1dDKk+Bp5+VWfMsnb090NYGYzTdl/D4Y4BZg795
 E2qTT59iEGKQL66/nZu7o3rbn+PokHJnlfYdNIP/E2c/XuQzdE7pg9j0bvYzbCuwwxJL
 emPADFPM3ZOiA8e/GRITu0dcg4Os+e17Y3+CUGf4fPlweNagjJdF4OInhRnPReNkri5n
 LWQH1BOxdyyoBD4Yg62n/XVFQ/+F+SIAiTFtipiJC/QAUrtnzp2bJR8vq6aT+hCDGigV
 3HDQ==
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Shuah Khan <shuah@kernel.org>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBTdW4sIE1heSA1LCAyMDE5IGF0IDU6MTkgUE0gRnJhbmsgUm93YW5kIDxmcm93YW5kLmxp
c3RAZ21haWwuY29tPiB3cm90ZToKPiA+IFlvdSBjYW4gc2VlIHRoZSBmdWxsIHZlcnNpb24gMTQg
ZG9jdW1lbnQgaW4gdGhlIHN1Ym1pdHRlcidzIHJlcG86Cj4gPgo+ID4gICAkIGdpdCBjbG9uZSBo
dHRwczovL2dpdGh1Yi5jb20vaXNhYWNzL3Rlc3Rhbnl0aGluZy5naXRodWIuaW8uZ2l0Cj4gPiAg
ICQgY2QgdGVzdGFueXRoaW5nLmdpdGh1Yi5pbwo+ID4gICAkIGdpdCBjaGVja291dCB0YXAxNAo+
ID4gICAkIGxzIHRhcC12ZXJzaW9uLTE0LXNwZWNpZmljYXRpb24ubWQKPiA+Cj4gPiBNeSB1bmRl
cnN0YW5kaW5nIGlzIHRoZSB0aGUgdmVyc2lvbiAxNCBzcGVjaWZpY2F0aW9uIGlzIG5vdCB0cnlp
bmcgdG8KPiA+IGFkZCBuZXcgZmVhdHVyZXMsIGJ1dCBpbnN0ZWFkIGNhcHR1cmUgd2hhdCBpcyBh
bHJlYWR5IGltcGxlbWVudGVkIGluCj4gPiB0aGUgd2lsZC4KPgo+IE9oISBJIGRpZG4ndCBrbm93
IGFib3V0IHRoZSB3b3JrIG9uIFRBUCAxNC4gSSdsbCBnbyByZWFkIHRocm91Z2ggdGhpcy4KPgo+
ID4gPiAjIyBIZXJlIGlzIHdoYXQgSSBwcm9wb3NlIGZvciB0aGlzIHBhdGNoc2V0Ogo+ID4gPgo+
ID4gPiAgLSBQcmludCBvdXQgdGVzdCBudW1iZXIgcmFuZ2UgYXQgdGhlIGJlZ2lubmluZyBvZiBl
YWNoIHRlc3Qgc3VpdGUuCj4gPiA+ICAtIFByaW50IG91dCBsb2cgbGluZXMgYXMgc29vbiBhcyB0
aGV5IGhhcHBlbiBhcyBkaWFnbm9zdGljcy4KPiA+ID4gIC0gUHJpbnQgb3V0IHRoZSBsaW5lcyB0
aGF0IHN0YXRlIHdoZXRoZXIgYSB0ZXN0IHBhc3NlcyBvciBmYWlscyBhcyBhCj4gPiA+IG9rL25v
dCBvayBsaW5lLgo+ID4gPgo+ID4gPiBUaGlzIHdvdWxkIGJlIHRlY2huaWNhbGx5IGNvbmZvcm1p
bmcgd2l0aCBUQVAxMyBhbmQgaXMgY29uc2lzdGVudCB3aXRoCj4gPiA+IHdoYXQgc29tZSBrc2Vs
ZnRlc3RzIGhhdmUgZG9uZS4KPgo+IFRoaXMgaXMgd2hhdCBJIGZpeGVkIGtzZWxmdGVzdCB0byBh
Y3R1YWxseSBkbyAoaXQgd2Fzbid0IGRvaW5nIGNvcnJlY3QKPiBUQVAxMyksIGFuZCBTaHVhaCBp
cyB0ZXN0aW5nIHRoZSBzZXJpZXMgbm93Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3NodWFoL2xpbnV4LWtzZWxmdGVzdC5naXQvbG9nLz9oPWtzZnQt
dGFwLXJlZmFjdG9yCgpPaCwgY29vbCEgSSBndWVzcyB0aGlzIGlzIGFuIG9rYXkgYXBwcm9hY2gg
dGhlbi4KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
