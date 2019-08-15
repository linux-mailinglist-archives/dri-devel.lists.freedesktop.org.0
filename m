Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E5691159
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73D56E9F2;
	Sat, 17 Aug 2019 15:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5366E9EA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 18:02:01 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m2so2499946qki.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BnI8+uYTBZJKnMRavU1hA2TnI4rNr0e2aXC8LBXC9rk=;
 b=p5Dl+Gb0Kw3CdY4973YjzF1MB6BjLMoFnQ6VFaSZo4bxhN95tPmeai8ehT3q4tazZQ
 vxbQj31tFGy3oGlqeGqNCXuvRT5v6k9JgZvRxKfQDoJLLyZZ9sGlgqmDF5dW7aEEaWDI
 rjBUCGsKUpN+kq9qwo92yoD9gAH26UTcmPlRqvB5cgtT4K/xczTacWpNV+BF77W67ZmR
 M1GPvrgk3Qq64ORxbKJihWD19HWW+pcR+zaGtqr+Th/2UY14o7+DFWf8TRNlRjpOL3lq
 618BLCV0ddWbdxLWwoxgUVPmUnkD1UGgw7/CD21NvkzZJjMdie+DbgotBsX3ZVfumuTv
 IbnQ==
X-Gm-Message-State: APjAAAWcWfyS0bo3vlQ9fPDYCNrbu0Zr9/ohJ/x4bpULHKqSQ5iworra
 auLbMbVdFZ7sAHz/xRSXXG+Cbw==
X-Google-Smtp-Source: APXvYqzUY9aELsjIwCbnfSumedqkjr92TBjXJsVE8TgDEc+tCA2CiEijqX4gn5MCyrtpQlRHD8QVUw==
X-Received: by 2002:a37:311:: with SMTP id 17mr4904431qkd.466.1565892120753;
 Thu, 15 Aug 2019 11:02:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id p126sm2042871qkc.84.2019.08.15.11.02.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 11:02:00 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyK4V-0007BP-Uc; Thu, 15 Aug 2019 15:01:59 -0300
