Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772BCC5CD
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 00:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6546EC33;
	Fri,  4 Oct 2019 22:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381346EC33
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 22:27:21 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 23so4549889pgk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 15:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sGtC9Y61I0fWewzKpxnAs5yLawr9FrkTbXzFkx6uKAk=;
 b=b0szUtKr8jN+1N5lmCPtt2iyK4fNDUCFAFIiy3hAC6al1onAjhIK+LtpgtGd/Q/hPl
 MkbY4ixe1ePkJIV0NsFPUpupME0RzPPt/tVTIq3BIaqv5HvPJ131V6cGXqGaG87g1Zj1
 Fx5r/KDj7igxMZe6Zc9nSNB6Fb2nhrJWfaRCMLtNrXbmEWqE26y3aVH4zdhyCj+CFz1X
 1M6fqWqyljGD4Kwve6MH9VljS34dBmVd43xiNHOE6figwztaQ6GD/mQoKYtSXazSBjK6
 M1SJCpmrv9gF3Txzy0kIfbjQ2i+57r7G1bVJ5AZycJx11EJpNfkzDlRhIItsbZSHBPZV
 Kt/Q==
X-Gm-Message-State: APjAAAX4dA4igePolOHwKSK64xG0TDLQG6mwrdHFpSFgLDBURyucRDWA
 /exIcKYf8vIVdzuS00h+aFQBGg==
X-Google-Smtp-Source: APXvYqz9/Um6buAfhCtRCPjLYgne6gcH8Y83qWem0TWomrvMdMPDQueWyrF35KAweIvctX7qICTVOw==
X-Received: by 2002:a65:638a:: with SMTP id h10mr8380897pgv.106.1570228039982; 
 Fri, 04 Oct 2019 15:27:19 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id w7sm5066788pjn.1.2019.10.04.15.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 15:27:19 -0700 (PDT)
Date: Fri, 4 Oct 2019 15:27:14 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: shuah <shuah@kernel.org>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20191004222714.GA107737@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sGtC9Y61I0fWewzKpxnAs5yLawr9FrkTbXzFkx6uKAk=;
 b=YeeGuXR/EbMstIHwMR+WBpofOCJlBn7xcT75NgBfyAZoiHg/V1PWHpO2epGkRD81Ai
 4RW+gTAEC4WD2yQ2SDrd5K9D7fdDNSPo3UNYUZZ8Zf+ibkFAmTJbDVSYEarDpJ5oPg1j
 dg3dC2LmBlg/HcrMgqb9PfzfTOzDXYHOa+/PYROjQTT8qZENzhrzuulgnZ3jTVdd9CoS
 6vHXpukys6F6ZvGyvO/MC52uvNRRW1RrRmLnirND7BrQ4tM7+hSt8ILrukDjy2Zkorp5
 a2EePtRfrlsKmCyDjJa9T4B+oNHxvnazyX654xQc9H1YU9WC6Z9K9EsF5+8bMHzSZibS
 tMmA==
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
 linux-nvdimm <linux-nvdimm@lists.01.org>, khilman@baylibre.com,
 knut.omang@oracle.com, kieran.bingham@ideasonboard.com, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, logang@deltatee.com,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDM6NTk6MTBQTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4g
