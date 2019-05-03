Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F6126EC
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 06:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6F89467;
	Fri,  3 May 2019 04:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F289467
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 04:37:38 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id o39so4202189ota.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 21:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MP+BYohbe5InwRfSzvg57aXOQ3N16hg/j/194MGpAY0=;
 b=Yhyd24jzGL2SbhdM3AC79j+aZaYM9Bw/DABAZybQ6l/1F+Hl4nZ1vs52Myn7W4hgfu
 I4qszJIODoAwWcMArv5CHcH817c+jKyusZsA/BDwBpByd2wU9ME9dyROT9TCfbPM8flL
 JsvRO+X9dEmWCjghGiuk1GfyrTVeaZJoJtk02LIWF54PuoneJokERE6q47kCz37SSLTG
 EDJvRQmPpHzs8L0o78PBcPq5+2B5jmDTREnoLa/QnjPRLAoSRJX4Y3EEyGv+a3kkGTQc
 3AqJL/SwKIg7e1L/xtfE6lcRQBlnRBZnglJ8jsGZneKzzTHniBxXEsBih7r6qgNh0R1Z
 OFdw==
X-Gm-Message-State: APjAAAWwzpy1fucXzYBr5dMPPhOxByQsZk/Pp6dVqYA1c5usQJjJIXVN
 RLqkRphNozJQqXox8Uoiwqfck8Z2DwOAZvJr+P0/Bg==
X-Google-Smtp-Source: APXvYqzr00vtpNCRa2QqJZ42KJSToZ1wauw/4VV+vzP4c9tKhQXBp7ukXjW5JZyxz7qF7iSRxd8GRh/4dSu03CZLLfk=
X-Received: by 2002:a9d:7f19:: with SMTP id j25mr5018212otq.25.1556858257579; 
 Thu, 02 May 2019 21:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-4-brendanhiggins@google.com>
 <1befe456-d981-d726-44f9-ebe3702ee51d@kernel.org>
In-Reply-To: <1befe456-d981-d726-44f9-ebe3702ee51d@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 21:37:26 -0700
Message-ID: <CAFd5g46Ok5rtXUyeHdyoujsdYPq4qwaZwdu3CxY50Gq_iq7B6A@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] kunit: test: add string_stream a std::stream
 like string builder
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MP+BYohbe5InwRfSzvg57aXOQ3N16hg/j/194MGpAY0=;
 b=nX2mqnQH8G7lAq/7boHjf6fgeLW4OhXc8dycc5+By6G9miBNlXzrVPV09oM01sBY2z
 1PY2T/XYJRHqtEONNgq9PADGf03W5G4sziQ4uRTMnqAEoh6iNM5a9Ezoiyo1ndCy7ojW
 tk5gH9WgN5g9NpRotxrQseR6tWEmch2vzDn0sL0k1iRMx7bM8e8KuZGIwI0PZSgcFr3+
 TlFU9bnfKzaF/HkPoJxOnNiQ3CLrmM6khM79ImW9xBb83Molxw1NMYQ6x9BlXbS1s9zs
 S9Wn0BBJ13BpxlnQuKJTgsk8nHAZ3z9hw5P/B+YZkt20RKzyQ4WKZ9zq8VVw1rVYepe+
 8Lqg==
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
 skhan@linuxfoundation.org, Dan Williams <dan.j.williams@intel.com>,
 kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA2OjI2IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDUvMS8xOSA1OjAxIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cjwgc25p