Date: Thu, 15 Aug 2019 15:01:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815180159.GO21596@ziepe.ca>
References: <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
 <CAKMK7uG33FFCGJrDV4-FHT2FWi+Z5SnQ7hoyBQd4hignzm1C-A@mail.gmail.com>
 <20190815173557.GN21596@ziepe.ca>
 <20190815173922.GH30916@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815173922.GH30916@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BnI8+uYTBZJKnMRavU1hA2TnI4rNr0e2aXC8LBXC9rk=;
 b=BGaLtEn0xYdBTNlc96MSvc0pra1wpogvEbh9GdU2lucZLzHp357V0Gu4O4fnG6AOf2
 BybrSFZaeZEzYMjh/IoUujmDgJd5IpCUR3tMstVXWjLAycVo9JtMa+b7MtCAS3YLD4Pd
 dgFmBtsLGh7Dhx4A4xWk9JocKdxSNpTPeGr8QLfny4yWKeB/twiqSr+/O8137DgtxKMx
 Jl9VLmWm8wQswZBqORI5f4rKt93iNPd/i6wk0e2H0oUug4hUvei5Afb61IF1snBw6wXa
 nsMBUVu57cjgGfgQB8mcQJtzDfAZ+xarKGUIbjN5S3r8JHADl8l+z4uWQ7PDRLewWs2y
 zxrg==
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDE6Mzk6MjJQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwMjozNTo1N1BNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNjoyNToxNlBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gCj4gPiA+IEknbSBub3QgcmVhbGx5IHdlbGwg
dmVyc2VkIGluIHRoZSBkZXRhaWxzIG9mIG91ciB1c2VycHRyLCBidXQgYm90aAo+ID4gPiBhbWRn
cHUgYW5kIGk5MTUgd2FpdCBmb3IgdGhlIGdwdSB0byBjb21wbGV0ZSBmcm9tCj4gPiA+IGludmFs
aWRhdGVfcmFuZ2Vfc3RhcnQuIEplcm9tZSBoYXMgYXQgbGVhc3QgbG9va2VkIGEgbG90IGF0IHRo
ZSBhbWRncHUKPiA+ID4gb25lLCBzbyBtYXliZSBoZSBjYW4gZXhwbGFpbiB3aGF0IGV4YWN0bHkg
aXQgaXMgd2UncmUgZG9pbmcgLi4uCj4gPiAKPiA+IGFtZGdwdSBpcyAod3JvbmdseSkgdXNpbmcg
aG1tIGZvciBzb21ldGhpbmcsIEkgY2FuJ3QgcmVhbGx5IHRlbGwgd2hhdAo+ID4gaXQgaXMgdHJ5
aW5nIHRvIGRvLiBUaGUgY2FsbHMgdG8gZG1hX2ZlbmNlIHVuZGVyIHRoZQo+ID4gaW52YWxpZGF0
ZV9yYW5nZV9zdGFydCBkbyBub3QgZ2l2ZSBtZSBhIGdvb2QgZmVlbGluZy4KPiA+IAo+ID4gSG93
ZXZlciwgaTkxNSBzaG93cyBhbGwgdGhlIHNpZ25zIG9mIHRyeWluZyB0byBmb2xsb3cgdGhlIHJl
Z2lzdHJhdGlvbgo+ID4gY2FjaGUgbW9kZWwsIGl0IGV2ZW4gaGFzIGEgbmljZSBjb21tZW50IGlu
Cj4gPiBpOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcygpIGV4cGxhaW5pbmcgdGhhdCB0aGUgcmFj
ZXMgaXQgaGFzIGRvbid0Cj4gPiBtYXR0ZXIgYmVjYXVzZSBpdCBpcyBhIHVzZXIgc3BhY2UgYnVn
IHRvIGNoYW5nZSB0aGUgVkEgbWFwcGluZyBpbiB0aGUKPiA+IGZpcnN0IHBsYWNlLiBUaGF0IGp1
c3Qgc2NyZWFtcyByZWdpc3RyYXRpb24gY2FjaGUgdG8gbWUuCj4gPiAKPiA+IFNvIGl0IGlzIGZp
bmUgdG8gcnVuIEhXIHRoYXQgd2F5LCBidXQgaWYgeW91IGRvLCB0aGVyZSBpcyBubyByZWFzb24g
dG8KPiA+IGZlbmNlIGluc2lkZSB0aGUgaW52YWxpZGF0ZV9yYW5nZSBlbmQuIEp1c3Qgb3JwaGFu
IHRoZSBETUEgYnVmZmVyIGFuZAo+ID4gY2xlYW4gaXQgdXAgJiByZWxlYXNlIHRoZSBwYWdlIHBp
bnMgd2hlbiBhbGwgRE1BIGJ1ZmZlciByZWZzIGdvIHRvCj4gPiB6ZXJvLiBUaGUgbmV4dCBhY2Nl
c3MgdG8gdGhhdCBWQSBzaG91bGQgZ2V0IGEgbmV3IERNQSBidWZmZXIgd2l0aCB0aGUKPiA+IHJp
Z2h0IG1hcHBpbmcuCj4gPiAKPiA+IEluIG90aGVyIHdvcmRzIHRoZSBpbnZhbGlkYXRpb24gc2hv
dWxkIGJlIHZlcnkgc2ltcGxlIHdpdGhvdXQKPiA+IGNvbXBsaWNhdGVkIGxvY2tpbmcsIG9yIHdh
aXRfZXZlbnQncy4gTG9vayBhdCBoZmkxIGZvciBleGFtcGxlLgo+IAo+IFRoaXMgd291bGQgYnJl
YWsgdGhlIHRvZGF5IHVzYWdlIG1vZGVsIG9mIHVwdHIgYW5kIGl0IHdpbGwKPiBicmVhayB1c2Vy
c3BhY2UgZXhwZWN0YXRpb24gaWUgaWYgR1BVIGlzIHdyaXR0aW5nIHRvIHRoYXQKPiBtZW1vcnkg
YW5kIHRoYXQgbWVtb3J5IHRoZW4gdGhlIHVzZXJzcGFjZSB3YW50IHRvIG1ha2Ugc3VyZQo+IHRo
YXQgaXQgd2lsbCBzZWUgd2hhdCB0aGUgR1BVIHdyaXRlLgoKSG93IGV4YWN0bHk/IFRoaXMgaXMg
aG9sZGluZyB0aGUgcGFnZSBwaW4sIHNvIHRoZSBvbmx5IHdheSB0aGUgVkEKbWFwcGluZyBjYW4g
YmUgY2hhbmdlZCBpcyB2aWEgZXhwbGljaXQgdXNlciBhY3Rpb24uCgppZToKCiAgIGdwdV93cml0
ZV9zb21ldGhpbmcodmEsIHNpemUpCiAgIG1tYXAoLi4sIHZhLCBzaXplLCBNTUFQX0ZJWEVEKTsK
ICAgZ3B1X3dhaXRfZG9uZSgpCgpUaGlzIGlzIHJhY3kgYW5kIGluZGV0ZXJtaW5hdGUgd2l0aCBi
b3RoIG1vZGVscy4KCkJhc2VkIG9uIHRoZSBjb21tZW50IGluIGk5MTUgaXQgYXBwZWFycyB0byBi
ZSBnb2luZyBvbiB0aGUgbW9kZWwgdGhhdApjaGFuZ2VzIHRvIHRoZSBtbWFwIGJ5IHVzZXJzcGFj
ZSB3aGVuIHRoZSBHUFUgaXMgd29ya2luZyBvbiBpdCBpcyBhCnByb2dyYW1taW5nIGJ1Zy4gVGhp
cyBpcyByZWFzb25hYmxlLCBsb3RzIG9mIHN5c3RlbXMgdXNlIHRoaXMga2luZCBvZgpjb25zaXN0
ZW5jeSBtb2RlbC4KClNpbmNlIHRoZSBkcml2ZXIgc2VlbXMgdG8gcmVseSBvbiBhIGRtYV9mZW5j
ZSB0byBibG9jayBETUEgYWNjZXNzLCBpdApsb29rcyB0byBtZSBsaWtlIHRoZSBrZXJuZWwgaGFz
IGZ1bGwgdmlzaWJpbGl0eSB0byB0aGUKJ2dwdV93cml0ZV9zb21ldGhpbmcoKScgYW5kICdncHVf
d2FpdF9kb25lKCknIG1hcmtlcnMuCgpJIHRoaW5rIHRyeWluZyB0byB1c2UgaG1tX3JhbmdlX2Zh
dWx0IG9uIEhXIHRoYXQgY2FuJ3QgZG8gSFcgcGFnZQpmYXVsdGluZyBhbmQgSFcgJ1RMQiBzaG9v
dGRvd24nIGlzIGEgdmVyeSwgdmVyeSBiYWQgaWRlYS4gSSBmZWFyIHRoYXQKaXMgd2hhdCBhbWQg
Z3B1IGlzIHRyeWluZyB0byBkby4KCkkgaGF2ZW4ndCB5ZXQgc2VlbiBhbnl0aGluZyB0aGF0IGxv
b2tzIGxpa2UgJ1RMQiBzaG9vdGRvd24nIGluIGk5MTU/PwoKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
