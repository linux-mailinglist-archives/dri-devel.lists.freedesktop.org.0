Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F38AE6F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1476B6E03A;
	Tue, 13 Aug 2019 05:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132286E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:03:55 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id m9so48606477pls.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aKOfFTV6VGP5BNUB1Vnarc/F0DL+26vq0829FAbZrqo=;
 b=AhK9k7TC6AeuWA/mfXGpEvAt/Pi/ci8sXqJKqFQOWIPmLDAEaOJQyD2bvOtS34Rlqn
 QhBFhKBdPfXKqdMALGnBSqqabNkLm+eyKyQFuB3KRjQbtuos5WNMySiIMxnINXii7/hX
 Qu/cvCDj8IOid0AWoyeDe9XSRriZj7g1FNBfXEPUWNA59UmKtpVfEQpfYdPmQqWbyhnI
 2O/QcHuA4UhiqOOX3zW+HeNfcqzRvImToGUm7FhSPicE0T3i4utkLAxgiGnPYaXircy1
 upgDaJYdKdWKRxGoDNqRKQUxDK63zz1zujJC+1UflawSfVFQw3YvQXx/WmJgtzP4qyJF
 MblQ==
X-Gm-Message-State: APjAAAUl2hsvgEgB9m0Cw4tGB6RIleaq4iHZ68UDmbKv5ovabMuP0OUj
 zKBMN4vQg6fPi8skX1e+9Iy+jmBR5K3C4Up2OSTRLA==
X-Google-Smtp-Source: APXvYqwgOw9EQ70Umy0oEnQ5G5LCL6qyMyWjnNbSVpHRs20m04I8HxLTnoiIjpuTiP19er8DvO/pyE/cwQSXqDyWk+Y=
X-Received: by 2002:a17:902:5983:: with SMTP id
 p3mr26758654pli.232.1565672634067; 
 Mon, 12 Aug 2019 22:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com>
 <20190812234644.E054D20679@mail.kernel.org>
 <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
 <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
 <20190813045747.3AF0A206C2@mail.kernel.org>
In-Reply-To: <20190813045747.3AF0A206C2@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 22:03:42 -0700
Message-ID: <CAFd5g47OUymztYcWngDUd10WswVOrO-PTmX+KNF_T=cg_OcJNg@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aKOfFTV6VGP5BNUB1Vnarc/F0DL+26vq0829FAbZrqo=;
 b=svgoSdNRxSLsCnnIOc7xbQg9GgF9oKMJ1Zy9kd11vWwaKXoOnKpb4m3E5VD5iVlgYD
 +Q8GW61vmO7pSODND/EU3ySpZFU6zBm/nnzXrEdbXjYeyp0z5HZ4MlPGEFDVamV7AnNt
 YxSzN7MGuqE5YtmeQLv8pM8cwjVoHM11Q7HgFuNs7NBSHTrEDEHtBfVlPMX1tM122Zoh
 /lJWbiyvCy294xIaxGNy1x0QeVRdkekMXrwW6vrlb0zY+yiiNnJIqQVHv78TipzeF0fL
 lbgrIbrBSmtQjgptdFMq0Sq8pSiArBm+sF/Wu+BeNyqHXo/vQXv7UP+JqfWMmgemFjSH
 IU5Q==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTo1NyBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMjE6
Mjc6MDUpCj4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCA0OjU2IFBNIEJyZW5kYW4gSGlnZ2lu
cwo+ID4gPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBN
b24sIEF1ZyAxMiwgMjAxOSBhdCA0OjQ2IFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0w
OC0xMiAxMToyNDowNykKPiA+ID4gPiA+ICsjZGVmaW5lIEtVTklUX0lOSVRfRkFJTF9BU1NFUlRf
U1RSVUNUKHRlc3QsIHR5cGUpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgLmFzc2VydCA9IEtVTklUX0lOSVRfQVNTRVJUX1NUUlVDVCh0ZXN0
LCAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSwgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGt1bml0X2ZhaWxfYXNzZXJ0X2Zvcm1hdCkgICBcCj4gPiA+ID4KPiA+ID4gPiBUaGlz
IG9uZSBnb3QgaW5kZW50ZWQgb25lIHRvbyBtYW55IHRpbWVzPwo+ID4gPgo+ID4gPiBOb3QgdW5s
ZXNzIEkgaGF2ZSBiZWVuIHVzaW5nIHRoZSB3cm9uZyBmb3JtYXR0aW5nIGZvciBtdWx0aWxpbmUK
PiA+ID4gbWFjcm9zLiBZb3UgY2FuIHNlZSB0aGlzIGNvbW1pdCBhcHBsaWVkIGhlcmU6Cj4gPiA+
IGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51eC8rLzg3MDk2NGRhMjk5MDkyMDAz
MDk5MGRkMWZmYjY0N2VmNDA4ZTUyZGYvaW5jbHVkZS9rdW5pdC9hc3NlcnQuaCM1OQo+ID4gPgo+
ID4gPiBJIGhhdmUgdGVzdCwgdHlwZSwgYW5kIGt1bml0X2ZhaWxfYXNzZXJ0X2Zvcm1hdCBhbGwg
Y29sdW1uIGFsaWduZWQgKGl0Cj4gPiA+IGp1c3QgZG9lc24ndCByZW5kZXIgbmljZWx5IGluIHRo
ZSBwYXRjaCBmb3JtYXQpLgo+ID4KPiA+IERpc3JlZ2FyZCB0aGF0IGxhc3QgY29tbWVudC4gSSBq
dXN0IGxvb2tlZCBhdCB0aGUgbGluZSBpbW1lZGlhdGVseQo+ID4gYWJvdmUgeW91ciBjb21tZW50
IGFuZCB0aG91Z2h0IGl0IGxvb2tlZCBjb3JyZWN0LiBTb3JyeSBhYm91dCB0aGF0Cj4gPiAoeW91
IHdlcmUgcG9pbnRpbmcgb3V0IHRoYXQgdGhlIC5hc3NlcnQgbGluZSBsb29rZWQgd3JvbmcsIGNv
cnJlY3Q/KS4KPgo+IFllcy4gLmFzc2VydCBpcyBkb3VibGUgdGFiYmVkPwoKWWVzIGl0IGlzLiBT
b3JyeSBhYm91dCB0aGUgY29uZnVzaW9uLiBXaWxsIGZpeC4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
