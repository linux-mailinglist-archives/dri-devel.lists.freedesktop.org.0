Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AB8AE66
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595B6E039;
	Tue, 13 Aug 2019 05:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBF76E039
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:03:11 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id f17so46887127pfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cO9jrOGgF5wujsFXMHtoYNXvgUhydDYlF08f1pq39E=;
 b=XrQewvYoSdy+PvF0XDl4bASQDFDODeb6BX1bHSljza/a2DyVQdTrzLjZ0/iluAeyP6
 FGopuLvrWJlAPO305lASwvx9mqQVja1RG4CmazTCb5HJ/JPQOENuy02+QZ2FTOR3ZuhH
 878sxGye9U5QSpJVKenUD8oEI5UhSTN/gIh52tz9hxu+FElxxqcu4mYG9U1ezVP8F9Bi
 Lre9AW75e2LjDd+ewKo3rPx9Cz7p2V8lNC4LsBiaGsIlWSxvIc/kLfFuhrCf8TO/Guma
 /oHgtljEJUWuS2hG+4Dt56FKW1sO/djDQqs6M6QfFrr6cN3PNISyjVDEJZ/QPdwHBIaj
 rKsw==
X-Gm-Message-State: APjAAAUqbbL1gSzrUK9vl0aI5bNqwuFrASU+8DqLgg653p72C0lSb7lT
 ncIS6JAwf0tDgt8O99V/wtthoXDSRfGzooryR+H/Aw==
X-Google-Smtp-Source: APXvYqxe3Yuc1/IPYBDWpkhdxK9MrqBlpBCfUzv/UyMf8npsBcj76TlFOcJ9beMy4gx9z+/oMn0KOERMMEUsJXLW4tU=
X-Received: by 2002:aa7:8f2e:: with SMTP id y14mr9786090pfr.113.1565672590442; 
 Mon, 12 Aug 2019 22:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
 <20190812235940.100842063F@mail.kernel.org>
 <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
 <20190813045623.F3D9520842@mail.kernel.org>
In-Reply-To: <20190813045623.F3D9520842@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 22:02:59 -0700
Message-ID: <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4cO9jrOGgF5wujsFXMHtoYNXvgUhydDYlF08f1pq39E=;
 b=IJDEFp+tZg956HdkEB/yKpoKHOFoi1PcVpOx5zPUJll5AJ5C8M+CFwUO+F8F8Q/rit
 8HcowooFg6ntqkIFuj6R4k+GwmJgIitCqOV2QvGuxn7m9MQGXg9qvC85ytvNf5bcYus+
 EprLmHUXh9bThNArfUe3XOKZVbo/EBN6VgqZBcT95WmmKJTlRd528A9f6TQgIETjut1/
 wI8daRdYTmSq6wYQl4NTMhJ/qVqO63tEGOCbSOifsskf9GK6VMybLklO81hLBeB9tly/
 80uCE+R8Iy4Fzfqk20iE8S9pCq3TNIClCmZ4T12ccP5rxSYxtRJSh6xSaDrQfj2wM6vG
 UTbw==
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
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTo1NiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTc6
NDE6MDUpCj4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCA0OjU5IFBNIFN0ZXBoZW4gQm95ZCA8
c2JveWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4ga3VuaXRfcmVzb3VyY2VfZGVz
dHJveSAocmVzcGVjdGl2ZSBlcXVpdmFsZW50cyB0byBkZXZtX2tmcmVlLCBhbmQKPiA+ID4gPiBk
ZXZyZXNfZGVzdHJveSkgYW5kIHVzZSBrdW5pdF9rZnJlZSBoZXJlPwo+ID4gPiA+Cj4gPiA+Cj4g
PiA+IFllcywgb3IgZHJvcCB0aGUgQVBJIGVudGlyZWx5PyBEb2VzIGFueXRoaW5nIG5lZWQgdGhp
cyBmdW5jdGlvbmFsaXR5Pwo+ID4KPiA+IERyb3AgdGhlIGt1bml0X3Jlc291cmNlIEFQST8gSSB3
b3VsZCBzdHJvbmdseSBwcmVmZXIgbm90IHRvLgo+Cj4gTm8uIEkgbWVhbiB0aGlzIEFQSSwgc3Ry
aW5nX3N0cmVhbV9jbGVhcigpLiBEb2VzIGFueXRoaW5nIHVzZSBpdD8KCk9oLCByaWdodC4gTm8u
CgpIb3dldmVyLCBub3cgdGhhdCBJIGFkZGVkIHRoZSBrdW5pdF9yZXNvdXJjZV9kZXN0cm95LCBJ
IHRob3VnaHQgaXQKbWlnaHQgYmUgZ29vZCB0byBmcmVlIHRoZSBzdHJpbmdfc3RyZWFtIGFmdGVy
IEkgdXNlIGl0IGluIGVhY2ggY2FsbCB0bwprdW5pdF9hc3NlcnQtPmZvcm1hdCguLi4pIGluIHdo
aWNoIGNhc2UgSSB3aWxsIGJlIHVzaW5nIHRoaXMgbG9naWMuCgpTbyBJIHRoaW5rIHRoZSByaWdo
dCB0aGluZyB0byBkbyBpcyB0byBleHBvc2Ugc3RyaW5nX3N0cmVhbV9kZXN0cm95IHNvCmt1bml0
X2RvX2Fzc2VydCBjYW4gY2xlYW4gdXAgd2hlbiBpdCdzIGRvbmUsIGFuZCB0aGVuIGRlbW90ZQpz
dHJpbmdfc3RyZWFtX2NsZWFyIHRvIHN0YXRpYy4gU291bmQgZ29vZD8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
