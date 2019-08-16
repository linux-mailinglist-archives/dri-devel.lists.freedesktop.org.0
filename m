Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2272D91189
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24BF6EB3D;
	Sat, 17 Aug 2019 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CD189C16
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 16:54:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x4so6782854qts.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 09:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QVJMIAUNTcfruK5R8LRJMxtWPGPQI7Ry9GEDvODlN1s=;
 b=DuAqBBLzhGd3OQCthHv1vritcZiRaMl0SRX/+FTFM6rXH1LfIhXM+SLFOqi2UdPZXH
 w9QYJewmfb7VFo9s4Blv38MLeKiX5A/1lnYVjKNysMJdnhnZ6+gWb4YVAUY8IsbyOuGf
 3MtmG2brF27t49amdWGflIz3cHR0O3EcNF2berbXff//Q3heUEbhPWstU5RI6Mb01iZl
 PiU7oUdXjAPgV4anIpTffk3re3vHivxxU4t9A4jS6esexyrr7bx6xDxWORPH2ocoW9TN
 o7ElvzUJJZd1UVkPIh/Uly/IVXwg/HXZ6x8oQV0utpU3ttMwsEDrTa6OWk+f0bTXNlIx
 Bcpg==
X-Gm-Message-State: APjAAAX0mo07M8xqHrisSmDMb44N1jVHZvJk0pbMNdlbqQCwnL/JkiHS
 URsMziHHzRdfn8JpDYy5zqsOig==
X-Google-Smtp-Source: APXvYqzJNDVhKHutNxdNtyYoqetLe4kBGy2raMs/xBZz5bY8799Ba9b9YZFIevc1Y93TXGetBoIvow==
X-Received: by 2002:a0c:c93b:: with SMTP id r56mr2557476qvj.139.1565974496715; 
 Fri, 16 Aug 2019 09:54:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id g28sm3802062qte.46.2019.08.16.09.54.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 09:54:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyfV9-0008Ub-Us; Fri, 16 Aug 2019 13:54:55 -0300
