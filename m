Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909CE8FAD3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 08:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B42E6EADA;
	Fri, 16 Aug 2019 06:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7266EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 06:21:08 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a127so4078262oii.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 23:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnzSBHY/JdeQAgbtdAEAW270/fKb4r8flWE61wbC5Lo=;
 b=cIMl47XkkLZjlJLvfBlS6H+K2214ptTv9BbqoOVOar0sHYPZjo79klhvnNxv0FFHHw
 wlnQ/fFj4yuAJLOJYkgHU+Rhj7qMmFmeE388A9X7kOFDkTqAsiFG4mzM3CRhrho0YhrO
 o2V75uh2ru6iGy0U5udZhM4CqpAnS0SlX1EzuMpnaoHsuyRjhCAX+jawHnzA2kuc1d7/
 UqgKopg3A/wc4BzQIz4Qio8zThXMGl4FeYaI7/gRjoCG+1u1qB9vunyvzi3TmiIDUj01
 YIRUjdPc5Ljlkyy10V/IYIHdd3ZgNLhDdwIVneSdrfIphOb1cuDLVA0L+K1fZh2C1jwJ
 /ccA==
X-Gm-Message-State: APjAAAXwjbFjWUYPFyzbnm3Cg6AE91ezuswF1r2enN5vc7U++/qabCEZ
 yQe0Mm2UkCwGf12+AQvrRxXqNd+stLPRHEIAq0LFRQ==
X-Google-Smtp-Source: APXvYqzph7HTCPvGlJkLaGSjiEYiCfosASP1QBmSLU+nI/ANvScaJ5s0IeM0Q21xXCjaiRcxA2KwuJ63i1nnQocpq20=
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr4149187oia.128.1565936467928; 
 Thu, 15 Aug 2019 23:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz> <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz> <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
 <20190816010036.GA9915@ziepe.ca>
