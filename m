Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638449115A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7B6EA51;
	Sat, 17 Aug 2019 15:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E9F6EA28
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 18:24:50 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m2so2559871qki.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G4JHudwK1l0Pa0YXZDZdUoarWmEaiz0kaB3NPKkUFrY=;
 b=almJZlwnjtGW+qpULLOwZQ1ZON96eawWlYuzKXA7ZtTAKiE/KMFKBcArm+ipLb3ZQl
 CC6/zjxQ83FQcU9UrhYKgMP3Ahe2Qo8ZFpM91qypXBWFIaCmeKUwmoqAUUPAwtxRKnzk
 hnmyT00F+vEUj8Wz/qw4nUsz4u+9M7xMOBwlG/jDi3NGamvEsa17Siy75X6qtfOfheN2
 zJYNgen5lBi4w9dUgX57ZE6ZpNOvUKrKc1nKTuOKnpU7vlcy3Lo1tuAi7g1NRMhwqmDY
 VIcTnRPcbRESd4a8hit7UAHgelO/TlGmBa/QtOMEWpsSnJLQrdb3aoG251stnswwpIE7
 stdw==
X-Gm-Message-State: APjAAAVF75umRz00NZL64eXTpqKDD5g4sSUCgrzo4GOkz4YuBk6h9J/G
 qOiqddnJYJwdQT8P+WG30Rh1wA==
X-Google-Smtp-Source: APXvYqznGQA2Mb3OUz3S4NsNelaEmfdP1JHskBC7RLkLXGfv6FD94/o+7zgymYT+l5Mz5o8/J+Om7Q==
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr5561517qkk.474.1565893489768; 
 Thu, 15 Aug 2019 11:24:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id g3sm1745991qke.105.2019.08.15.11.24.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 11:24:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyKQa-0007R9-AO; Thu, 15 Aug 2019 15:24:48 -0300
Date: Thu, 15 Aug 2019 15:24:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815182448.GP21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815174207.GR9477@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G4JHudwK1l0Pa0YXZDZdUoarWmEaiz0kaB3NPKkUFrY=;
 b=UwFqsKZiJqRFsggeYnYEJQ5ti/D+4zJ6BdWzCQ9+5ZVyFzNT0pZp3Z47GysMlVkWVa
 s6il5o0C2XSsvu08linHUpE1UuKtws+6kl5bvb6N8JTjKYNm+ZFsMF/aS7KIuwXwY5PL
 ifLaV1KikbFHjyWGyYq9j2pnPvRA3ulCCU5LBrDPRPTf00Ev8+G4r7ZG1fWssXt+dt8m
 fSIEjUyPUUjE4Cyc7v3Mk2yhOmcAHNWHAjyBbiBB5PDt75HzpgPI6NlB4kYJlFCHPv45
 rERv+1byueCget/MOMNWxs6jcSzjmerqYaJGXU5V9yIGrPZkmI1GoIgdy70yvzXm/v2/
 F53g==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDc6NDI6MDdQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFRodSAxNS0wOC0xOSAxMzo1NjozMSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6MDA6NDFQTSArMDIwMCwgTWljaGFsIEhvY2tv
