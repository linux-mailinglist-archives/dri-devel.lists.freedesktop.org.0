Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEB1C544
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 10:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E2389338;
	Tue, 14 May 2019 08:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD8B89338
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 08:48:15 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQT5N-0006we-E6; Tue, 14 May 2019 08:46:57 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 662E32029FD7A; Tue, 14 May 2019 10:46:55 +0200 (CEST)
Date: Tue, 14 May 2019 10:46:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Message-ID: <20190514084655.GK2589@hirez.programming.kicks-ass.net>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
 <20190514065643.GC2589@hirez.programming.kicks-ass.net>
 <20190514081223.GA230665@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514081223.GA230665@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6D6XPiWXHxqHbgGlzUb4e9FTkb9mj+8eXq8zwFhMaYI=; b=gQyJ4Bn+wwRdSW9t/2bWSVmyc
 AwkGokt1sRtEs0MFOzfvXdxNauIujIkO6DiCAA3SOTN0UFbrDi+SLIZripyW+aGfpCexFCP0BzvAH
 IlYP9j/H30eFgvgo9ZkFb3AKPBLsupHh7y68WZsbeVhh54K9lwJtSLIvcIDJS1VEaRQGKi/fVSfGS
 48zJdBoc3DzvL/pKKac0qDcALZBmcyi0ZeXu7FkhM4YyodyeuMGqq3ZAdBYQrpl3nrJxsVTrtSutJ
 0YkFNQHEEV1TPeoT3CoGRRj7cYr67v35O8QkZL1uGCglGPoJ5gpayGhWwv0+XlAiPH89k4GZ/Z81C
 usWzVhhCw==;
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org,
 kbuild test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr,
 Josh Poimboeuf <jpoimboe@redhat.com>, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDE6MTI6MjNBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDA4OjU2OjQzQU0gKzAyMDAsIFBldGVy
IFppamxzdHJhIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTA6NDI6NDJQTSAt
MDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dp
bmcgd2FybmluZyBzZWVuIG9uIEdDQyA3LjM6Cj4gPiA+ICAga3VuaXQvdGVzdC10ZXN0Lm86IHdh
cm5pbmc6IG9ianRvb2w6IGt1bml0X3Rlc3RfdW5zdWNjZXNzZnVsX3RyeSgpIGZhbGxzIHRocm91
Z2ggdG8gbmV4dCBmdW5jdGlvbiBrdW5pdF90ZXN0X2NhdGNoKCkKPiA+ID4gCj4gPiAKPiA+IFdo
YXQgaXMgdGhhdCBmaWxlIGFuZCBmdW5jdGlvbjsgbm8ga2VybmVsIHRyZWUgbmVhciBtZSBzZWVt
cyB0byBoYXZlCj4gPiB0aGF0Lgo+IAo+IE9oLCBzb3JyeSBhYm91dCB0aGF0LiBUaGUgZnVuY3Rp
b24gaXMgYWRkZWQgaW4gdGhlIGZvbGxvd2luZyBwYXRjaCwKPiAiW1BBVENIIHYzIDA5LzE4XSBr
dW5pdDogdGVzdDogYWRkIHN1cHBvcnQgZm9yIHRlc3QgYWJvcnQiWzFdLgo+IAo+IE15IGFwb2xv
Z2llcyBpZiB0aGlzIHBhdGNoIGlzIHN1cHBvc2VkIHRvIGNvbWUgYWZ0ZXIgaXQgaW4gc2VxdWVu
Y2UsIGJ1dAo+IEkgYXNzdW1lZCBpdCBzaG91bGQgY29tZSBiZWZvcmUgb3RoZXJ3aXNlIG9ianRv
b2wgd291bGQgY29tcGxhaW4gYWJvdXQKPiB0aGUgc3ltYm9sIHdoZW4gaXQgaXMgaW50cm9kdWNl
ZC4KCk9yIHNlbmQgbWUgYWxsIHBhdGNoZXMgc3VjaCB0aGF0IEkgaGF2ZSBjb250ZXh0LCBvciBo
YXZlIGEgc2FuZQpDaGFuZ2Vsb2cgdGhhdCBnaXZlcyBtZSBjb250ZXh0LiBKdXN0IGRvbid0IGdp
dmUgbWUgb25lIHBhdGNoIHdpdGggYQpjcmFwcHkgY2hhbmdlbG9nLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
