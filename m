Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78671BB0DD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 11:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDCE6E231;
	Mon, 23 Sep 2019 09:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506166E231
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:05:14 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q10so8776965pfl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8pa0Tk6FlMlkzD8bXA6NA6bMdvmrzwl4PAFIDbVMYM=;
 b=tY4iUau7FvIrB9FkjYyxwb8JpO/i8qS6Rw3E94Nzy/7VsCkIIu2t8VNE6m9Ta4ybqa
 PgV/AiUsfqCONTCrgkhib7NojrdsH5hnGMsaYFW3toe8eddqMwrrJ+p/nyf5FRHA0WIW
 XJZ7cJ0RoVvWUx/yYsNbOHMa1UMeK/Ow/P0ogrX03deChybBjhvvq7f8poLDUzYdHfw6
 GI81k9oAmY8e8Rbpxd4bPNo0i5A1pOEzRYwYNjWexLK5xdAGW95u/AeajuQmtLBkerf0
 +9xd+9z2/A/Vj3Hg8T2NBg2HDrUNFfycr+aWtyPOv/rzu06S6sU0765DynqQjKxBZrpP
 2ylw==
X-Gm-Message-State: APjAAAUv0ZFwT7CzHJ9OD+Zj4INJtouR87kHu9062b3LSwQPd7Jofbkp
 MERq54Z2HTFf+Uf8/ZlHHRGzRe4TLkI7VoMEzWCpiw==
X-Google-Smtp-Source: APXvYqwcsKtiLcxSzZRbvj/9c2PAwvr8gZTaDk07lPhILKUwjb/s/yL4yzfAO84TT2ZemaVLn8TDzTeRlveY2nu9F6o=
X-Received: by 2002:a17:90a:1746:: with SMTP id
 6mr5388129pjm.117.1569229513429; 
 Mon, 23 Sep 2019 02:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190921001855.200947-1-brendanhiggins@google.com>
 <20190921001855.200947-8-brendanhiggins@google.com>
 <944ac47d-1411-9ebd-d0d4-a616c88c9c20@infradead.org>
