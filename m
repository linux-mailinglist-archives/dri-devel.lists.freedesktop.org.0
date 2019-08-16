Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810139116B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EAC6EAFD;
	Sat, 17 Aug 2019 15:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533366E454
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 14:38:21 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i4so6291555qtj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 07:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MS7ajLYKprAI3MhxmX/5qsDZrA6uiLpBaWLcIAnB0Lc=;
 b=ZIjCYaqXqZJyB/VhjjW8INYdJ4XvVJRF6egkkIrTMjOuTBn67Jhd4q9TSFx0ZptpFi
 ZAy/ENhOjKYVO2mjMcVtk98adKgVYMBlLBv07rURWyGHTOy6uhOtkz8JMpW0UryGzsc5
 1siEpTpFgnWI0kewk6d9dzWuqcoZ9yhOeffu3e0MGCO5BvL2sxQTWcp232qwv9HKZI1Z
 wRa2UbUufMBPwtogOR415bdlhjY9fNWbKkbhn+B2gD+uLo40I7O7b8M3w6wHH4aWjjGY
 kHJ45TzO0lMLh3mkqj1vJ7WkpwFuSeqgWE7cfqW/ToSC+MX/I7DgDfgesa1o2eyRjKaB
 24ig==
X-Gm-Message-State: APjAAAVa5zdAQik0ex0miuJY/bPPbID7ru/UcbTVtXaQXR1M66zOFb3l
 OKl4LjXnB9HGyl8YIHX6yX0pmg==
X-Google-Smtp-Source: APXvYqwYNXHDUKQmfXFxyCkbseiiOK3Viv9fJl48UIauzpwNOIbibM0ZWbjQ/KNdDlBkdoYp4JQ5mg==
X-Received: by 2002:ac8:c86:: with SMTP id n6mr8777114qti.345.1565966300391;
 Fri, 16 Aug 2019 07:38:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 125sm3190521qkl.36.2019.08.16.07.38.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 07:38:19 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hydMx-0003Hq-9g; Fri, 16 Aug 2019 11:38:19 -0300
Date: Fri, 16 Aug 2019 11:38:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816143819.GE5398@ziepe.ca>
References: <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
 <20190816010036.GA9915@ziepe.ca>
 <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
 <20190816121243.GB5398@ziepe.ca>
 <CAKMK7uHk03OD+N-anPf-ADPzvQJ_NbQXFh5WsVUo-Ewv9vcOAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHk03OD+N-anPf-ADPzvQJ_NbQXFh5WsVUo-Ewv9vcOAw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MS7ajLYKprAI3MhxmX/5qsDZrA6uiLpBaWLcIAnB0Lc=;
 b=e6kKMZwV4O+Kvfn4npy8P0jfNJrkRu5lQs/FFTJRnQrl5xmV0X39jhnFU/IsAoxvwH
 P6DR5NGW3aTKbm7N4If5x9JQENieb1V/Lilmuo5rM7sTLS9nLnxEuwjWWeFqSjhUTh4s
 BreQymkmDdDoKKfFSagL9nElLDythD+DNAXerEQl/4Mg0SUlGRuKtHuHN64CgLpRbdh7
 9cEiq+OjxTyuC3ETIUPKtAosvo2RxGNiaf3KJxInDCigqVuPBuu8nnC62J1n2oXSz00z
 CI41znMtbUNGAF8K5oF0XH26emRHSKZBPu5rb9XfdSp91cdspY84BohKD2Qxxec+/k98
 vgEA==
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

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDQ6MTE6MzRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBBbHNvLCBhc2lkZSBmcm9tIHRoaXMgcGF0Y2ggKHdoaWNoIGlzIHByZXAgZm9yIHRo
ZSBuZXh0KSBhbmQgc29tZQo+IHNpbXBsZSByZW9yZGVyaW5nIGNvbmZsaWN0cyB0aGV5J3JlIGFs
bCBpbmRlcGVuZGVudC4gU28gaWYgdGhlcmUncyBubwo+IHdheSB0byBwYWludCB0aGlzIGJpa2Vz
aGVkIGhlcmUgKHRlY2huaWNvbG9yIHBlcmhhcHM/KSB0aGVuIEknZCBsaWtlCj4gdG8gZ2V0IGF0
IGxlYXN0IHRoZSBvdGhlcnMgY29uc2lkZXJlZC4KClN1cmUsIEkgdGhpbmsgZm9yIGNvbmZsaWN0
IGF2b2lkYW5jZSByZWFzb25zIEknbSBwcm9iYWJseSB0YWtpbmcKbW11X25vdGlmaWVyIHN0dWZm
IHZpYSBobW0uZ2l0LCBzbzoKCi0gQW5kcmV3IGhhZCBhIG1pbm9yIHJlbWFyayBvbiAjMSwgSSBh
bSBhbWJpdmFsZW50IGFuZCB3b3VsZCB0YWtlIGl0CiAgYXMtaXMuIFlvdXIgZGVjaXNpb24gaWYg
eW91IHdhbnQgdG8gcmVzcGluLgotICMyLyMzIGlzIHRoaXMgaXNzdWUsIEkgd291bGQgc3RhbmQg
YnkgdGhlIHByZWVtcHRfZGlzYWJsZS9ldGMgcGF0aAogIE91ciBzaXR1YXRpb24gbWF0Y2hlcyB5
b3VycywgZGVidWcgdGVzdHMgcnVuIGxvY2tkZXAvZXRjLgotICM0IEkgbGlrZSBhIGxvdCwgZXhj
ZXB0IHRoZSBtYXAgc2hvdWxkIGVuY2xvc2UgcmFuZ2VfZW5kIHRvbywKICB0aGlzIGNhbiBiZSBk
b25lIGFmdGVyIHRoZSBtbV9oYXNfbm90aWZpZXJzIGluc2lkZSB0aGUKICBfX21tdV9ub3RpZmll
ciBmdW5jdGlvbgogIENhbiB5b3UgcmVzcGluPwogIEkgd2lsbCBwcm9wb3NlIHByZWxvYWRpbmcg
dGhlIG1hcCBpbiBhbm90aGVyIHBhdGNoCi0gIzUgaXMgYWxyZWFkeSBhcHBsaWVkIGluIC1yYwoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
