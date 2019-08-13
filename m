Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF08AE92
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201C86E03F;
	Tue, 13 Aug 2019 05:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D436E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:09:38 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o13so50602202pgp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLkfmiy/QyxG+42Kpd1Hh2gG09JBSRi1kuJ0irEOT+Q=;
 b=TPmdD5t7VkqpnIe5ogPz9/kboJGOmYsz6BqioxE/T/uawsKvNlmtjXWlWVnR5Suc3L
 qhECd4B0OLGS8vPDw8poqHCJtG0cZCrKc1HuzTQBdGiy6zw83tNN9Atssx4ijq+EjhOV
 iXSADJGqjZGSepOkyAt63IxA57J9bJHmSwQKrOakQx4wUStWHsh4SfmnMTTpZgSQ6Xt+
 t/+5byf+VBHPkiCdxVZVJPee5O/6zVuQiioZ7eCY4c1x/DLUGs5/0goALvuVLoEuXuJE
 rQPUBShmgKNmOWd1DOrnQfl/h7Oxsq5j2MeFHZ1gWLmfCnPiQ5OemGEz3raWNNjUIsc+
 FW4Q==
X-Gm-Message-State: APjAAAUU3bUz9Te1Xd8avwSCiNBSd/c+1p3E8RpMe1y0ac/8mzv08xCo
 vaqW3UuHSixNM5LMvAByASdRspjfh8+Oah6F50gkXg==
X-Google-Smtp-Source: APXvYqwuRvdkQRBufOH1je8RsECuoe8PsScuGBBjY118Ufh882DHOjHaTVKhOCRIYEV6VNsZUpt68lWBTKVfNRYZXa8=
X-Received: by 2002:a17:90a:c391:: with SMTP id
 h17mr524990pjt.131.1565672978100; 
 Mon, 12 Aug 2019 22:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-12-brendanhiggins@google.com>
 <20190813045510.C1D6E206C2@mail.kernel.org>
In-Reply-To: <20190813045510.C1D6E206C2@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 22:09:26 -0700
Message-ID: <CAFd5g47jrUd+ES4AaWsLDRCfsGiKDB-rOP6TR-NdymCeVAK3Kg@mail.gmail.com>
Subject: Re: [PATCH v12 11/18] kunit: test: add the concept of assertions
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uLkfmiy/QyxG+42Kpd1Hh2gG09JBSRi1kuJ0irEOT+Q=;
 b=blOJdc2kt55ZqQDvPUZbAMrG0e9V6Lpz+glDC3wqeZ0WFkpdzH+BHVuWLKpOnhb42G
 g/4gIqAUYUWwrSZVnoWlA0+3BTuFFHTn4QIkPhZ/yY/qHdFseTm5A1T8f5E1IwOIGPkQ
 NjL2X3JkoAgV9wX66vJ01slCy0p6rnZ7bkyjxanoLsFcwNNC9ezGHFtGPQthuBsXEPdD
 Vzi/25vZpUBOV4gIKVVTs3IY9Dq9AiSUtfWFy0iWSPQYG787ViekPjFY+1C9grp4yxiQ
 WMAj2QOcebo3fC3yliGOOPA8v9/MAYuJN9q8LYDdlO8ROvEqJbK4dyCfU63RlOwjE9t3
 XXgg==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTo1NSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6
