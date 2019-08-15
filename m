Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669D91157
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11786EA07;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37796EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:13:25 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id b11so3669303qtp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mio1xktEO9q23/NS5ON0GXRmSn9NHKr3YSBeJ7ROdYQ=;
 b=gu7f9uMum7Xqx4+ElDLw8T/g2kfYFSPtqJ2qof8KetDAqz5nlzpar2iskPmJrA5REA
 tShcrpfrUJbB8d5RK65ozy7muvBNbP1c3GGCBo8ucy+9aWQogN9GShNEyy8o/jNnJ+UZ
 VYNXNhaxl8/DWuZEia1LIdJ84UhvkSblTso7na7DEU0co0s61q06vXyRMZlsQIu3KXpt
 U1HBV1M/jYmt/3sDM9I7wI2pg3ApMaCc9tTBVJeLIHmqfIU0FXraclzRP3GEO8/e58Wt
 Lw5pfSmNS1oJA8y2jIoafGrqVKobjvkSKYQI+AecCcptTngW7vNidzaEBZbAQGlMRzqY
 CC8A==
X-Gm-Message-State: APjAAAXdZQ9V6s27r/CPFfTa1yjyiXgEbpOEzNF8QzTLX38mKrrs9SNG
 L3I8xmADQJ3cFWbLfhe6vtCVgw==
X-Google-Smtp-Source: APXvYqxRY84lSul6rE4VEDZgKI9Yckn67Kds7s8VhylT1WxyiY8LnBxZ7eyr+D26crtE0YOaENxomw==
X-Received: by 2002:ac8:5491:: with SMTP id h17mr5522593qtq.227.1565900004931; 
 Thu, 15 Aug 2019 13:13:24 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id j66sm1870824qkf.86.2019.08.15.13.13.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 13:13:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyM7f-0000Bx-WD; Thu, 15 Aug 2019 17:13:24 -0300
Date: Thu, 15 Aug 2019 17:13:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815201323.GU21596@ziepe.ca>
References: <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815193526.GT9477@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mio1xktEO9q23/NS5ON0GXRmSn9NHKr3YSBeJ7ROdYQ=;
 b=S6sVqqeV2cEhfAMUNUoWKW03ZmeT4Q8V2u1Ez10zAFGO4HA9huyr9rt0S2IIbugoLs
 BjKJPyVPythwQA+QLp5/dE1UTzcIF0mCZNp47DlRYMvNPdgDagPGR9fhK9+wYViWWFiu
 DhWdxuYxz7Jey2r3b862MWf/O0H7maCDrcaFhH/STgnhN9JyHUpSOSLrT7xT8Vzh3Rqr
 HyKeBKZuti7SrcbVz0vOnrmluJd5V1yWBGS9oJ7vaxu91B0sSFFBAjf5L/r5KC9Jp7N9
 YPpv6NvCcrv+FDgt9FA1Ry71JAdHbSC+QSHwomxgiOmjWE2z/x/GgqHTXGh24YAUZy6Q
 a58w==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6MzU6MjZQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgoKPiA+IFRoZSBsYXN0IGRldGFpbCBpcyBJJ20gc3RpbGwgdW5jbGVhciB3aGF0IGEgR0ZQ