In-Reply-To: <20190816010036.GA9915@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Aug 2019 08:20:55 +0200
Message-ID: <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bnzSBHY/JdeQAgbtdAEAW270/fKb4r8flWE61wbC5Lo=;
 b=UVlNUshcEIlU+yobZlz2y42/ujMlRlo+ct+0p80oBP1RIOLjVgza5yLAH9kiWJ0ywH
 rn5w4IcTB48oHSkKlTlUwiOfhTg79xGXAcMQPEun+qGn+KaPE/v6hTzroIHT9rozR67E
 6n0mNYDqP9fJbFBUtd9FG2uXYDGCCqC+daSJ0=
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMzowMCBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6NDk6MzFQTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEwOjI3IFBN
IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4gT24gVGh1LCBBdWcg
MTUsIDIwMTkgYXQgMTA6MTY6NDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4g
PiBTbyBpZiBzb21lb25lIGNhbiBleHBsYWluIHRvIG1lIGhvdyB0aGF0IHdvcmtzIHdpdGggbG9j
a2RlcCBJIGNhbiBvZgo+ID4gPiA+IGNvdXJzZSBpbXBsZW1lbnQgaXQuIEJ1dCBhZmFpY3MgdGhh
dCBkb2Vzbid0IGV4aXN0IChJIHRyaWVkIHRvIGV4cGxhaW4KPiA+ID4gPiB0aGF0IHNvbWV3aGVy
ZSBlbHNlIGFscmVhZHkpLCBhbmQgSSdtIG5vIHJlYWxseSBsb29raW5nIGZvcndhcmQgdG8KPiA+
ID4gPiBoYWNraW5nIGFsc28gb24gbG9ja2RlcCBmb3IgdGhpcyBsaXR0bGUgc2VyaWVzLgo+ID4g
Pgo+ID4gPiBIbW0sIGtpbmQgb2YgbG9va3MgbGlrZSBpdCBpcyBkb25lIGJ5IGNhbGxpbmcgcHJl
ZW1wdF9kaXNhYmxlKCkKPiA+Cj4gPiBZdXAuIFRoYXQgd2FzIHYxLCB0aGVuIGNhbWUgdGhlIHN1
Z2dlc3Rpb24gdGhhdCBkaXNhYmxpbmcgcHJlZW1wdGlvbgo+ID4gaXMgbWF5YmUgbm90IHRoZSBi
ZXN0IHRoaW5nICh0aGUgb29tIHJlYXBlciBjb3VsZCBzdGlsbCBydW4gZm9yIGEgbG9uZwo+ID4g
dGltZSBjb21wYXJhdGl2ZWx5LCBpZiBpdCdzIGNsZWFuaW5nIG91dCBnaWdhYnl0ZXMgb2YgcHJv
Y2VzcyBtZW1vcnkKPiA+IG9yIHdoYXQgbm90LCBoZW5jZSB0aGlzIGRlZGljYXRlZCBkZWJ1ZyBp
bmZyYXN0cnVjdHVyZSkuCj4KPiBPaCwgSSdtIGNvbWluZyBpbiBsYXRlLCBzb3JyeQo+Cj4gQW55
aG93LCBJIHdhcyB0aGlua2luZyBzaW5jZSB3ZSBhZ3JlZWQgdGhpcyBjYW4gdHJpZ2dlciBvbiBz
b21lCj4gQ09ORklHX0RFQlVHIGZsYWcsIHNvbWV0aGluZyBsaWtlCj4KPiAgICAgLyogVGhpcyBp
cyBhIHNsZWVwYWJsZSByZWdpb24sIGJ1dCB1c2UgcHJlZW1wdF9kaXNhYmxlIHRvIGdldCBkZWJ1
Z2dpbmcKPiAgICAgICogZm9yIGNhbGxzIHRoYXQgYXJlIG5vdCBhbGxvd2VkIHRvIGJsb2NrIGZv
ciBPT00gWy4uIGluc2VydAo+ICAgICAgKiBNaWNoYWwncyBleHBsYW5hdGlvbi4uIF0gKi8KPiAg
ICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUCkgJiYgIW1tdV9ub3Rp
Zmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQo+ICAgICAgICAgcHJlZW1wdF9kaXNhYmxlKCk7
Cj4gICAgIG9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpOwoKSSB0aGluayB3ZSBhbHNvIGRp
c2N1c3NlZCB0aGF0LCBhbmQgc29tZSBleHByZXNzZWQgY29uY2VybnMgaXQgd291bGQKY2hhbmdl
IGJlaGF2aW91ci90aW1pbmcgdG9vIG11Y2ggZm9yIHRlc3RpbmcuIFNpbmNlIHRoaXMgZG9lcyBk
b2VzCmRpc2FibGUgcHJlZW1wdGlvbiBmb3IgcmVhbCwgbm90IGp1c3QgZm9yIG1pZ2h0X3NsZWVw
LgoKPiBBbmQgSSBoYXZlIGFsc28gYmVlbiBpZGx5IG11bGxpbmcgZG9pbmcgc29tZXRoaW5nIGxp
a2UKPgo+ICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19ERUJVR19OT1RJRklFUlMpICYmCj4gICAg
ICAgIHJhbmQgJiYKPiAgICAgICAgbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkp
IHsKPiAgICAgIHJhbmdlLT5mbGFncyA9IDAKPiAgICAgIGlmICghb3BzLT5pbnZhbGlkYXRlX3Jh
bmdlX3N0YXJ0KHJhbmdlKSkKPiAgICAgICAgIGNvbnRpbnVlCj4KPiAgICAgIC8vIEZhaWxlZCwg
dHJ5IGFnYWluIGFzIGJsb2NrYWJsZQo+ICAgICAgcmFuZ2UtPmZsYWdzID0gTU1VX05PVElGSUVS
X1JBTkdFX0JMT0NLQUJMRQo+ICAgIH0KPiAgICBvcHMtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQo
cmFuZ2UpOwo+Cj4gV2hpY2ggd291bGQgZ2l2ZSBjb3ZlcmFnZSBmb3IgdGhpcyBjb3JuZXIgY2Fz
ZSB3aXRob3V0IGZvcmNpbmcgT09NLgoKSG0sIHRoaXMgc291bmRzIGxpa2UgYSBuZWF0IGlkZWEg
dG8gc2xhcCBvbiB0b3AuIFRoZSByYW5kIGlzIGdvaW5nIHRvCmJlIGEgYml0IHRyaWNreSB0aG91
Z2gsIGJ1dCBJIGd1ZXNzIGZvciB0aGlzIHdlIGNvdWxkIHN0dWZmIGFub3RoZXIKY291bnRlciBp
bnRvIHRhc2tfc3RydWN0IGFuZCBqdXN0IGUuZy4gZG8gdGhpcyBldmVyeSAxMDAwdGggb3Igc28K
aW52YWxpZGF0ZSAod2VsbCBuZWVkIHRvIHBpY2sgYSBwcmltZSBzbyB3ZSBjeWNsZSB0aHJvdWdo
IG5vdGlmaWVycyBpbgpjYXNlIHRoZXJlJ3MgbXVsdGlwbGUpLiBJIGxpa2UuCgpNaWNoYWwsIHRo
b3VnaHRzPwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