cCA+Cj4gPiBkaWZmIC0tZ2l0IGEva3VuaXQvTWFrZWZpbGUgYi9rdW5pdC9NYWtlZmlsZQo+ID4g
aW5kZXggNWVmZGM0ZGVhMmMwOC4uMjc1YjU2NWEwZTgxZiAxMDA2NDQKPiA+IC0tLSBhL2t1bml0
L01ha2VmaWxlCj4gPiArKysgYi9rdW5pdC9NYWtlZmlsZQo+ID4gQEAgLTEgKzEsMiBAQAo+ID4g
LW9iai0kKENPTkZJR19LVU5JVCkgKz0gICAgICAgICAgICAgICAgICAgICAgIHRlc3Qubwo+ID4g
K29iai0kKENPTkZJR19LVU5JVCkgKz0gICAgICAgICAgICAgICAgICAgICAgIHRlc3QubyBcCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmluZy1zdHJlYW0ubwo+
ID4gZGlmZiAtLWdpdCBhL2t1bml0L3N0cmluZy1zdHJlYW0uYyBiL2t1bml0L3N0cmluZy1zdHJl
YW0uYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjcw
MTgxOTRlY2YyZmEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2t1bml0L3N0cmluZy1zdHJl
YW0uYwo+ID4gQEAgLTAsMCArMSwxNDQgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAo+ID4gKy8qCj4gPiArICogQysrIHN0cmVhbSBzdHlsZSBzdHJpbmcgYnVpbGRl
ciB1c2VkIGluIEtVbml0IGZvciBidWlsZGluZyBtZXNzYWdlcy4KPiA+ICsgKgo+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAxOSwgR29vZ2xlIExMQy4KPiA+ICsgKiBBdXRob3I6IEJyZW5kYW4gSGln
Z2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5j
bHVkZSA8bGludXgvbGlzdC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiArI2lu
Y2x1ZGUgPGt1bml0L3N0cmluZy1zdHJlYW0uaD4KPiA+ICsKPiA+ICtpbnQgc3RyaW5nX3N0cmVh
bV92YWRkKHN0cnVjdCBzdHJpbmdfc3RyZWFtICp0aGlzLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgY29uc3QgY2hhciAqZm10LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgdmFfbGlzdCBhcmdz
KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBzdHJpbmdfc3RyZWFtX2ZyYWdtZW50ICpmcmFnbWVu
dDsKPgo+IFNpbmNlIHRoZXJlIGlzIGZpZWxkIHdpdGggdGhlIHNhbWUgbmFtZSwgcGxlYXNlIHVz
ZSBhIGRpZmZlcmVudAo+IG5hbWUuIFVzaW5nIHRoZSBzYW1lIG5hbWUgZm9yIHRoZSBzdHJ1Y3Qg
d2hpY2ggY29udGFpbnMgYSBmaWVsZAo+IG9mIHRoZSBzYW1lIG5hbWUgZ2V0IHZlcnkgY29uZnVz
aW5nIGFuZCB3aWxsIGhhcmQgdG8gbWFpbnRhaW4KPiB0aGUgY29kZS4KPgo+ID4gKyAgICAgaW50
IGxlbjsKPiA+ICsgICAgIHZhX2xpc3QgYXJnc19mb3JfY291bnRpbmc7Cj4gPiArICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzOwo+ID4gKwo+ID4gKyAgICAgLyogTWFrZSBhIGNvcHkgYmVjYXVzZSBg
dnNucHJpbnRmYCBjb3VsZCBjaGFuZ2UgaXQgKi8KPiA+ICsgICAgIHZhX2NvcHkoYXJnc19mb3Jf
Y291bnRpbmcsIGFyZ3MpOwo+ID4gKwo+ID4gKyAgICAgLyogTmVlZCBzcGFjZSBmb3IgbnVsbCBi
eXRlLiAqLwo+ID4gKyAgICAgbGVuID0gdnNucHJpbnRmKE5VTEwsIDAsIGZtdCwgYXJnc19mb3Jf
Y291bnRpbmcpICsgMTsKPiA+ICsKPiA+ICsgICAgIHZhX2VuZChhcmdzX2Zvcl9jb3VudGluZyk7
Cj4gPiArCj4gPiArICAgICBmcmFnbWVudCA9IGttYWxsb2Moc2l6ZW9mKCpmcmFnbWVudCksIEdG
UF9LRVJORUwpOwo+ID4gKyAgICAgaWYgKCFmcmFnbWVudCkKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICBmcmFnbWVudC0+ZnJhZ21lbnQgPSBrbWFsbG9j
KGxlbiwgR0ZQX0tFUk5FTCk7Cj4KPiBUaGlzIGlzIGNvbmZ1c2luZy4gU2VlIGFib3ZlIGNvbW1l
bnQuCgpHb29kIHBvaW50LiBXaWxsIGZpeCBpbiB0aGUgbmV4dCByZXZpc2lvbi4KCjwgc25pcCA+
CgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