In-Reply-To: <944ac47d-1411-9ebd-d0d4-a616c88c9c20@infradead.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 23 Sep 2019 02:05:02 -0700
Message-ID: <CAFd5g44e9bdK8h5+U1MkqPNuf2k9vnu-iPFLTzGajEHPEcRpHQ@mail.gmail.com>
Subject: Re: [PATCH v17 07/19] kunit: test: add initial tests
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v8pa0Tk6FlMlkzD8bXA6NA6bMdvmrzwl4PAFIDbVMYM=;
 b=NvXQgh6IW3soN2kC6YtQSTm4nJDtjH7T1g1wwUk4J2MMTXgFeWqE4zDVwCvgvthfAE
 WGgMCY+3F8tX2ulk7a71LHHwNjjj6szslWqQDPwjwKZALkV5YkTouU1UbPdDScjYS1A3
 tU4aEIFZK99BR3XOVeaN/cSOFn3rfi7yObVLV3PWs+NfL5qPlxMyeRQLXGH1oSX1DcR+
 Y00Kq9GxGhG7rrAxC5FyQBB+KSDkFMah1k7qmSzRXBnClfBw0q/Abrxnd2xhD8r5qEtT
 Tri2HbzI2Jc1bPenj4gaZNMu/v3ap/CxdJdQ2lrX7Qpp+yqg86whqYHZk9TgPcLogoid
 i1DA==
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjIsIDIwMTkgYXQgOToyOCBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiA5LzIwLzE5IDU6MTggUE0sIEJyZW5kYW4gSGlnZ2lu
cyB3cm90ZToKPiA+IEFkZCBhIHRlc3QgZm9yIHN0cmluZyBzdHJlYW0gYWxvbmcgd2l0aCBhIHNp
bXBsZXIgZXhhbXBsZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJy
ZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBMb2dhbiBH
dW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogU3RlcGhlbiBC
b3lkIDxzYm95ZEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgbGliL2t1bml0L0tjb25maWcgICAg
ICAgICAgICAgIHwgMjUgKysrKysrKysrKwo+ID4gIGxpYi9rdW5pdC9NYWtlZmlsZSAgICAgICAg
ICAgICB8ICA0ICsrCj4gPiAgbGliL2t1bml0L2V4YW1wbGUtdGVzdC5jICAgICAgIHwgODggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGxpYi9rdW5pdC9zdHJpbmctc3Ry
ZWFtLXRlc3QuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAxNjkgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIva3VuaXQvZXhh
bXBsZS10ZXN0LmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL2t1bml0L3N0cmluZy1zdHJl
YW0tdGVzdC5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2xpYi9rdW5pdC9LY29uZmlnIGIvbGliL2t1
bml0L0tjb25maWcKPiA+IGluZGV4IDY2NmI5Y2I2N2E3NC4uMzg2OGMyMjZjZjMxIDEwMDY0NAo+
ID4gLS0tIGEvbGliL2t1bml0L0tjb25maWcKPiA+ICsrKyBiL2xpYi9rdW5pdC9LY29uZmlnCj4g
PiBAQCAtMTEsMyArMTEsMjggQEAgbWVudWNvbmZpZyBLVU5JVAo+ID4gICAgICAgICBzcGVjaWFs
IGhhcmR3YXJlIHdoZW4gdXNpbmcgVU1MLiBDYW4gYWxzbyBiZSB1c2VkIG9uIG1vc3Qgb3RoZXIK
PiA+ICAgICAgICAgYXJjaGl0ZWN0dXJlcy4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHBsZWFzZSBz
ZWUKPiA+ICAgICAgICAgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvLgo+ID4gKwo+ID4g
K2lmIEtVTklUCj4KPiBUaGUgJ2lmJyBhYm92ZSBwcm92aWRlcyB0aGUgZGVwZW5kZW5jeSBjbGF1
c2UsIHNvIHRoZSAyICdkZXBlbmRzIG9uIEtVTklUJwo+IGJlbG93IGFyZSBub3QgbmVlZGVkLiAg
VGhleSBhcmUgcmVkdW5kYW50LgoKVGhhbmtzIGZvciBjYXRjaGluZyB0aGF0LiBJIGZpeGVkIGl0
IGluIHRoZSBuZXcgcmV2aXNpb24gSSBqdXN0IHNlbnQgb3V0LgoKPiA+ICsKPiA+ICtjb25maWcg
S1VOSVRfVEVTVAo+ID4gKyAgICAgYm9vbCAiS1VuaXQgdGVzdCBmb3IgS1VuaXQiCj4gPiArICAg
ICBkZXBlbmRzIG9uIEtVTklUCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEVuYWJsZXMgdGhl
IHVuaXQgdGVzdHMgZm9yIHRoZSBLVW5pdCB0ZXN0IGZyYW1ld29yay4gVGhlc2UgdGVzdHMgdGVz
dAo+ID4gKyAgICAgICB0aGUgS1VuaXQgdGVzdCBmcmFtZXdvcmsgaXRzZWxmOyB0aGUgdGVzdHMg
YXJlIGJvdGggd3JpdHRlbiB1c2luZwo+ID4gKyAgICAgICBLVW5pdCBhbmQgdGVzdCBLVW5pdC4g
VGhpcyBvcHRpb24gc2hvdWxkIG9ubHkgYmUgZW5hYmxlZCBmb3IgdGVzdGluZwo+ID4gKyAgICAg
ICBwdXJwb3NlcyBieSBkZXZlbG9wZXJzIGludGVyZXN0ZWQgaW4gdGVzdGluZyB0aGF0IEtVbml0
IHdvcmtzIGFzCj4gPiArICAgICAgIGV4cGVjdGVkLgo+ID4gKwo+ID4gK2NvbmZpZyBLVU5JVF9F
WEFNUExFX1RFU1QKPiA+ICsgICAgIGJvb2wgIkV4YW1wbGUgdGVzdCBmb3IgS1VuaXQiCj4gPiAr
ICAgICBkZXBlbmRzIG9uIEtVTklUCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEVuYWJsZXMg
YW4gZXhhbXBsZSB1bml0IHRlc3QgdGhhdCBpbGx1c3RyYXRlcyBzb21lIG9mIHRoZSBiYXNpYwo+
ID4gKyAgICAgICBmZWF0dXJlcyBvZiBLVW5pdC4gVGhpcyB0ZXN0IG9ubHkgZXhpc3RzIHRvIGhl
bHAgbmV3IHVzZXJzIHVuZGVyc3RhbmQKPiA+ICsgICAgICAgd2hhdCBLVW5pdCBpcyBhbmQgaG93
IGl0IGlzIHVzZWQuIFBsZWFzZSByZWZlciB0byB0aGUgZXhhbXBsZSB0ZXN0Cj4gPiArICAgICAg
IGl0c2VsZiwgbGliL2t1bml0L2V4YW1wbGUtdGVzdC5jLCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4g
VGhpcyBvcHRpb24KPiA+ICsgICAgICAgaXMgaW50ZW5kZWQgZm9yIGN1cmlvdXMgaGFja2VycyB3
aG8gd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIGhvdyB0bwo+ID4gKyAgICAgICB1c2UgS1VuaXQg
Zm9yIGtlcm5lbCBkZXZlbG9wbWVudC4KPiA+ICsKPiA+ICtlbmRpZiAjIEtVTklUCgpDaGVlcnMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
