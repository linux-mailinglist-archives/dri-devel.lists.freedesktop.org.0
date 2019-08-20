Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5796B6C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 23:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C9C6E890;
	Tue, 20 Aug 2019 21:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C506E890
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 21:26:44 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w2so4148806pfi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 14:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kfF4vdGcFJm/Wf6JQ1wcuplxthXZW1HNbOa1JyPqpZg=;
 b=USOWI68e3F4uC0/+c5gr6SFUPlIdcmD73QTnBqHJVgK+ZvF/J6pRtKtKNJ98M2AAlQ
 /SBIe/m2PQMC9hKZiTgnsCQdPaA/2Piei92D+m4aezsfY5owGpbGfvyrnNmZSSC6mZ2H
 pp31OZp9hGTv84muISu3OcR2/m6MRB4i71tBcfssv4sA5IZPHVo4yC7SRdZFAMUQhS74
 5JpA8ZHm0sDNHzS7ayKYKsLCpNzQqwJXCL8sRIGLm6MDG6OmNhl/baBd3Jgd2MhJhZIl
 MC6hXKWuw/PhuRRFkkzCXWnHL/GzKCN9FIr0fwbcIbagpGy+7Gye7PEIY7aFU9mFmaXr
 exRw==
X-Gm-Message-State: APjAAAVPCGEGTuFgeFZkueykDIgh/R2LItpuddSxW82b8vRF4HyM7Eca
 YM9CC1cUnWI0DH3kwyi6a6/KJylOKUaDWXSaNyiscg==
X-Google-Smtp-Source: APXvYqzLsasEUUNlQqQQsMBDlcH+Tp5YqnFlWE8k2udTHXgEapZH91qiWX0NVeTeH8163H7ZgTGtPG9Wj/vODuCC5PA=
X-Received: by 2002:aa7:8f2e:: with SMTP id y14mr32322000pfr.113.1566336403144; 
 Tue, 20 Aug 2019 14:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
 <20190820182450.GA38078@google.com>
 <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
