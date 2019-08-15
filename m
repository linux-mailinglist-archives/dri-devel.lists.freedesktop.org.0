Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB091140
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD376E536;
	Sat, 17 Aug 2019 15:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C207A6EA6D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:27:23 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m2so2874779qkd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=19kUjThyL93UzoFUD+sDXbhnnY/kB4Q4ZpZxPxHnCnk=;
 b=VGWdNH1wF/c0YQAMv9M+2hSc9hsZP+bH2+I0giQy3fYl7MhqcXjEYmZ7DnSP0UTfIF
 n7WHrx6PpiJZKdKgdEP513JVdkUdJa32bwNpQuDniMthz7rKLuPxTZZkKpbFL/oCbVyL
 ygOdnjgAYNzJa7yTwjwIa5dssuj9S0n3zF9NqRju968YVUzdDkvVSV43BldpLjDvdhPA
 KiiGTmJkETlCaXo3IJ9x9EsWUEm0YxevLr7uH3mXeItIcTidK9EPkYrEplKkEYZPZ0ha
 AhDmsU+uV9Rp3Dsi1+rQ6jz072aizzoRwEJtrxEOyLa6eUs9DAoTUKvnul2zCtguQPbu
 v55w==
X-Gm-Message-State: APjAAAUEpIrn5FLA2YMA5RNUmPmJaA3ckpaQ7GR6P4vQeJynbPXS/6J5
 c/hPLkPFBREYRxp+A0jvSz34Ng==
X-Google-Smtp-Source: APXvYqz+UPGFBXoX6A+UqJ5T9m9LbRff6OjnB4zgWzUGY/zA50mAxWfQ5PnYDlZwMg7P0H6sXMvVqQ==
X-Received: by 2002:a37:f902:: with SMTP id l2mr5716280qkj.218.1565900842813; 
 Thu, 15 Aug 2019 13:27:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id t29sm2031508qtt.42.2019.08.15.13.27.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 13:27:22 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyMLB-0000Tn-Rm; Thu, 15 Aug 2019 17:27:21 -0300
Date: Thu, 15 Aug 2019 17:27:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815202721.GV21596@ziepe.ca>
References: <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=19kUjThyL93UzoFUD+sDXbhnnY/kB4Q4ZpZxPxHnCnk=;
 b=WDkCTyvJUR9kzGzkv9RhO/TgJXUobdIBDnZhctfrukG1MPh0gO+sRxM9SOc0beAXwp
 71DXELXxjcgZUDezoX51IYEcduNfYTWeesRhE25sMvmrNtDRGdCrt1enEmISteraTO0O
 lmYxf9n7+9HfrzbDV1CWlN5KMnzuye7yZmbHJUXbCAVue3n/XF13L/HHCLVfbebc8dyy
 wOwif/zXDbh3Clzv2PQj4NmLCizwSU+QGXc/0wbE8bSJqynbOv+SGJd8NXnmGXbl1U78
 nftbNS+4wV7MbwnPwm7cnZWNnyj2RIG06/Pk69jMSzWM3pHcSXux3UyoLc3OvczOR8m6
 jufg==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MTY6NDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gU28gaWYgc29tZW9uZSBjYW4gZXhwbGFpbiB0byBtZSBob3cgdGhhdCB3b3JrcyB3
aXRoIGxvY2tkZXAgSSBjYW4gb2YKPiBjb3Vyc2UgaW1wbGVtZW50IGl0LiBCdXQgYWZhaWNzIHRo
YXQgZG9lc24ndCBleGlzdCAoSSB0cmllZCB0byBleHBsYWluCj4gdGhhdCBzb21ld2hlcmUgZWxz
ZSBhbHJlYWR5KSwgYW5kIEknbSBubyByZWFsbHkgbG9va2luZyBmb3J3YXJkIHRvCj4gaGFja2lu
ZyBhbHNvIG9uIGxvY2tkZXAgZm9yIHRoaXMgbGl0dGxlIHNlcmllcy4KCkhtbSwga2luZCBvZiBs
b29rcyBsaWtlIGl0IGlzIGRvbmUgYnkgY2FsbGluZyBwcmVlbXB0X2Rpc2FibGUoKQoKUHJvYmFi
bHkgdGhlIGRlYnVnIG9wdGlvbiBpcyBDT05GSUdfREVCVUdfUFJFRU1QVCwgbm90IGxvY2tkZXA/
CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