IHdyb3RlOgo+ID4gCj4gPiA+ID4gQUZBSUsgJ0dGUF9OT1dBSVQnIGlzIGNoYXJhY3Rlcml6ZWQg
YnkgdGhlIGxhY2sgb2YgX19HRlBfRlMgYW5kCj4gPiA+ID4gX19HRlBfRElSRUNUX1JFQ0xBSU0u
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBtYXRjaGVzIHRoZSBleGlzdGluZyB0ZXN0IGluIF9fbmVl
ZF9mc19yZWNsYWltKCkgLSBzbyBpZiB5b3UgYXJlCj4gPiA+ID4gT0sgd2l0aCBHRlBfTk9GUywg
YWthIF9fR0ZQX0lPIHdoaWNoIHRyaWdnZXJzIHRyeV90b19jb21wYWN0X3BhZ2VzKCksCj4gPiA+
ID4gYWxsb2NhdGlvbnMgZHVyaW5nIE9PTSwgdGhlbiBJIHRoaW5rIGZzX3JlY2xhaW0gYWxyZWFk
eSBtYXRjaGVzIHdoYXQKPiA+ID4gPiB5b3UgZGVzY3JpYmVkPwo+ID4gPiAKPiA+ID4gTm8gR0ZQ
X05PRlMgaXMgZXF1YWxseSBiYWQuIFBsZWFzZSByZWFkIG15IG90aGVyIGVtYWlsIGV4cGxhaW5p
bmcgd2hhdAo+ID4gPiB0aGUgb29tX3JlYXBlciBhY3R1YWxseSByZXF1aXJlcy4gSW4gc2hvcnQg
bm8gYmxvY2tpbmcgb24gZGlyZWN0IG9yCj4gPiA+IGluZGlyZWN0IGRlcGVuZGVjeSBvbiBtZW1v
cnkgYWxsb2NhdGlvbiB0aGF0IG1pZ2h0IHNsZWVwLgo+ID4gCj4gPiBJdCBpcyBtdWNoIGVhc2ll
ciB0byBmb2xsb3cgd2l0aCBzb21lIGhpbnRzIG9uIGNvZGUsIHNvIHRoZSB0cnVlCj4gPiByZXF1
aXJlbWVudCBpcyB0aGF0IHRoZSBPT00gcmVwZWFyIG5vdCBibG9jayBvbiBHRlBfRlMgYW5kIEdG
UF9JTwo+ID4gYWxsb2NhdGlvbnMsIGdyZWF0LCB0aGF0IGNvbnN0cmFpbnQgaXMgbm93IGNsZWFy
Lgo+IAo+IEkgc3RpbGwgZG8gbm90IGdldCB3aHkgZG8geW91IHB1dCBGUy9JTyBpbnRvIHRoZSBw
aWN0dXJlLiBUaGlzIGlzIHJlYWxseQo+IGFib3V0IF9fR0ZQX0RJUkVDVF9SRUNMQUlNLgoKTGlr
ZSBJIHNhaWQgdGhpcyBpcyBjb21wbGljYXRlZCwgdHJhbnNsYXRpbmcgIm5vIGJsb2NraW5nIG9u
IGRpcmVjdCBvcgppbmRpcmVjdCBkZXBlbmRlY3kgb24gbWVtb3J5IGFsbG9jYXRpb24gdGhhdCBt
aWdodCBzbGVlcCIgaW50byBHRlAKZmxhZ3MgaXMgaGFyZCBmb3IgdXMgb3V0c2lkZSB0aGUgbW0g
Y29tbXVuaXR5LgoKU28gdGhlIGNvbnRyYWludCBoZXJlIGlzIG5vIF9fR0ZQX0RJUkVDVF9SRUNM
QUlNPwoKSSBicmluZyB1cCBGUy9JTyBiZWNhdXNlIHRoYXQgaXMgd2hhdCBUZWp1biBtZW50aW9u
ZWQgd2hlbiBJIGFza2VkIGhpbQphYm91dCByZWNsYWltIHJlc3RyaWN0aW9ucywgYW5kIGlzIHdo
YXQgZnNfcmVjbGFpbV9hY3F1aXJlKCkgaXMKYWxyZWFkeSBzZW5zaXRpdmUgdG9vLiBJdCBpcyBw
cmV0dHkgY29uZnVzaW5nIGlmIHdlIGhhdmUgcGxhY2VzIHVzaW5nCnRoZSB3b3JkICdyZWNsYWlt
JyB3aXRoIGRpZmZlcmVudCByZXN0cmljdGlvbnMuIDooCgo+ID4gICAgICAgIENQVTAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUxCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygpCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAga21hbGxvYyhHRlBfS0VSTkVMKQo+IAo+IG5vIEkgbWVhbiBfX0dG
UF9ESVJFQ1RfUkVDTEFJTSBoZXJlLgo+IAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG11dGV4X3VubG9jaygpCj4gPiAgIGZzX3JlY2xhaW1fYWNxdWlyZSgpCj4g
PiAgIG11dGV4X2xvY2soKSA8LSBpbGxlZ2FsOiBsb2NrIGRlcCBhc3NlcnRpb24KPiAKPiBJIGNh
bm5vdCByZWFsbHkgY29tbWVudCBvbiBob3cgdGhhdCBpcyBhY2hpZXZlYWJsZSBieSBsb2NrZGVw
LgoKPz8/IEkgYW0gdHJ5aW5nIHRvIGV4cGxhaW4gdGhpcyBpcyBhbHJlYWR5IGRvbmUgYW5kIHdv
cmtpbmcgdG9kYXkuIFRoZQphYm92ZSBleGFtcGxlIHdpbGwgYWxyZWFkeSBmYXVsdCB3aXRoIGxv
Y2tkZXAgZW5hYmxlZC4KClRoaXMgaXMgZXhpc3RpbmcgZGVidWdnaW5nIHdlIGNhbiB1c2UgYW5k
IGltcHJvdmUgdXBvbiByYXRoZXIgdGhhdAppbnZlbnQgbmV3IGRlYnVnZ2luZy4KCkphc29uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