In-Reply-To: <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 20 Aug 2019 14:26:32 -0700
Message-ID: <CAFd5g44JT_KQ+OxjVdG0qMWuaEB0Zq5x=r6tLsqJdncwZ_zbGA@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kfF4vdGcFJm/Wf6JQ1wcuplxthXZW1HNbOa1JyPqpZg=;
 b=YezYmx2WChZMi1DRr1XoN8XfZITumH+PgqY3JQdS5w4u2vwKLbtcH66ah2vjoQnnog
 QyUxcFY+vLpiQeDhK9KTH5U7uOLNo0vnuD4a52N1MJjkiOZI294BDWFVvwrEEKdhPBaO
 XVT2+i53gVsOodGBAl0E+xI0gCcD/lVNo3bqvB93NFaE/xG/irV6qGiYAx5Sa0TgkhIz
 Derb91GymDQKbZ5lMgnZKtNSZMjrGXdFpCsjUGQOYWWslojKah3JT/incq30S9xuCblQ
 rssihHZxJUKUKjpEGuvFLm+OHFk0eFFOuKdMDTyPyJe4rypnj3lPr/tiL1vR+LS2dnzq
 EaFQ==
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTI6MDggUE0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Cj4gT24gOC8yMC8xOSAxMjoyNCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
ID4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6MjQ6NDVBTSAtMDYwMCwgc2h1YWggd3JvdGU6
Cj4gPj4gT24gOC8xMy8xOSAxMTo1MCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4+PiAj
IyBUTDtEUgo+ID4+Pgo+ID4+PiBUaGlzIHJldmlzaW9uIGFkZHJlc3NlcyBjb21tZW50cyBmcm9t
IFN0ZXBoZW4gYW5kIEJqb3JuIEhlbGdhYXMuIE1vc3QKPiA+Pj4gY2hhbmdlcyBhcmUgcHJldHR5
IG1pbm9yIHN0dWZmIHRoYXQgZG9lc24ndCBhZmZlY3QgdGhlIEFQSSBpbiBhbnl3YXkuCj4gPj4+
IE9uZSBzaWduaWZpY2FudCBjaGFuZ2UsIGhvd2V2ZXIsIGlzIHRoYXQgSSBhZGRlZCBzdXBwb3J0
IGZvciBmcmVlaW5nCj4gPj4+IGt1bml0X3Jlc291cmNlIG1hbmFnZWQgcmVzb3VyY2VzIGJlZm9y
ZSB0aGUgdGVzdCBjYXNlIGlzIGZpbmlzaGVkIHZpYQo+ID4+PiBrdW5pdF9yZXNvdXJjZV9kZXN0
cm95KCkuIEFkZGl0aW9uYWxseSwgQmpvcm4gcG9pbnRlZCBvdXQgdGhhdCBJIGJyb2tlCj4gPj4+
IEtVbml0IG9uIGNlcnRhaW4gY29uZmlndXJhdGlvbnMgKGxpa2UgdGhlIGRlZmF1bHQgb25lIGZv
ciB4ODYsIHdob29wcykuCj4gPj4+Cj4gPj4+IEJhc2VkIG9uIFN0ZXBoZW4ncyBmZWVkYmFjayBv
biB0aGUgcHJldmlvdXMgY2hhbmdlLCBJIHRoaW5rIHdlIGFyZQo+ID4+PiBwcmV0dHkgY2xvc2Uu
IEkgYW0gbm90IGV4cGVjdGluZyBhbnkgc2lnbmlmaWNhbnQgY2hhbmdlcyBmcm9tIGhlcmUgb24K
PiA+Pj4gb3V0Lgo+ID4+Pgo+ID4+Cj4gPj4gSGkgQnJlbmRhbiwKPiA+Pgo+ID4+IEkgZm91bmQg
Y2hlY2twYXRjaCBlcnJvcnMgaW4gb25lIG9yIHR3byBwYXRjaGVzLiBDYW4geW91IGZpeCB0aG9z
ZSBhbmQKPiA+PiBzZW5kIHYxNC4KPiA+Cj4gPiBIaSBTaHVhaCwKPiA+Cj4gPiBBcmUgeW91IHJl
ZmVyaW5nIHRvIHRoZSBmb2xsb3dpbmcgZXJyb3JzPwo+ID4KPiA+IEVSUk9SOiBNYWNyb3Mgd2l0
aCBjb21wbGV4IHZhbHVlcyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gcGFyZW50aGVzZXMKPiA+ICMx
NDQ6IEZJTEU6IGluY2x1ZGUva3VuaXQvdGVzdC5oOjQ1NjoKPiA+ICsjZGVmaW5lIEtVTklUX0JJ
TkFSWV9DTEFTUyBcCj4gPiArICAgICAgIGt1bml0X2JpbmFyeV9hc3NlcnQsIEtVTklUX0lOSVRf
QklOQVJZX0FTU0VSVF9TVFJVQ1QKPiA+Cj4gPiBFUlJPUjogTWFjcm9zIHdpdGggY29tcGxleCB2
YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVudGhlc2VzCj4gPiAjMTQ2OiBGSUxFOiBp
bmNsdWRlL2t1bml0L3Rlc3QuaDo0NTg6Cj4gPiArI2RlZmluZSBLVU5JVF9CSU5BUllfUFRSX0NM
QVNTIFwKPiA+ICsgICAgICAga3VuaXRfYmluYXJ5X3B0cl9hc3NlcnQsIEtVTklUX0lOSVRfQklO
QVJZX1BUUl9BU1NFUlRfU1RSVUNUCj4gPgo+ID4gVGhlc2UgdmFsdWVzIHNob3VsZCAqbm90KiBi
ZSBpbiBwYXJlbnRoZXNlcy4gSSBhbSBndWVzc2luZyBjaGVja3BhdGNoIGlzCj4gPiBnZXR0aW5n
IGNvbmZ1c2VkIGFuZCB0aGlua3MgdGhhdCB0aGVzZSBhcmUgY29tcGxleCBleHByZXNzaW9ucywg
d2hlbgo+ID4gdGhleSBhcmUgbm90Lgo+ID4KPiA+IEkgaWdub3JlZCB0aGUgZXJyb3JzIHNpbmNl
IEkgZmlndXJlZCBjaGVja3BhdGNoIHdhcyBjb21wbGFpbmluZwo+ID4gZXJyb25lb3VzbHkuCj4g
Pgo+ID4gSSBjb3VsZCByZWZhY3RvciB0aGUgY29kZSB0byByZW1vdmUgdGhlc2UgbWFjcm9zIGVu
dGlyZWx5LCBidXQgSSB0aGluawo+ID4gdGhlIGNvZGUgaXMgY2xlYW5lciB3aXRoIHRoZW0uCj4g
Pgo+Cj4gUGxlYXNlIGRvLiBJIGFtIG5vdCB2ZXJ1IHN1cmUgd2hhdCB2YWx1ZSB0aGVzZSBtYWNy
b3MgYWRkLgoKQWxyaWdodCwgSSB3aWxsIGhhdmUgc29tZXRoaW5nIGZvciB5b3UgbGF0ZXIgdG9k
YXkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
