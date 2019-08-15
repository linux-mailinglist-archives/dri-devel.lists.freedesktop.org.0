Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD479113F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28B06E532;
	Sat, 17 Aug 2019 15:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6440B6EA51
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 19:18:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y26so3521052qto.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nHlPwI6h/V625xmzih5wA+jOZNnzWd66O1xd1ERtpeE=;
 b=WOQ227ccvA8EW9u1gtBCKsLSSSS2veDsU43/q01E+PKicIVLQYlwdAhlYdiOg+XQLE
 L6p020Y2q579h8eTjozlwXf373TYfFtRmyPjQBDI/m06EZhbUFrQ53x6chv6e9LKVGpt
 md472IuxmAGxzos+e2XLVoNjfJK7vtGMwVBr/LKpDcRtea0zPbjxR7CVarmHKb4tsJIF
 gvY/GzCcR5QftdWOvsxw4gRtMlHuNZ1Mqk57cY87dGakZMpad+CC5wsy+3oC2CWWYhM1
 JqY8hpIiGuGpXzTYCyK1VqcKhCChAxukQY2Unb/zqGBExy8LPoUj8wy+DLiTFdQoPTzy
 GkJw==
X-Gm-Message-State: APjAAAVSnVw4LvuLVRLfi/v1JTczttzs97LW6+NtSjYAx5uMSKPEmXsM
 fc47lmn0J3NIaVj1KPJZbStBTw==
X-Google-Smtp-Source: APXvYqxzyb+MEcFc9EqQdTjnul75yj1R+1XL1BUPttOduKO447Q7xMOa3vPB1CyV2bgIob1IxYc3iQ==
X-Received: by 2002:ad4:45d3:: with SMTP id v19mr4341304qvt.90.1565896691409; 
 Thu, 15 Aug 2019 12:18:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id h13sm1876510qkk.12.2019.08.15.12.18.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 12:18:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyLGE-0007y8-Dp; Thu, 15 Aug 2019 16:18:10 -0300
Date: Thu, 15 Aug 2019 16:18:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815191810.GR21596@ziepe.ca>
References: <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815190525.GS9477@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nHlPwI6h/V625xmzih5wA+jOZNnzWd66O1xd1ERtpeE=;
 b=fLiZ2GSX7TMO8JVXsK92o5Wv5m0RqWLHrj8ldc6pcgdf/mVcwYJ/SmzfhxHCh6qvro
 Tp/LRTHwR+hPxVCTqHVxXAXjxi6fc4tAfyhR1RyRsyzQVXJLf6Ntpn7unqRmmg7nz9kW
 jQg4Vn7bKCmHHHTEYyQhuMt4hE1kl1GgLUHrAvSjmpQHMZkPhSAdpeG8D7MLw6d1eTu0
 iLXW2FSDnaipUWKPP6u/s2XT76Elan60y6/5YKCGhyTK5HlwouiKXxIOM8dmXH2nI8EK
 tPw4BeR8rwPZ4Eg/haH846mqKyfLdmRwJce0t+H6beAhcQLieFDthvRXszoHBgroe6sR
 UFZg==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6MDU6MjVQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgoKPiBUaGlzIGlzIHdoYXQgeW91IGNsYWltIGFuZCBJIGFtIHNheWluZyB0aGF0IGZzX3Jl
Y2xhaW0gaXMgYWJvdXQgYQo+IHJlc3RyaWN0ZWQgcmVjbGFpbSBjb250ZXh0IGFuZCBpdCBpcyBh
biB1Z2x5IGhhY2suIEl0IGhhcyBwcm92ZW4gdG8KPiByZXBvcnQgZmFsc2UgcG9zaXRpdmVzLiBN
YXliZSBpdCBjYW4gYmUgZXh0ZW5kZWQgdG8gYSBnZW5lcmljIHJlY2xhaW0uCj4gSSBoYXZlbid0
IHRyaWVkIHRoYXQuIERvIG5vdCBhaW0gdG8gdHJ5IGl0LgoKT2theSwgZ3JlYXQsIEkgdGhpbmsg
dGhpcyBoYXMgYmVlbiB2ZXJ5IGhlbHBmdWwsIGF0IGxlYXN0IGZvciBtZSwKdGhhbmtzLiBJIGRp
ZCBub3Qga25vdyBmc19yZWNsYWltIHdhcyBzbyBwcm9ibGVtYXRpYywgb3IgdGhlIHNwZWNpYWwK
Y2FzZXMgYWJvdXQgT09NICdyZWNsYWltJy4gCgpPbiB0aGlzIHBhdGNoLCBJIGhhdmUgbm8gZ2Vu
ZXJhbCBvYmplY3Rpb24gdG8gZW5mb3JjaW5nIGRyaXZlcnMgdG8gYmUKbm9uLWJsb2NraW5nLCBJ
J2QganVzdCBsaWtlIHRvIHNlZSBpdCBkb25lIHdpdGggdGhlIGV4aXN0aW5nIGxvY2tkZXAKY2Fu
J3Qgc2xlZXAgZGV0ZWN0aW9uIHJhdGhlciB0aGFuIGludmVudGluZyBzb21lIG5ldyBkZWJ1Z2dp
bmcgZm9yIGl0LgoKSSB1bmRlcnN0YW5kIHRoaXMgbWVhbnMgdGhlIGRlYnVnZ2luZyByZXF1aXJl
cyBsb2NrZGVwIGVuYWJsZWQgYW5kCndpbGwgbm90IHJ1biBpbiBwcm9kdWN0aW9uLCBidXQgSSdt
IG9mIHRoZSB2aWV3IHRoYXQgaXMgT0sgYW5kIGluIGxpbmUKd2l0aCBnZW5lcmFsIGtlcm5lbCBw
cmFjdGljZS4KClRoZSBsYXN0IGRldGFpbCBpcyBJJ20gc3RpbGwgdW5jbGVhciB3aGF0IGEgR0ZQ
IGZsYWdzIGEgYmxvY2thYmxlCmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBzaG91bGQgdXNlLiBJ
cyBHRlBfS0VSTkVMIE9LPyBMb2NrZGVwIGhhcwpjb21wbGFpbmVkIG9uIHRoYXQgaW4gcGFzdCBk
dWUgdG8gZnNfcmVjbGFpbSAtIGhvdyBkbyB5b3Uga25vdyBpZiBpdAppcyBhIGZhbHNlIHBvc2l0
aXZlPwoKVGhhbmtzIGFnYWluLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
