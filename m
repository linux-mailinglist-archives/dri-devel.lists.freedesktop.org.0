Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00F1CEBD
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 20:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6203E8930E;
	Tue, 14 May 2019 18:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD148930E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 18:12:40 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z16so9003253pgv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 11:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N4UQ8E37RD8PM/SrG8N/O0bEDGjz00r1+gSc2WyT1f4=;
 b=M63o3cR/y6wdqoZt70gedvjVfUSgijTfyrQ2Wqeov3BI29SF8guQk39JA3hhaPDWoJ
 KJR5cShepsSg2ZWFd+psrV/pCmFu3IYUJtrNEIgHdzCPfrE8FvBLcnmKUm9Z0JdWp/y9
 +nvP4a2QXVCJjBA8Phi5lqGAEesR8Hp6zqEpw5r1CxUQiNppvzXimnV2FVVQBxxatEcq
 3bzu7gNVgt2Y1EHUSB6AibDHVwMHmUYIvncZn8mW4XIMF9T+g8cel1ZwPs7Qi52C+KOw
 v+iP85cynQ6Z/pG3ZFfEa365whPlYaDSglIuYZtpuDzUD3vLUY1bux6nm3TxGCfHa12u
 jZuw==
X-Gm-Message-State: APjAAAWE7QZTl2Ocg+HYAIZts1m7kRS98s9FGTtCR56ErVjbzMgtfxKg
 wQ7oG4qg43Ov/GA18jKXZV03HA==
X-Google-Smtp-Source: APXvYqzF1W3MvAqglRw1f3U3GzCogO4oDzfR+rvBgcAvxH3aiWBoZY2un6t4j9IVvIzAxmzzun0V4w==
X-Received: by 2002:a62:d244:: with SMTP id c65mr3681839pfg.173.1557857559066; 
 Tue, 14 May 2019 11:12:39 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id w189sm22611956pfw.147.2019.05.14.11.12.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 11:12:38 -0700 (PDT)
Date: Tue, 14 May 2019 11:12:33 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Message-ID: <20190514181233.GB109557@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
 <20190514065643.GC2589@hirez.programming.kicks-ass.net>
 <20190514081223.GA230665@google.com>
 <20190514084655.GK2589@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514084655.GK2589@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N4UQ8E37RD8PM/SrG8N/O0bEDGjz00r1+gSc2WyT1f4=;
 b=Do+8Q+pHF8OB+tlzSEbCAlPOY5hObzGGmcvPm0YH3pOm8OWb+2EG6k/+3FX9ODnKET
 HeeejJJzGaiMQRAOmVbGKQQo9GMUp77yZaFJ+oq5A5++UZ2bqGz1eozejMrClIviWLaH
 6NqHaVQChwYnFjxvjCGyJrQCTbtCzP1YDVjWmeDvwiekfu/CIsr1rAo7eeV2cOghCM3s
 jg1XfDoXavpa+8h5sP6zhUgTkyTdA3gv3smrtEjkWIEZtUEMHzNqwHjzR4ACtYGyLA5t
 PjdZhQFtOg524SURCKg00duz4q2SfEaie9Z/aI0bjh6oNPjygJN8c7oYJhw88kmkUhL7
 hq9A==
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6NDY6NTVBTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDE6MTI6MjNBTSAtMDcwMCwgQnJlbmRh
biBIaWdnaW5zIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDg6NTY6NDNBTSAr
MDIwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0
IDEwOjQyOjQyUE0gLTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gPiBUaGlzIGZp
eGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBzZWVuIG9uIEdDQyA3LjM6Cj4gPiA+ID4gICBrdW5p
dC90ZXN0LXRlc3Qubzogd2FybmluZzogb2JqdG9vbDoga3VuaXRfdGVzdF91bnN1Y2Nlc3NmdWxf
dHJ5KCkgZmFsbHMgdGhyb3VnaCB0byBuZXh0IGZ1bmN0aW9uIGt1bml0X3Rlc3RfY2F0Y2goKQo+
ID4gPiA+IAo+ID4gPiAKPiA+ID4gV2hhdCBpcyB0aGF0IGZpbGUgYW5kIGZ1bmN0aW9uOyBubyBr
ZXJuZWwgdHJlZSBuZWFyIG1lIHNlZW1zIHRvIGhhdmUKPiA+ID4gdGhhdC4KPiA+IAo+ID4gT2gs
IHNvcnJ5IGFib3V0IHRoYXQuIFRoZSBmdW5jdGlvbiBpcyBhZGRlZCBpbiB0aGUgZm9sbG93aW5n
IHBhdGNoLAo+ID4gIltQQVRDSCB2MyAwOS8xOF0ga3VuaXQ6IHRlc3Q6IGFkZCBzdXBwb3J0IGZv
ciB0ZXN0IGFib3J0IlsxXS4KPiA+IAo+ID4gTXkgYXBvbG9naWVzIGlmIHRoaXMgcGF0Y2ggaXMg
c3VwcG9zZWQgdG8gY29tZSBhZnRlciBpdCBpbiBzZXF1ZW5jZSwgYnV0Cj4gPiBJIGFzc3VtZWQg
aXQgc2hvdWxkIGNvbWUgYmVmb3JlIG90aGVyd2lzZSBvYmp0b29sIHdvdWxkIGNvbXBsYWluIGFi
b3V0Cj4gPiB0aGUgc3ltYm9sIHdoZW4gaXQgaXMgaW50cm9kdWNlZC4KPiAKPiBPciBzZW5kIG1l
IGFsbCBwYXRjaGVzIHN1Y2ggdGhhdCBJIGhhdmUgY29udGV4dCwgb3IgaGF2ZSBhIHNhbmUKPiBD
aGFuZ2Vsb2cgdGhhdCBnaXZlcyBtZSBjb250ZXh0LiBKdXN0IGRvbid0IGdpdmUgbWUgb25lIHBh
dGNoIHdpdGggYQo+IGNyYXBweSBjaGFuZ2Vsb2cuCgpJIHdpbGwgcHJvdmlkZSBtb3JlIGNvbnRl
eHQgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpTb3JyeSBhYm91dCB0aGF0IQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