IGZsYWdzIGEgYmxvY2thYmxlCj4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgc2hvdWxkIHVz
ZS4gSXMgR0ZQX0tFUk5FTCBPSz8KPiAKPiBJIGhvcGUgSSB3aWxsIG5vdCBtYWtlIHRoaXMgbXVk
ZHkgYWdhaW4gOykKPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGluIHRoZSBibG9ja2FibGUgbW9k
ZSBjYW4gdXNlL2RlcGVuZCBvbiBhbnkgc2xlZXBhYmxlCj4gYWxsb2NhdGlvbiBhbGxvd2VkIGlu
IHRoZSBjb250ZXh0IGl0IGlzIGNhbGxlZCBmcm9tLiAKCidpbiB0aGUgY29udGV4dCBpcyBpcyBj
YWxsZWQgZnJvbScgaXMgdGhlIG1hZ2ljIHBocmFzZSwgYXMKaW52YWxpZGF0ZV9yYW5nZV9zdGFy
dCBpcyBjYWxsZWQgd2hpbGUgaG9sZGluZyBzZXZlcmFsIGRpZmZlcmVudCBtbQpyZWxhdGVkIGxv
Y2tzLiBJIGtub3cgYXQgbGVhc3Qgd3JpdGUgbW1hcF9zZW0gYW5kIGlfbW1hcF9yd3NlbQood3Jp
dGU/KQoKQ2FuIEdGUF9LRVJORUwgYmUgY2FsbGVkIHdoaWxlIGhvbGRpbmcgdGhvc2UgbG9ja3M/
CgpUaGlzIGlzIHRoZSBxdWVzdGlvbiBvZiBpbmRpcmVjdCBkZXBlbmRlbmN5IG9uIHJlY2xhaW0g
dmlhIGxvY2tzIHlvdQpyYWlzZWQgZWFybGllci4KCj4gU28gaW4gb3RoZXIgd29yZHMgaXQgaXMg
bm8gZGlmZmVyZW50IGZyb20gYW55IG90aGVyIGZ1bmN0aW9uIGluIHRoZQo+IGtlcm5lbCB0aGF0
IGNhbGxzIGludG8gYWxsb2NhdG9yLiBBcyB0aGUgQVBJIGlzIG1pc3NpbmcgZ2ZwIGNvbnRleHQK
PiB0aGVuIEkgaG9wZSBpdCBpcyBub3QgY2FsbGVkIGZyb20gYW55IHJlc3RyaWN0ZWQgY29udGV4
dHMgKGV4Y2VwdAo+IGZyb20gdGhlIG9vbSB3aGljaCB3ZSBoYXZlICFibG9ja2FibGUgZm9yKS4K
ClllcywgdGhlIGNhbGxlcnMgYXJlIGV4YWN0bHkgbXkgY29uY2Vybi4KIAo+ID4gTG9ja2RlcCBo
YXMKPiA+IGNvbXBsYWluZWQgb24gdGhhdCBpbiBwYXN0IGR1ZSB0byBmc19yZWNsYWltIC0gaG93
IGRvIHlvdSBrbm93IGlmIGl0Cj4gPiBpcyBhIGZhbHNlIHBvc2l0aXZlPwo+IAo+IEkgd291bGQg
aGF2ZSB0byBzZWUgdGhlIHNwZWNpZmljIGxvY2tkZXAgc3BsYXQuCgpTZWUgYmVsb3cuIEkgZm91
bmQgaXQgd2hlbiB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aHkgdGhlIHJlZ2lzdHJhdGlvbgpvZiB0
aGUgbW11IG5vdGlmaWZlciB3YXMgc28gb2RkbHkgY29kZWQuCgpUaGUgc2l0dWF0aW9uIHdhczoK
CiAgZG93bl93cml0ZSgmbW0tPm1tYXBfc2VtKTsKICBtbV90YWtlX2FsbF9sb2NrcyhtbSk7CiAg
a21hbGxvYyhHRlBfS0VSTkVMKTsgIDwtLS0gbG9ja2RlcCB3YXJuaW5nCgpJIHVuZGVyc3Rvb2Qg
RGFuaWVsIHNhaWQgaGUgc2F3IHRoaXMgZGlyZWN0bHkgb24gYSByZWNlbnQga2VybmVsIHdoZW4K
d29ya2luZyB3aXRoIGhpcyBsb2NrZGVwIHBhdGNoPwoKQ2hlY2tpbmcgbXlzZWxmLCBvbiB0b2Rh
eXMga2VybmVsIEkgc2VlIGEgY2FsbCBjaGFpbjoKCnNocmlua19hbGxfbWVtb3J5CiAgZnNfcmVj
bGFpbV9hY3F1aXJlKHNjLmdmcF9tYXNrKTsKICBbLi5dCiAgZG9fdHJ5X3RvX2ZyZWVfcGFnZXMK
ICAgc2hyaW5rX3pvbmVzCiAgICBzaHJpbmtfbm9kZQogICAgIHNocmlua19ub2RlX21lbWNnCiAg
ICAgIHNocmlua19saXN0CiAgICAgICBzaHJpbmtfYWN0aXZlX2xpc3QKICAgICAgICBwYWdlX3Jl
ZmVyZW5jZWQKICAgICAgICAgcm1hcF93YWxrCiAgICAgICAgICBybWFwX3dhbGtfZmlsZQogICAg
ICAgICAgIGlfbW1hcF9sb2NrX3JlYWQKICAgICAgICAgICAgZG93bl9yZWFkKGlfbW1hcF9yd3Nl
bSkKClNvIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGRvd25fcmVhZCgpIGFib3ZlIHdpbGwgYmxv
Y2sgb24KaV9tbWFwX3J3c2VtIGJlaW5nIGhlbGQgaW4gdGhlIGNhbGxlciBvZiBpbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0IHdoaWNoCmlzIGRvaW5nIGttYWxsb2MoR1BGX0tFUk5FTCkuCgpJcyB0aGlz
IE9LPyBUaGUgbG9ja2RlcCBhbm5vdGF0aW9uIHNheXMgbm8uLgoKSmFzb24KCmNvbW1pdCAzNWNm
YTJiMGI0OTFjMzdlMjM1Mjc4MjJiZjM2NTYxMGRiYjE4OGU1CkF1dGhvcjogR2F2aW4gU2hhbiA8
c2hhbmd3QGxpbnV4LnZuZXQuaWJtLmNvbT4KRGF0ZTogICBUaHUgT2N0IDI1IDEzOjM4OjAxIDIw
MTIgLTA3MDAKCiAgICBtbS9tbXVfbm90aWZpZXI6IGFsbG9jYXRlIG1tdV9ub3RpZmllciBpbiBh
ZHZhbmNlCiAgICAKICAgIFdoaWxlIGFsbG9jYXRpbmcgbW11X25vdGlmaWVyIHdpdGggcGFyYW1l
dGVyIEdGUF9LRVJORUwsIHN3YXAgd291bGQgc3RhcnQKICAgIHRvIHdvcmsgaW4gY2FzZSBvZiB0
aWdodCBhdmFpbGFibGUgbWVtb3J5LiAgRXZlbnR1YWxseSwgdGhhdCB3b3VsZCBsZWFkIHRvCiAg
ICBhIGRlYWRsb2NrIHdoaWxlIHRoZSBzd2FwIGRlYW1vbiBzd2FwcyBhbm9ueW1vdXMgcGFnZXMu
ICBJdCB3YXMgY2F1c2VkIGJ5CiAgICBjb21taXQgZTBmM2MzZjc4ZGEyOWIgKCJtbS9tbXVfbm90
aWZpZXI6IGluaXQgbm90aWZpZXIgaWYgbmVjZXNzYXJ5IikuCiAgICAKICAgICAgPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CiAgICAgIFsgSU5GTzogaW5jb25zaXN0ZW50IGxvY2sg
c3RhdGUgXQogICAgICAzLjcuMC1yYzErICM1MTggTm90IHRhaW50ZWQKICAgICAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgIGluY29uc2lzdGVudCB7UkVDTEFJTV9GUy1P
Ti1XfSAtPiB7SU4tUkVDTEFJTV9GUy1XfSB1c2FnZS4KICAgICAga3N3YXBkMC8zNSBbSEMwWzBd
OlNDMFswXTpIRTE6U0UxXSB0YWtlczoKICAgICAgICgmbWFwcGluZy0+aV9tbWFwX211dGV4KXsr
LisuPy59LCBhdDogcGFnZV9yZWZlcmVuY2VkKzB4OWMvMHgyZTAKICAgICAge1JFQ0xBSU1fRlMt
T04tV30gc3RhdGUgd2FzIHJlZ2lzdGVyZWQgYXQ6CiAgICAgICAgIG1hcmtfaGVsZF9sb2Nrcysw
eDg2LzB4MTUwCiAgICAgICAgIGxvY2tkZXBfdHJhY2VfYWxsb2MrMHg2Ny8weGMwCiAgICAgICAg
IGttZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgzMy8weDIzMAogICAgICAgICBkb19tbXVfbm90aWZp
ZXJfcmVnaXN0ZXIrMHg4Ny8weDE4MAogICAgICAgICBtbXVfbm90aWZpZXJfcmVnaXN0ZXIrMHgx
My8weDIwCiAgICAgICAgIGt2bV9kZXZfaW9jdGwrMHg0MjgvMHg1MTAKICAgICAgICAgZG9fdmZz
X2lvY3RsKzB4OTgvMHg1NzAKICAgICAgICAgc3lzX2lvY3RsKzB4OTEvMHhiMAogICAgICAgICBz
eXN0ZW1fY2FsbF9mYXN0cGF0aCsweDE2LzB4MWIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
