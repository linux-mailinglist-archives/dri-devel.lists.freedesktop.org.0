Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1249119A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8388AA1;
	Sat, 17 Aug 2019 15:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FBB6E338
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:19:08 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u34so5870851qte.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 05:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bEaXAj2iniWEaSuyn0fH/kEDTRkIl1c5/RWuNELkR8k=;
 b=AhBsXu1F+tlvMaZqyQNGgNrRBsxrcvdpOjn3tIokw/LNsH7OFUmJFV/BFIKBpSzmri
 blyt6AHhWFAsnJrkUroj/KTHJhKf71muhNYIkfQ5dzJWzIkDOpDoc9/+NkSD3YGQEXiM
 pDFn8aJzu3ejicfBZ6QBXraMmxst/tTy5dwmSSfSIXK4VqHBMEIhzeVmRcjzN8hUJj2k
 8qNp9cfOlovbuXQ7FJ7mZ4BAiBdz8I8vciwzIShMvENL62pqzV0o/0KPk73KYynwDjgs
 VoxOLNPPItW+kzOrBocKgr+qmZvl+2lx5U+Q0lkfb/cBGnwofwKFQVUXt57/rQkHRQ4Y
 tZ4A==
X-Gm-Message-State: APjAAAUpAfRhs+9wriZhwYEl0v+wtCFeTgc3f1uPXJdwh+fje/X0A5Q6
 KpleebTriIz6lCRuIRrWktkWTw==
X-Google-Smtp-Source: APXvYqwJ0xLOCEoe5le7pO6VtEfZW/wyQ9tx0UXL7Cr/GZtD4aFsgQFkuJBiYfOrdvN1joh+5J6bkg==
X-Received: by 2002:ac8:5503:: with SMTP id j3mr8391055qtq.355.1565957947384; 
 Fri, 16 Aug 2019 05:19:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f27sm2963616qkl.25.2019.08.16.05.19.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 05:19:06 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hybCE-0001q2-67; Fri, 16 Aug 2019 09:19:06 -0300
Date: Fri, 16 Aug 2019 09:19:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816121906.GC5398@ziepe.ca>
References: <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <20190815201323.GU21596@ziepe.ca>
 <20190816081029.GA27790@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816081029.GA27790@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bEaXAj2iniWEaSuyn0fH/kEDTRkIl1c5/RWuNELkR8k=;
 b=jlEJuZ04r4FfQRnSsDTdZ15gGG887mO3OlgLiS5KOdM/EzBvDtD+FVvFpCf4P/D/DI
 frDzy0JvoZ4ASbRUxBfxq+VBafmy6i1RohHZRDHW1JuD0RUOantYkeDrGj6nJAu3OzhD
 f+/Ek9pkIMkSwoxSy/qgajjsD1TfTK+u5nMYCCwMirwVEjP7Crpcx0vKg0u+issupd6f
 ytBhCE03xW7wOtyBD2RlHnjr3wEofPwarGLZUapHD3sOp9Ep2hSxfXwe0fbAsFdoQ95J
 cIJ4g27qSF4DkzKx3Ql2/UzoVwZ9pTqSajKxBQ+YphcyHXFp5lofa0olwQDzdNLT9q32
 IwOA==
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
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
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

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6MTA6MjlBTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFRodSAxNS0wOC0xOSAxNzoxMzoyMywgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6MzU6MjZQTSArMDIwMCwgTWljaGFsIEhvY2tv
IHdyb3RlOgo+ID4gCj4gPiA+ID4gVGhlIGxhc3QgZGV0YWlsIGlzIEknbSBzdGlsbCB1bmNsZWFy
IHdoYXQgYSBHRlAgZmxhZ3MgYSBibG9ja2FibGUKPiA+ID4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0KCkgc2hvdWxkIHVzZS4gSXMgR0ZQX0tFUk5FTCBPSz8KPiA+ID4gCj4gPiA+IEkgaG9wZSBJ
IHdpbGwgbm90IG1ha2UgdGhpcyBtdWRkeSBhZ2FpbiA7KQo+ID4gPiBpbnZhbGlkYXRlX3Jhbmdl
X3N0YXJ0IGluIHRoZSBibG9ja2FibGUgbW9kZSBjYW4gdXNlL2RlcGVuZCBvbiBhbnkgc2xlZXBh
YmxlCj4gPiA+IGFsbG9jYXRpb24gYWxsb3dlZCBpbiB0aGUgY29udGV4dCBpdCBpcyBjYWxsZWQg
ZnJvbS4gCj4gPiAKPiA+ICdpbiB0aGUgY29udGV4dCBpcyBpcyBjYWxsZWQgZnJvbScgaXMgdGhl
IG1hZ2ljIHBocmFzZSwgYXMKPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgaXMgY2FsbGVkIHdo
aWxlIGhvbGRpbmcgc2V2ZXJhbCBkaWZmZXJlbnQgbW0KPiA+IHJlbGF0ZWQgbG9ja3MuIEkga25v
dyBhdCBsZWFzdCB3cml0ZSBtbWFwX3NlbSBhbmQgaV9tbWFwX3J3c2VtCj4gPiAod3JpdGU/KQo+
ID4gCj4gPiBDYW4gR0ZQX0tFUk5FTCBiZSBjYWxsZWQgd2hpbGUgaG9sZGluZyB0aG9zZSBsb2Nr
cz8KPiAKPiBpX21tYXBfcndzZW0gd291bGQgYmUgcHJvYmxlbWF0aWMgYmVjYXVzZSBpdCBpcyB0
YWtlbiBkdXJpbmcgdGhlCj4gcmVjbGFpbS4KCk9rYXkuLiBTbyB0aGUgZnNfcmVjbGFpbSBkZWJ1
Z2dpbmcgZG9lcyBjYXRjaCBlcnJvcnMuIERvIHlvdSBoYXZlIGFueQpyZWZlcmVuY2UgZm9yIHdo
YXQgYSBmYWxzZSBwb3NpdGl2ZSBsb29rcyBsaWtlPyAKCkkgd291bGQgbGlrZSB0byBpbmplY3Qg
aXQgaW50byB0aGUgbm90aWZpZXIgcGF0aCBhcyB0aGlzIGlzIHZlcnkKZGlmZmljdWx0IGZvciBk
cml2ZXIgYXV0aG9ycyB0byBkaXNjb3ZlciBhbmQga25vdyBhYm91dCwgYnV0IEknbQp3b3JyaWVk
IGFib3V0IHlvdXIgZmFsc2UgcG9zaXRpdmUgcmVtYXJrLgoKSSB0aGluayBJIHVuZGVyc3RhbmQg
d2UgY2FuIHVzZSBvbmx5IEdGUF9BVE9NSUMgaW4gdGhlIG5vdGlmaWVycywgYnV0CndlIG5lZWQg
YSBzdHJhdGVneSB0byBoYW5kbGUgT09NIHRvIGd1YXJlbnRlZSBmb3J3YXJkIHByb2dyZXNzLgoK
VGhpcyBpcyBqdXN0IG1vcmUgYnVncyB0byBmaXggOigKCkphc29uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