Date: Fri, 16 Aug 2019 13:54:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816165455.GG5398@ziepe.ca>
References: <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
 <20190816010036.GA9915@ziepe.ca>
 <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
 <20190816121243.GB5398@ziepe.ca>
 <CAKMK7uHk03OD+N-anPf-ADPzvQJ_NbQXFh5WsVUo-Ewv9vcOAw@mail.gmail.com>
 <20190816143819.GE5398@ziepe.ca>
 <CAKMK7uGzOO4nZPbZzmaDjjBGZiV2HjgdbT45q9Rd5wTO14VH2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGzOO4nZPbZzmaDjjBGZiV2HjgdbT45q9Rd5wTO14VH2w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QVJMIAUNTcfruK5R8LRJMxtWPGPQI7Ry9GEDvODlN1s=;
 b=LA5Y5Kjpj+D3o1u9JwoTLIjvYl0rV0tZs9iEM17KKWIaqJu/ZgkkQSR4NyhNUDlRqH
 FjmblR9wtS87K1VeqFzXFQsiypgT9FKdVQKn9t0k6GgL7ZaWTn+75LYisquhf2MDrKP9
 D1076HoCBt9rn1J2iGrU4/d2vqtGTBo0qMc6MmFnT/dxxMPTYtbdtXAoMBBIaQPArPnm
 8q9QeFOc8zJy4t+M9Tm4RZsZwy0eLpF51wJyDXxF9h5NpFTRTHZHoo2uEP20LmlydZZw
 wsRccukrRvnx42UcxrjqGJJ70J68Nv5+rYWjBEpWmNdc11451J1vravRwY6UsghcO+fY
 Ra0w==
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

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6MzY6NTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCA0OjM4IFBNIEphc29uIEd1bnRob3JwZSA8
amdnQHppZXBlLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwNDox
MTozNFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBBbHNvLCBhc2lkZSBmcm9t
IHRoaXMgcGF0Y2ggKHdoaWNoIGlzIHByZXAgZm9yIHRoZSBuZXh0KSBhbmQgc29tZQo+ID4gPiBz
aW1wbGUgcmVvcmRlcmluZyBjb25mbGljdHMgdGhleSdyZSBhbGwgaW5kZXBlbmRlbnQuIFNvIGlm
IHRoZXJlJ3Mgbm8KPiA+ID4gd2F5IHRvIHBhaW50IHRoaXMgYmlrZXNoZWQgaGVyZSAodGVjaG5p
Y29sb3IgcGVyaGFwcz8pIHRoZW4gSSdkIGxpa2UKPiA+ID4gdG8gZ2V0IGF0IGxlYXN0IHRoZSBv
dGhlcnMgY29uc2lkZXJlZC4KPiA+Cj4gPiBTdXJlLCBJIHRoaW5rIGZvciBjb25mbGljdCBhdm9p
ZGFuY2UgcmVhc29ucyBJJ20gcHJvYmFibHkgdGFraW5nCj4gPiBtbXVfbm90aWZpZXIgc3R1ZmYg
dmlhIGhtbS5naXQsIHNvOgo+ID4KPiA+IC0gQW5kcmV3IGhhZCBhIG1pbm9yIHJlbWFyayBvbiAj
MSwgSSBhbSBhbWJpdmFsZW50IGFuZCB3b3VsZCB0YWtlIGl0Cj4gPiAgIGFzLWlzLiBZb3VyIGRl
Y2lzaW9uIGlmIHlvdSB3YW50IHRvIHJlc3Bpbi4KPiAKPiBJIGxpa2UgbWluZSBiZXR0ZXIsIHNl
ZSBhbHNvIHRoZSByZXBseSBmcm9tIFJhbHBoIENhbXBiZWxsLgoKU3VyZQoKPiA+IC0gIzIvIzMg
aXMgdGhpcyBpc3N1ZSwgSSB3b3VsZCBzdGFuZCBieSB0aGUgcHJlZW1wdF9kaXNhYmxlL2V0YyBw
YXRoCj4gPiAgIE91ciBzaXR1YXRpb24gbWF0Y2hlcyB5b3VycywgZGVidWcgdGVzdHMgcnVuIGxv
Y2tkZXAvZXRjLgo+Cj4gU2luY2UgTWljaGFsIHJlcXVlc3RlZCB0aGUgY3VycmVudCBmbGF2b3Vy
IEkgdGhpbmsgd2UgbmVlZCBzcGluIGEgYml0Cj4gbW9yZSBvbiB0aGVzZSBoZXJlLiBJIGd1ZXNz
IEknbGwganVzdCByZWJhc2UgdGhlbSB0byB0aGUgZW5kIHNvCj4gdGhleSdyZSBub3QgaG9sZGlu
ZyB1cCB0aGUgb3RoZXJzLgo+IAo+ID4gLSAjNCBJIGxpa2UgYSBsb3QsIGV4Y2VwdCB0aGUgbWFw
IHNob3VsZCBlbmNsb3NlIHJhbmdlX2VuZCB0b28sCj4gPiAgIHRoaXMgY2FuIGJlIGRvbmUgYWZ0
ZXIgdGhlIG1tX2hhc19ub3RpZmllcnMgaW5zaWRlIHRoZQo+ID4gICBfX21tdV9ub3RpZmllciBm
dW5jdGlvbgo+IAo+IFRvIG1ha2Ugc3VyZSBJIGdldCB0aGlzIHJpZ2h0OiBUaGUgc2FtZSBsb2Nr
ZGVwIGNvbnRleHQsIGJ1dCBhbHNvCj4gd3JhcHBlZCBhcm91bmQgaW52YWxpZGF0ZV9yYW5nZV9l
bmQ/IAoKWWVzLCB0aGUgbG9ja2luZyBjb250ZXh0IG9mIF9yYW5nZV9zdGFydCBhbmQgX3Jhbmdl
X2VuZCBzaG91bGQgYmUKaWRlbnRpY2FsLCBsYXN0IHRpbWUgSSBjaGVja2VkIGNhbGxlcnMgdGhp
cyB3YXMgdGhlIGNhc2UuCgpTbywganVzdCBhZGQgaXQgdG8gX19tbXVfbm90aWZpZXJfaW52YWxp
ZGF0ZV9yYW5nZV9lbmQoKSBvdXRzaWRlIHRoZQpTUkNVIGFzIHRoZXJlIGlzIG5vIHJlYXNvbiB0
byBidXJkZW4gZGVidWcga2VybmVsIGNhbGxlcnMgdHdpY2Ugd2hlbgptbXUgbm90aWZpZXJzIGFy
ZSBub3QgZW5hYmxlZAoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