T24gMTAvNC8xOSAzOjQyIFBNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPiA+IE9uIEZyaSwgT2N0
IDQsIDIwMTkgYXQgMjozOSBQTSBUaGVvZG9yZSBZLiBUcydvIDx0eXRzb0BtaXQuZWR1PiB3cm90
ZToKPiA+ID4gCj4gPiA+IFRoaXMgcXVlc3Rpb24gaXMgcHJpbWFyaWx5IGRpcmVjdGVkIGF0IFNo
dWFoIGFuZCBMaW51cy4uLi4KPiA+ID4gCj4gPiA+IFdoYXQncyB0aGUgY3VycmVudCBzdGF0dXMg
b2YgdGhlIGt1bml0IHNlcmllcyBub3cgdGhhdCBCcmVuZGFuIGhhcwo+ID4gPiBtb3ZlZCBpdCBv
dXQgb2YgdGhlIHRvcC1sZXZlbCBrdW5pdCBkaXJlY3RvcnkgYXMgTGludXMgaGFzIHJlcXVlc3Rl
ZD8KPiA+IAo+IAo+IFRoZSBtb3ZlIGhhcHBlbmVkIHNtYWNrIGluIHRoZSBtaWRkbGUgb2YgbWVy
Z2Ugd2luZG93IGFuZCBsYW5kZWQgaW4KPiBsaW51eC1uZXh0IHRvd2FyZHMgdGhlIGVuZCBvZiB0
aGUgbWVyZ2Ugd2luZG93Lgo+IAo+ID4gV2Ugc2VlbWVkIHRvIGRlY2lkZSB0byBqdXN0IHdhaXQg
Zm9yIDUuNSwgYnV0IHRoZXJlIGlzIG5vdGhpbmcgdGhhdAo+ID4gbG9va3MgdG8gYmxvY2sgdGhh
dC4gQW5kIEkgZW5jb3VyYWdlZCBTaHVhaCB0byBmaW5kIG1vcmUga3VuaXQgY2FzZXMKPiA+IGZv
ciB3aGVuIGl0IF9kb2VzXyBnZXQgbWVyZ2VkLgo+ID4gCj4gCj4gUmlnaHQuIEkgY29tbXVuaWNh
dGVkIHRoYXQgdG8gQnJlbmRhbiB0aGF0IHdlIGNvdWxkIHdvcmsgb24gYWRkaW5nIG1vcmUKPiBr
dW5pdCBiYXNlZCB0ZXN0cyB3aGljaCB3b3VsZCBoZWxwIGdldCBtb3JlIG1pbGVhZ2Ugb24gdGhl
IGt1bml0Lgo+IAo+ID4gU28gaWYgdGhlIGt1bml0IGJyYW5jaCBpcyBzdGFibGUsIGFuZCBwZW9w
bGUgd2FudCB0byBzdGFydCB1c2luZyBpdAo+ID4gZm9yIHRoZWlyIHVuaXQgdGVzdHMsIHRoZW4g
SSB0aGluayB0aGF0IHdvdWxkIGJlIGEgZ29vZCBpZGVhLCBhbmQgdGhlbgo+ID4gZHVyaW5nIHRo
ZSA1LjUgbWVyZ2Ugd2luZG93IHdlJ2xsIG5vdCBqdXN0IGdldCB0aGUgaW5mcmFzdHJ1Y3R1cmUs
Cj4gPiB3ZSdsbCBnZXQgYSBmZXcgbW9yZSB1c2VycyB0b28gYW5kIG5vdCBqdXN0IGV4YW1wbGVz
LgoKSSB3YXMgcGxhbm5pbmcgb24gaG9sZGluZyBvZmYgb24gYWNjZXB0aW5nIG1vcmUgdGVzdHMv
Y2hhbmdlcyB1bnRpbApLVW5pdCBpcyBpbiB0b3J2YWxkcy9tYXN0ZXIuIEFzIG11Y2ggYXMgSSB3
b3VsZCBsaWtlIHRvIGdvIGFyb3VuZApwcm9tb3RpbmcgaXQsIEkgZG9uJ3QgcmVhbGx5IHdhbnQg
dG8gcHJvbW90ZSB0b28gbXVjaCBjb21wbGV4aXR5IGluIGEKbm9uLXVwc3RyZWFtIGJyYW5jaCBi
ZWZvcmUgZ2V0dGluZyBpdCB1cHN0cmVhbSBiZWNhdXNlIEkgZG9uJ3Qgd2FudCB0bwpyaXNrIGFk
ZGluZyBzb21ldGhpbmcgdGhhdCBtaWdodCBjYXVzZSBpdCB0byBnZXQgcmVqZWN0ZWQgYWdhaW4u
CgpUbyBiZSBjbGVhciwgSSBjYW4gdW5kZXJzdGFuZCBmcm9tIHlvdXIgcGVyc3BlY3RpdmUgd2h5
IGdldHRpbmcgbW9yZQp0ZXN0cy91c2FnZSBiZWZvcmUgYWNjZXB0aW5nIGl0IGlzIGEgZ29vZCB0
aGluZy4gVGhlIG1vcmUgcGVvcGxlIHRoYXQKcGxheSBhcm91bmQgd2l0aCBpdCwgdGhlIG1vcmUg
bGlrZWx5IHRoYXQgc29tZW9uZSB3aWxsIGZpbmQgYW4gaXNzdWUKd2l0aCBpdCwgYW5kIG1vcmUg
bGlrZWx5IHRoYXQgd2hhdCBpcyBhY2NlcHRlZCBpbnRvIHRvcnZhbGRzL21hc3RlciBpcwpvZiBo
aWdoIHF1YWxpdHkuCgpIb3dldmVyLCBpZiBJIGVuY291cmFnZSBhcmJpdHJhcnkgdGVzdHMvaW1w
cm92ZW1lbnRzIGludG8gbXkgS1VuaXQKYnJhbmNoLCBpdCBmdXJ0aGVyIGRpdmVyZ2VzIGF3YXkg
ZnJvbSB0b3J2YWxkcy9tYXN0ZXIsIGFuZCBpcyBtb3JlCmxpa2VseSB0aGF0IHRoZXJlIHdpbGwg
YmUgYSBtZXJnZSBjb25mbGljdCBvciBpc3N1ZSB0aGF0IGlzIG5vdCByZWxhdGVkCnRvIHRoZSBj
b3JlIEtVbml0IGNoYW5nZXMgdGhhdCB3aWxsIGNhdXNlIHRoZSB3aG9sZSB0aGluZyB0byBiZQpy
ZWplY3RlZCBhZ2FpbiBpbiB2NS41LgoKSSBkb24ndCBrbm93LiBJIGd1ZXNzIHdlIGNvdWxkIG1h
eWJlIGFkZHJlc3MgdGhhdCBzaXR1YXRpb24gYnkgc3BsaXR0aW5nCnVwIHRoZSBwdWxsIHJlcXVl
c3QgaW50byBmZWF0dXJlcyBhbmQgdGVzdHMgd2hlbiB3ZSBnbyB0byBzZW5kIGl0IGluLApidXQg
dGhhdCBzZWVtcyB0byBpbnZpdGUgYSBsb3Qgb2YgdW5uZWNlc3NhcnkgY29tcGxleGl0eS4gSSBh
Y3R1YWxseQphbHJlYWR5IGhhZCBzb21lIG90aGVyIHRlc3RzL2NoYW5nZXMgcmVhZHkgdG8gc2Vu
ZCBmb3IgcmV2aWV3LCBidXQgd2FzCmhvbGRpbmcgb2ZmIHVudGlsIHRoZSBpbml0aWFsIHNldCBv
ZiBwYXRjaGVzIG1hZCBpdCBpbi4KCkxvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIG90aGVyIHBl
b3BsZSdzIHRob3VnaHRzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
