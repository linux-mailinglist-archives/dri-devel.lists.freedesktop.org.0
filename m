Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E179116A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118836EAD4;
	Sat, 17 Aug 2019 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C707A6E332
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:12:45 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so4542970qke.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 05:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f8owW6EpsmwqtLp0wnKoaaaHq0YX1Y+Qi9vsJyda86Q=;
 b=Fgbf1582HCijknCdrfhEhJlsk7981UDME7TMzAH6rPCpduidP8Ji/kSgHw5UC/uyQF
 Qid0FXpHfKzD0PXeznuQKevDXzkeZOUiX9vjVCCoJsPavu4Vk7S0m8LeIkSdNS2ql5oh
 oz8R91JiqgIaJIuvgSXU9TiwL6zzZNbxhLx8ePdatmlxGaJaeD9vIIm1n7Mgq7qBhMUk
 yYym7SoXw7v+u/mANReR7vy4C01XyahdCRqSrcGrsEGxxNovFLowYwA6jqfziKztE94i
 5hhbsIv7W8drvRldCct5V8mrCsRQ+9LNJUjaqIzUm3IGybi8tsDsoUJfkqCIomamS/8S
 jBhg==
X-Gm-Message-State: APjAAAU/6Z3e+JU6r9zg4V1P6GSGgzDfojwg/F7C2UNTWyY1iajzcKMy
 8rjkud4jF8ykoUUpAsAvGhcFgg==
X-Google-Smtp-Source: APXvYqyMUeYBXW9fbIGoraU2yLXj1zbNq04/jEsVRBfsR3GdBF63NEaqNn9Gsb89FRfUafPCrlPTew==
X-Received: by 2002:a05:620a:15eb:: with SMTP id
 p11mr7740939qkm.23.1565957564536; 
 Fri, 16 Aug 2019 05:12:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id r4sm3294200qta.93.2019.08.16.05.12.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 05:12:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyb63-0001mf-6H; Fri, 16 Aug 2019 09:12:43 -0300