MjQ6MTQpCj4gPiBBZGQgc3VwcG9ydCBmb3IgYXNzZXJ0aW9ucyB3aGljaCBhcmUgbGlrZSBleHBl
Y3RhdGlvbnMgZXhjZXB0IHRoZSB0ZXN0Cj4gPiB0ZXJtaW5hdGVzIGlmIHRoZSBhc3NlcnRpb24g
aXMgbm90IHNhdGlzZmllZC4KPiA+Cj4gPiBUaGUgaWRlYSB3aXRoIGFzc2VydGlvbnMgaXMgdGhh
dCB5b3UgdXNlIHRoZW0gdG8gc3RhdGUgYWxsIHRoZQo+ID4gcHJlY29uZGl0aW9ucyBmb3IgeW91
ciB0ZXN0LiBMb2dpY2FsbHkgc3BlYWtpbmcsIHRoZXNlIGFyZSB0aGUgcHJlbWlzZXMKPiA+IG9m
IHRoZSB0ZXN0IGNhc2UsIHNvIGlmIGEgcHJlbWlzZSBpc24ndCB0cnVlLCB0aGVyZSBpcyBubyBw
b2ludCBpbgo+ID4gY29udGludWluZyB0aGUgdGVzdCBjYXNlIGJlY2F1c2UgdGhlcmUgYXJlIG5v
IGNvbmNsdXNpb25zIHRoYXQgY2FuIGJlCj4gPiBkcmF3biB3aXRob3V0IHRoZSBwcmVtaXNlcy4g
V2hlcmVhcywgdGhlIGV4cGVjdGF0aW9uIGlzIHRoZSB0aGluZyB5b3UKPiA+IGFyZSB0cnlpbmcg
dG8gcHJvdmUuIEl0IGlzIG5vdCB1c2VkIHVuaXZlcnNhbGx5IGluIHgtdW5pdCBzdHlsZSB0ZXN0
Cj4gPiBmcmFtZXdvcmtzLCBidXQgSSByZWFsbHkgbGlrZSBpdCBhcyBhIGNvbnZlbnRpb24uICBZ
b3UgY291bGQgc3RpbGwKPiA+IGV4cHJlc3MgdGhlIGlkZWEgb2YgYSBwcmVtaXNlIHVzaW5nIHRo
ZSBhYm92ZSBpZGlvbSwgYnV0IEkgdGhpbmsKPiA+IEtVTklUX0FTU0VSVF8qIHN0YXRlcyB0aGUg
aW50ZW5kZWQgaWRlYSBwZXJmZWN0bHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBI
aWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiBSZXZpZXdlZC1i
eTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6
IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPgo+ID4gKyAqIFNldHMgYW4gZXhwZWN0
YXRpb24gdGhhdCB0aGUgdmFsdWVzIHRoYXQgQGxlZnQgYW5kIEByaWdodCBldmFsdWF0ZSB0byBh
cmUKPiA+ICsgKiBub3QgZXF1YWwuIFRoaXMgaXMgc2VtYW50aWNhbGx5IGVxdWl2YWxlbnQgdG8K
PiA+ICsgKiBLVU5JVF9BU1NFUlRfVFJVRShAdGVzdCwgc3RyY21wKChAbGVmdCksIChAcmlnaHQp
KSkuIFNlZSBLVU5JVF9BU1NFUlRfVFJVRSgpCj4gPiArICogZm9yIG1vcmUgaW5mb3JtYXRpb24u
Cj4gPiArICovCj4gPiArI2RlZmluZSBLVU5JVF9BU1NFUlRfU1RSTkVRKHRlc3QsIGxlZnQsIHJp
Z2h0KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAg
IEtVTklUX0JJTkFSWV9TVFJfTkVfQVNTRVJUSU9OKHRlc3QsICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBLVU5JVF9BU1NFUlRJT04sICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVmdCwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJpZ2h0KQo+ID4gKwo+ID4gKyNkZWZpbmUgS1VOSVRfQVNTRVJUX1NUUk5FUV9NU0codGVzdCwg
bGVmdCwgcmlnaHQsIGZtdCwgLi4uKSAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAg
ICAgICBLVU5JVF9CSU5BUllfU1RSX05FX01TR19BU1NFUlRJT04odGVzdCwgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEtVTklUX0FTU0VSVElPTiwgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZWZ0LCAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmlnaHQsICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZtdCwgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+Cj4gU2FtZSBxdWVzdGlvbiBhYm91dCB0YWJiaW5nIHRvby4KClllcC4gV0ls
bCBmaXguCgo+ID4gZGlmZiAtLWdpdCBhL2t1bml0L3Rlc3QtdGVzdC5jIGIva3VuaXQvdGVzdC10
ZXN0LmMKPiA+IGluZGV4IDg4ZjRjZGYwM2RiMmEuLjA1OGYzZmIzNzQ1OGEgMTAwNjQ0Cj4gPiAt
LS0gYS9rdW5pdC90ZXN0LXRlc3QuYwo+ID4gKysrIGIva3VuaXQvdGVzdC10ZXN0LmMKPiA+IEBA
IC03OCwxMSArNzgsMTMgQEAgc3RhdGljIGludCBrdW5pdF90cnlfY2F0Y2hfdGVzdF9pbml0KHN0
cnVjdCBrdW5pdCAqdGVzdCkKPiA+ICAgICAgICAgc3RydWN0IGt1bml0X3RyeV9jYXRjaF90ZXN0
X2NvbnRleHQgKmN0eDsKPiA+Cj4gPiAgICAgICAgIGN0eCA9IGt1bml0X2t6YWxsb2ModGVzdCwg
c2l6ZW9mKCpjdHgpLCBHRlBfS0VSTkVMKTsKPiA+ICsgICAgICAgS1VOSVRfQVNTRVJUX05PVF9F
UlJfT1JfTlVMTCh0ZXN0LCBjdHgpOwo+Cj4gQWggb2suIFF1ZXN0aW9uIHN0aWxsIHN0YW5kcyBp
ZiBrdW5pdF9remFsbG9jKCkgc2hvdWxkIGp1c3QgaGF2ZSB0aGUKPiBhc3NlcnRpb24gb24gZmFp
bHVyZS4KClJpZ2h0LiBJbiB0aGUgcHJldmlvdXMgcGF0Y2ggS1VOSVRfQVNTRVJUXyogZG9lc24n
dCBleGlzdCB5ZXQsIHNvIEkKY2FuJ3QgdXNlIGl0LiBBbmQgcmF0aGVyIHRoYW4gZmFsbCBiYWNr
IHRvIHJldHVybiAtRU5PTUVNIGxpa2UgSQpzaG91bGQgaGF2ZSwgSSBldmlkZW50bHkgZm9yZ290
IHRvIGRvIHRoYXQuCgo+ID4gICAgICAgICB0ZXN0LT5wcml2ID0gY3R4Owo+ID4KPiA+ICAgICAg
ICAgY3R4LT50cnlfY2F0Y2ggPSBrdW5pdF9rbWFsbG9jKHRlc3QsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoKmN0eC0+dHJ5X2NhdGNoKSwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwpOwo+ID4gKyAg
ICAgICBLVU5JVF9BU1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIGN0eC0+dHJ5X2NhdGNoKTsK
PiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
