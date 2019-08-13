Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB08B1DB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D729A8935A;
	Tue, 13 Aug 2019 07:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A248910A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:59:30 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay6so49008594plb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 00:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5R0Mn+kXy6miNBPjF2nukdlARFsEwajrrqyvCbZs0pA=;
 b=JCkWWW7H86DqLob9aEmmtW/D0vP5B5Ep92Kte+LFu8yltKqef/YwwguPvK6n3DQzr3
 SLrMHL4TWsf1wSzlPClkSk9ETxCHTxK+cAPZFXfmmQlBLHt5bugRQnIlSSxpKiiweLZc
 HJ5peeoWgGKoJAAWo7Z8dnfXGLtQZ/lCTQZCQyD+d2e18zw3KFTvJ6pxbtwbhfldueFI
 9PblOp+iOZ7fITwOKg5LoDZIptetiKM8oEGc/Qu8GBHYJo47RoHhB34gdM3NZg612P6y
 ZIRAecnQ/iUoPh1i4AiIUgoXNEzs9zuIf7fpyYpje/9lFjMKvvPTrV8kdEFhsseOD4tU
 mvzA==
X-Gm-Message-State: APjAAAWkKD4DkRZtO/BQvfetqPJ4WrCKzjeUk+qF5KkN77pCLsINFpQF
 UV4+DlwSNOqucHqtq1BpFahYsjjxukRU5nmSRGlkSg==
X-Google-Smtp-Source: APXvYqyvbUK5kDHossVyHcMfS13gJpm82JS1lGa4QkU7lNSWK1exa+MkZF0H451Y+v9ozGPzr6jJly+0fJd6rna7v9Y=
X-Received: by 2002:a17:902:169:: with SMTP id
 96mr23827974plb.297.1565683169131; 
 Tue, 13 Aug 2019 00:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-15-brendanhiggins@google.com>
 <20190813043859.661F82054F@mail.kernel.org>
In-Reply-To: <20190813043859.661F82054F@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Aug 2019 00:59:18 -0700
Message-ID: <CAFd5g44wUOhmxr3r+-LR_igePMjtaRrtT5jGdqPJgb0xPdf+Ag@mail.gmail.com>
Subject: Re: [PATCH v12 14/18] kunit: defconfig: add defconfigs for building
 KUnit tests
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5R0Mn+kXy6miNBPjF2nukdlARFsEwajrrqyvCbZs0pA=;
 b=ElNxu9XWCw3bi/ATpZFZYjmD1lNIywxKKFS5/SHJ+NwUixjR7oQpJwrCG6C82nHfPy
 YE8W4U4AeTrAMqQ2pXMKDLv0qv25tWwlR4csBdCEP98WPeUFvsBeDL1m4hdGu9A+ggXq
 rIp38mmbymsY1BBKpvxm+hERpjOI6axxwbcZj1V8AikaF+Z1aQ1dWRUa9wjwGG01d9h8
 sKGT9tDrSb5EvJwPrCnDwx2/CHTHsgoyEks8OTr6XOvgVMfyBNDjqNOfEiBRGJ6z8hZW
 ZIB+cqqvARstSDttQQKSBm5mxEfD8wl+hAodt9NBsSLUg9+gEPC8zU5ZICyW930HwyEc
 VCXQ==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTozOSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6
MjQ6MTcpCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC91bS9jb25maWdzL2t1bml0X2RlZmNvbmZpZyBi
L2FyY2gvdW0vY29uZmlncy9rdW5pdF9kZWZjb25maWcKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5iZmU0OTY4OTAzOGYxCj4gPiAtLS0gL2Rldi9udWxs
Cj4gPiArKysgYi9hcmNoL3VtL2NvbmZpZ3Mva3VuaXRfZGVmY29uZmlnCj4gPiBAQCAtMCwwICsx
LDggQEAKPiA+ICtDT05GSUdfT0Y9eQo+ID4gK0NPTkZJR19PRl9VTklUVEVTVD15Cj4gPiArQ09O
RklHX09GX09WRVJMQVk9eQo+ID4gK0NPTkZJR19JMkM9eQo+ID4gK0NPTkZJR19JMkNfTVVYPXkK
PiA+ICtDT05GSUdfS1VOSVQ9eQo+ID4gK0NPTkZJR19LVU5JVF9URVNUPXkKPiA+ICtDT05GSUdf
S1VOSVRfRVhBTVBMRV9URVNUPXkKPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL2t1bml0
L2NvbmZpZ3MvYWxsX3Rlc3RzLmNvbmZpZyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvY29uZmlncy9h
bGxfdGVzdHMuY29uZmlnCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwMC4uYmZlNDk2ODkwMzhmMQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdG9vbHMv
dGVzdGluZy9rdW5pdC9jb25maWdzL2FsbF90ZXN0cy5jb25maWcKPiA+IEBAIC0wLDAgKzEsOCBA
QAo+ID4gK0NPTkZJR19PRj15Cj4gPiArQ09ORklHX09GX1VOSVRURVNUPXkKPiA+ICtDT05GSUdf
T0ZfT1ZFUkxBWT15Cj4gPiArQ09ORklHX0kyQz15Cj4gPiArQ09ORklHX0kyQ19NVVg9eQo+Cj4g
QXJlIHRoZXNlIGFib3ZlIGNvbmZpZyBvcHRpb25zIG5lY2Vzc2FyeT8gSSBkb24ndCB0aGluayB0
aGV5J3JlIHBhcnQgb2YKPiB0aGUgcGF0Y2ggc2VyaWVzIGFueW1vcmUgc28gaXQgbG9va3Mgb2Rk
IHRvIGVuYWJsZSB0aGUgT0YgdW5pdHRlc3RzIGFuZAo+IGkyYyBjb25maWdzLgoKT2ggd2hvb3Bz
LCBJIGZvcmdvdCB0aGF0IHdlIGRyb3BwZWQgdGhlIE9GX1VOSVRURVNUIGZyb20gdGhpcwpwYXRj
aHNldC4gV2lsbCBmaXguCgo+ID4gK0NPTkZJR19LVU5JVD15Cj4gPiArQ09ORklHX0tVTklUX1RF
U1Q9eQo+ID4gK0NPTkZJR19LVU5JVF9FWEFNUExFX1RFU1Q9eQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