Date: Fri, 16 Aug 2019 09:12:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816121243.GB5398@ziepe.ca>
References: <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
 <20190816010036.GA9915@ziepe.ca>
 <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f8owW6EpsmwqtLp0wnKoaaaHq0YX1Y+Qi9vsJyda86Q=;
 b=K074sQzn3mritfVn1vyEO1cFfN4Z/ArjoqUauJv0wy+G786US9n9P1vD6X+hiV1Vue
 L0iagywjGWWTZJw6Cr1uKClGUTmJNRFC0EnNA4S2RzUw1XQITq5bgXlU8QfF9Q1zWEpN
 E/SpAFJNq+LhHWZ6WCWF9IBawfG7nYtybEgTo75npLEVQ4H8CyhvMH07dKg73copwI/H
 49E1Y6LZ7PzsHJQmnVyw6vril9S6p1AoL+AptSIhY//od14+Os1BKic/sqw8uQRF2Ok5
 LUzGaTuogV45oW5ff012FxSlHjSnKsqN0UJflMgirTuKBXN0Mi0YoWcPVVjNtE7iJrIx
 7Esw==
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
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDg6MjA6NTVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAzOjAwIEFNIEphc29uIEd1bnRob3JwZSA8
amdnQHppZXBlLmNhPiB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEwOjQ5OjMx
UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5
IGF0IDEwOjI3IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4g
PiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDoxNjo0M1BNICswMjAwLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4gPiA+ID4gU28gaWYgc29tZW9uZSBjYW4gZXhwbGFpbiB0byBtZSBob3cgdGhh
dCB3b3JrcyB3aXRoIGxvY2tkZXAgSSBjYW4gb2YKPiA+ID4gPiA+IGNvdXJzZSBpbXBsZW1lbnQg
aXQuIEJ1dCBhZmFpY3MgdGhhdCBkb2Vzbid0IGV4aXN0IChJIHRyaWVkIHRvIGV4cGxhaW4KPiA+
ID4gPiA+IHRoYXQgc29tZXdoZXJlIGVsc2UgYWxyZWFkeSksIGFuZCBJJ20gbm8gcmVhbGx5IGxv
b2tpbmcgZm9yd2FyZCB0bwo+ID4gPiA+ID4gaGFja2luZyBhbHNvIG9uIGxvY2tkZXAgZm9yIHRo
aXMgbGl0dGxlIHNlcmllcy4KPiA+ID4gPgo+ID4gPiA+IEhtbSwga2luZCBvZiBsb29rcyBsaWtl
IGl0IGlzIGRvbmUgYnkgY2FsbGluZyBwcmVlbXB0X2Rpc2FibGUoKQo+ID4gPgo+ID4gPiBZdXAu
IFRoYXQgd2FzIHYxLCB0aGVuIGNhbWUgdGhlIHN1Z2dlc3Rpb24gdGhhdCBkaXNhYmxpbmcgcHJl
ZW1wdGlvbgo+ID4gPiBpcyBtYXliZSBub3QgdGhlIGJlc3QgdGhpbmcgKHRoZSBvb20gcmVhcGVy
IGNvdWxkIHN0aWxsIHJ1biBmb3IgYSBsb25nCj4gPiA+IHRpbWUgY29tcGFyYXRpdmVseSwgaWYg
aXQncyBjbGVhbmluZyBvdXQgZ2lnYWJ5dGVzIG9mIHByb2Nlc3MgbWVtb3J5Cj4gPiA+IG9yIHdo
YXQgbm90LCBoZW5jZSB0aGlzIGRlZGljYXRlZCBkZWJ1ZyBpbmZyYXN0cnVjdHVyZSkuCj4gPgo+
ID4gT2gsIEknbSBjb21pbmcgaW4gbGF0ZSwgc29ycnkKPiA+Cj4gPiBBbnlob3csIEkgd2FzIHRo
aW5raW5nIHNpbmNlIHdlIGFncmVlZCB0aGlzIGNhbiB0cmlnZ2VyIG9uIHNvbWUKPiA+IENPTkZJ
R19ERUJVRyBmbGFnLCBzb21ldGhpbmcgbGlrZQo+ID4KPiA+ICAgICAvKiBUaGlzIGlzIGEgc2xl
ZXBhYmxlIHJlZ2lvbiwgYnV0IHVzZSBwcmVlbXB0X2Rpc2FibGUgdG8gZ2V0IGRlYnVnZ2luZwo+
ID4gICAgICAqIGZvciBjYWxscyB0aGF0IGFyZSBub3QgYWxsb3dlZCB0byBibG9jayBmb3IgT09N
IFsuLiBpbnNlcnQKPiA+ICAgICAgKiBNaWNoYWwncyBleHBsYW5hdGlvbi4uIF0gKi8KPiA+ICAg
ICBpZiAoSVNfRU5BQkxFRChDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQKSAmJiAhbW11X25vdGlm
aWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCj4gPiAgICAgICAgIHByZWVtcHRfZGlzYWJsZSgp
Owo+ID4gICAgIG9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpOwo+IAo+IEkgdGhpbmsgd2Ug
YWxzbyBkaXNjdXNzZWQgdGhhdCwgYW5kIHNvbWUgZXhwcmVzc2VkIGNvbmNlcm5zIGl0IHdvdWxk
Cj4gY2hhbmdlIGJlaGF2aW91ci90aW1pbmcgdG9vIG11Y2ggZm9yIHRlc3RpbmcuIFNpbmNlIHRo
aXMgZG9lcyBkb2VzCj4gZGlzYWJsZSBwcmVlbXB0aW9uIGZvciByZWFsLCBub3QganVzdCBmb3Ig
bWlnaHRfc2xlZXAuCgpJIGRvbid0IGZvbGxvdywgdGhpcyBpcyBhIGRlYnVnIGtlcm5lbCwgaXQg
d2lsbCBoYXZlIHdpZGx5IGRpZmZlcmVudAp0aW1pbmcuIAoKRnVydGhlciB0aGUgcG9pbnQgb2Yg
dGhpcyBkZWJ1Z2dpbmcgb24gYXRvbWljX3NsZWVwIGlzIHRvIGJlIGFzCnRpbWluZy1pbmRlcGVu
ZGVudCBhcyBwb3NzaWJsZSBzaW5jZSBmdW5jdGlvbnMgd2l0aCByYXJlIHNsZWVwcyBzaG91bGQK
YmUgZ3VhcmRlZCBieSBtaWdodF9zbGVlcCgpIGluIHRoZWlyIGNvbW1vbiBwYXRocy4KCkkgZ3Vl
c3MgSSBkb24ndCBnZXQgdGhlIHB1c2ggdG8gaGF2ZSBzb21lIGxvdyBvdmVyaGVhZCBkZWJ1Z2dp
bmcgZm9yCnRoaXM/IElzIHRoZXJlIHNvbWV0aGluZyBzcGVjaWFsIHlvdSBhcmUgbG9va2luZyBm
b3I/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
