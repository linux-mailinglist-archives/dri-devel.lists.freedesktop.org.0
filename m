Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3B91198
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681588422;
	Sat, 17 Aug 2019 15:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5096E428
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:38:01 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d23so2057913qko.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RNrMF/uU1bNfvkdgF74Cua5rMx69GIS6m4JXv8+fHak=;
 b=Y/MfWxJWh2W8Vle/aUuVl/MnaWSeBRdjAL7bJAz0EuZWV3TcVE0YdLiHRLugM9Au9k
 05UqR7q6rdzG4TA5PfWM50b82c/P7qGl5d1VEfcAEbGQiWFHvsMJUY7Ze+aHQp/vmbLp
 2gSk2KQIW5Dw2jZ91l++BtCLdj6ymaNUc48ANP7CXF3jlfCT6RUXudss4ArI4HPBr6U8
 6xThp6dbNA2xjRC8L8+fONijc8mf0az4OO8KlSFVA2tPTJ/a3qf4McBkolZPq19TtTxP
 tt0EoLS4mTVpKTPgq+8Jc7lfMAa3fw7y1z7I6t5FRC0uYiM3q1NPSOfwNno/3wRmim8s
 PHiw==
X-Gm-Message-State: APjAAAU3p5Ejf5AzLKug1UWCeZa8AvEKbuLWV72WmrY9qGiVqHFT4rwA
 PM1AlKQGhXXwD+JULDCPdBfzNA==
X-Google-Smtp-Source: APXvYqyrLUurfa+j/pK7k5WY8Y78wjqUesLo+WjaUZ5NQgAZCAzL488QQTrcCxHIE4RpT+716qDyEA==
X-Received: by 2002:ae9:e8d6:: with SMTP id a205mr4069811qkg.241.1565879880315; 
 Thu, 15 Aug 2019 07:38:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id u16sm1430477qkj.107.2019.08.15.07.37.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 07:37:59 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyGt5-0005At-Fn; Thu, 15 Aug 2019 11:37:59 -0300
Date: Thu, 15 Aug 2019 11:37:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815143759.GG21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RNrMF/uU1bNfvkdgF74Cua5rMx69GIS6m4JXv8+fHak=;
 b=XnFf3BH105JLrwSSPLnlMStnXLEm7eHDNv2oomajK/Ybv809VU4soaSuvYD1TD7VSI
 MIirezR57bfSFb4WaBjePGwtVqJBvLc8HYIm8CQlxzDgGuFT9drXu/rOQA54w+kVgzaP
 fvAUCocOeA2I5HJKBeDM2pb5hx2cZfivgf3rrjq6F+c0VVywo+/UDfFIOkt02YIk+X9/
 2dVQ6wjna9i0ewdzm0w+BzK471JyIW33cus7Md5bUPLhnitYZ5H0wjbovbgDRhxVXZZU
 pYAtaJjNT0gpe9G55FwQNHSb2Ar2gczUjkeuoQkYNRfnDDTkOQiGfxOzNZ+HLDwMpHQf
 izfw==
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
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDM6MTI6MTFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAzOjA0IFBNIEphc29uIEd1bnRob3JwZSA8
amdnQHppZXBlLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDo0
NDoyOUFNICswMjAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPgo+ID4gPiBBcyB0aGUgb29tIHJl
YXBlciBpcyB0aGUgcHJpbWFyeSBndWFyYW50ZWUgb2YgdGhlIG9vbSBoYW5kbGluZyBmb3J3YXJk
Cj4gPiA+IHByb2dyZXNzIGl0IGNhbm5vdCBiZSBibG9ja2VkIG9uIGFueXRoaW5nIHRoYXQgbWln
aHQgZGVwZW5kIG9uIGJsb2NrYWJsZQo+ID4gPiBtZW1vcnkgYWxsb2NhdGlvbnMuIFRoZXNlIGFy
ZSBub3QgcmVhbGx5IGVhc3kgdG8gdHJhY2sgYmVjYXVzZSB0aGV5Cj4gPiA+IG1pZ2h0IGJlIGlu
ZGlyZWN0IC0gZS5nLiBub3RpZmllciBibG9ja3Mgb24gYSBsb2NrIHdoaWNoIG90aGVyIGNvbnRl
eHQKPiA+ID4gaG9sZHMgd2hpbGUgYWxsb2NhdGluZyBtZW1vcnkgb3Igd2FpdGluZyBmb3IgYSBm
bHVzaGVyIHRoYXQgbmVlZHMgbWVtb3J5Cj4gPiA+IHRvIHBlcmZvcm0gaXRzIHdvcmsuCj4gPgo+
ID4gQnV0IGxvY2tkZXAgKmRvZXMqIHRyYWNrIGFsbCB0aGlzIGFuZCBmc19yZWNsYWltX2FjcXVp
cmUoKSB3YXMgY3JlYXRlZAo+ID4gdG8gc29sdmUgZXhhY3RseSB0aGlzIHByb2JsZW0uCj4gPgo+
ID4gZnNfcmVjbGFpbSBpcyBhIGxvY2sgYW5kIGl0IGZsb3dzIHRocm91Z2ggYWxsIHRoZSB1c3Vh
bCBsb2NrZGVwCj4gPiBzY2hlbWVzIGxpa2UgYW55IG90aGVyIGxvY2suIEFueSB0aW1lIHRoZSBw
YWdlIGFsbG9jYXRvciB3YW50cyB0byBkbwo+ID4gc29tZXRoaW5nIHRoZSB3b3VsZCBkZWFkbG9j
ayB3aXRoIHJlY2xhaW0gaXQgdGFrZXMgdGhlIGxvY2suCj4gPgo+ID4gRmFpbHVyZSBpcyBleHBy
ZXNzZWQgYnkgYSBkZWFkbG9jayBjeWNsZSBpbiB0aGUgbG9ja2RlcCBtYXAsIGFuZAo+ID4gbG9j
a2RlcCBjYW4gaGFuZGxlIGFyYml0YXJ5IGNvbXBsZXhpdHkgdGhyb3VnaCBsYXllcnMgb2YgbG9j
a3MsIHdvcmsKPiA+IHF1ZXVlcywgdGhyZWFkcywgZXRjLgo+ID4KPiA+IFdoYXQgaXMgbWlzc2lu
Zz8KPiAKPiBMb2NrZGVwIGRvZW5zJ3Qgc2VlbiBldmVyeXRoaW5nIGJ5IGZhci4gRS5nLiBhIHdh
aXRfZXZlbnQgd2lsbCBiZQo+IGNhdWdodCBieSB0aGUgYW5ub3RhdGlvbnMgaGVyZSwgYnV0IG5v
dCBieSBsb2NrZGVwLiAKClN1cmUsIGJ1dCB0aGUgd2FpdF9ldmVudCBtaWdodCBiZSBPSyBpZiBp
dHMgcHJvZ3Jlc3MgaXNuJ3QgY29udGluZ2VudApvbiBmc19yZWNsYWltLCBpZSB0cmlnZ2VyZWQg
ZnJvbSBpbnRlcnJ1cHQsIHNvIHdoeSBiYW4gaXQ/Cgo+IEFuZCBzaW5jZSB3ZSdyZSB0YWxraW5n
IGFib3V0IG1tdSBub3RpZmllcnMgaGVyZSBhbmQgZ3B1cy9kbWEgZW5naW5lcy4KPiBXZSBoYXZl
IGRtYV9mZW5jZV93YWl0LCB3aGljaCBjYW4gd2FpdCBmb3IgYW55IGh3L2RyaXZlciBpbiB0aGUg
c3lzdGVtCj4gdGhhdCB0YWtlcyBwYXJ0IGluIHNoYXJlZC96ZXJvLWNvcHkgYnVmZmVyIHByb2Nl
c3NpbmcuIFdoaWNoIGF0IGxlYXN0Cj4gb24gdGhlIGdyYXBoaWNzIHNpZGUgaXMgZXZlcnl0aGlu
Zy4gVGhpcyBwdWxscyBpbiBlbm9ybW91cyBhbW91bnRzIG9mCj4gZGVhZGxvY2sgcG90ZW50aWFs
IHRoYXQgbG9ja2RlcCBzaW1wbHkgaXMgYmxpbmQgYWJvdXQgYW5kIHdpbGwgbmV2ZXIKPiBzZWUu
CgpJdCBzZWVtcyB2ZXJ5IHJpc2t5IHRvIGVudGFnbGUgYSBub3RpZmllciB3aWRlbHkgbGlrZSB0
aGF0LgoKSXQgbG9va3MgcHJldHR5IHN1cmUgdGhhdCBub3RpZmllcnMgYXJlIGZzX3JlY2xhaW0s
IHNvIGF0IGEgbWluaW11bQp0aGF0IHdhaXRfZXZlbnQgY2FuJ3QgYmUgY29udGluZ2VudCBvbiBh
bnl0aGluZyB0aGF0IGlzIGRvaW5nCkdGUF9LRVJORUwgb3IgaXQgd2lsbCBkZWFkbG9jayAtIGFu
ZCBibG9ja2FibGUgZG9lc24ndCBtYWtlIHRoYXQgc2xlZXAKc2FmZS4KCkF2b2lkaW5nIGFuIHVu
Y2VydGFpbiB3YWl0X2V2ZW50IHVuZGVyIG5vdGlmaWVycyB3b3VsZCBzZWVtIHRvIGJlIHRoZQpv
bmx5IHJlYXNvbmFibGUgZGVzaWduIGhlcmUuLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
