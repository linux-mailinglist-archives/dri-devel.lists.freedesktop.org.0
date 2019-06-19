Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292074BC2A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643976E428;
	Wed, 19 Jun 2019 14:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736FF6E379
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:56:34 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so19431440qtl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 04:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aIyKDOmF25sa+ptAgfuszqALqlc+ol795zmgMWT7ReM=;
 b=mLB0vs6n6WVV4wVIBxilJ6siEw5zeGpbyXQYzzZ5MQwRg4nXmF+7xRuDsWp7DwG4U9
 jx7qF0HZvS11KQvHuB2WgzsKgY/gbWR5qBxOnq7KdJiMmHIZD0AKeE0K8S1VmLEnNrqC
 yXo0hFpIfsaXPPhDU9vMZm3qqq2g16u0NxF6WTck7f0kersfL8O4fFPPYwOh5w7EU9ms
 +4ZAEoeeSfqYP2XnWxTCP0fa5KJHhEt5k7qxXo1H+G/f4BtppwQtsMcvovOxTm1OmlC7
 WkI9tf6VPq6kzjacT1uNlhyBDeqV8/WaC38rxid1jIZrHMiH8Wl3aFiQfGIdaeeg/XJT
 HkRQ==
X-Gm-Message-State: APjAAAU0tR2g+aLgJK8RFTZ4GT8xkREBCjFk+xRq1Y+lHJL/YrLex2ZP
 2DcMFD3NjJUZqgMcHWrh4/Kz/w==
X-Google-Smtp-Source: APXvYqx83INLY1tOphLQBSuL2n2XC0sWDzdU9zK76pUp/d8/new7r9oZpKe73QludbDlywxZpabUmQ==
X-Received: by 2002:a0c:b148:: with SMTP id r8mr32123100qvc.240.1560945393639; 
 Wed, 19 Jun 2019 04:56:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c184sm9739470qkf.82.2019.06.19.04.56.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 04:56:33 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdZCa-000393-Fg; Wed, 19 Jun 2019 08:56:32 -0300
Date: Wed, 19 Jun 2019 08:56:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190619115632.GC9360@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca>
 <20190615142106.GK17724@infradead.org>
 <20190618004509.GE30762@ziepe.ca>
 <20190618053733.GA25048@infradead.org>
 <be4f8573-6284-04a6-7862-23bb357bfe3c@amd.com>
 <20190619080705.GA5164@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619080705.GA5164@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aIyKDOmF25sa+ptAgfuszqALqlc+ol795zmgMWT7ReM=;
 b=F0D/nOEkUs6Sluf5qwUaaXatuIYH0Kewqi3at+sT1omrKjsK7hh+55S+3yOdioLu1y
 kLGplu7LdHjOqetDdcDArMO8rhcNYAfEC/4iDVbECenXZ5rzvImGFgzIxrQjlhLK48Dk
 Vwdy+2avjCBUG0WPpNFolYWtgh+/PrpsKjDYVMgY2c77acE7Xu5xm12glEcYkQccFa1c
 hr+8jfUyWiTURljXzSjxKWQ1CLPDzxvW2Mom/x30FY9VzZ4ngqplYyBIbo9oWyebHM97
 63QODAfcqMfegCTl8X2RAUhqEqzx3k46c6At4QLG8O2Fselsf1BVT4/rkjea8tqv0zhT
 O0ig==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6MDc6MDVBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6NTM6NTVBTSArMDAwMCwgS3Vl
aGxpbmcsIEZlbGl4IHdyb3RlOgo+ID4gVGhpcyBjb2RlIGlzIGRlcml2ZWQgZnJvbSBvdXIgb2xk
IE1NVSBub3RpZmllciBjb2RlLiBCZWZvcmUgSE1NIHdlIHVzZWQgCj4gPiB0byByZWdpc3RlciBh
IHNpbmdsZSBNTVUgbm90aWZpZXIgcGVyIG1tX3N0cnVjdCBhbmQgbG9vayB1cCB2aXJ0dWFsIAo+
ID4gYWRkcmVzcyByYW5nZXMgdGhhdCBoYWQgYmVlbiByZWdpc3RlcmVkIGZvciBtaXJyb3Jpbmcg
dmlhIGRyaXZlciBBUEkgCj4gPiBjYWxscy4gVGhlIGlkZWEgd2FzIHRvIHJldXNlIGEgc2luZ2xl
IE1NVSBub3RpZmllciBmb3IgdGhlIGxpZmUgdGltZSBvZiAKPiA+IHRoZSBwcm9jZXNzLiBJdCB3
b3VsZCByZW1haW4gcmVnaXN0ZXJlZCB1bnRpbCB3ZSBnb3QgYSBub3RpZmllcl9yZWxlYXNlLgo+
ID4gCj4gPiBobW1fbWlycm9yIHRvb2sgdGhlIHBsYWNlIG9mIHRoYXQgd2hlbiB3ZSBjb252ZXJ0
ZWQgdGhlIGNvZGUgdG8gSE1NLgo+ID4gCj4gPiBJIHN1cHBvc2Ugd2UgY291bGQgZGVzdHJveSB0
aGUgbWlycm9yIGVhcmxpZXIsIHdoZW4gd2UgaGF2ZSBubyBtb3JlIAo+ID4gcmVnaXN0ZXJlZCB2
aXJ0dWFsIGFkZHJlc3MgcmFuZ2VzLCBhbmQgY3JlYXRlIGEgbmV3IG9uZSBpZiBuZWVkZWQgbGF0
ZXIuCj4gCj4gSSBkaWRuJ3Qgd3JpdGUgdGhlIGNvZGUsIGJ1dCBpZiB5b3UgbG9vayBhdCBobW1f
bWlycm9yIGl0IGFscmVhZHkgaXMKPiBhIG11bHRpcGxleGVyIG92ZXIgdGhlIG1tdSBub3RpZmll
ciwgYW5kIHRoZSBpbnRlbnQgY2xlYXJseSBzZWVtcyB0aGF0Cj4geW91IHJlZ2lzdGVyIG9uZSBw
ZXIgcmFuZ2UgdGhhdCB5b3Ugd2FudCB0byBtaXJyb3IsIGFuZCBub3QgbXVsdGlwbGV4Cj4gaXQg
b25jZSBhZ2Fpbi4gIEluIG90aGVyIHdvcmRzIC0gSSB0aGluayBlYWNoIGFtZGdwdV9tbl9ub2Rl
IHNob3VsZAo+IHByb2JhYmx5IGhhdmUgaXRzIG93biBobW1fbWlycm9yLiAgQW5kIHdoaWxlIHRo
ZSBhbWRncHVfbW5fbm9kZSBvYmplY3RzCj4gYXJlIGN1cnJlbnRseSBzdG9yZWQgaW4gYW4gaW50
ZXJ2YWwgdHJlZSBpdCBzZWVtcyBsaWtlIHRoZXkgYXJlIG9ubHkKPiBsaW5lYXJseSBpdGVyYXRl
ZCBhbnl3YXksIHNvIGEgbGlzdCBhY3R1YWxseSBzZWVtcyBwcmV0dHkgc3VpdGFibGUuICBJZgo+
IG5vdCB3ZSBuZWVkIHRvIGltcHJvdmUgdGhlIGNvcmUgZGF0YSBzdHJ1Y3R1cmVzIGluc3RlYWQg
b2Ygd29ya2luZwo+IGFyb3VuZCB0aGVtLgoKVGhpcyBsb29rcyBhIGxvdCBsaWtlIHRoZSBPRFAg
Y29kZSAoYW1kZ3B1X21uX25vZGUgPT0gaWJfdW1lbV9vZHApCgpUaGUgaW50ZXJ2YWwgdHJlZSBp
cyB0byBxdWlja2x5IGZpbmQgdGhlIGRyaXZlciBvYmplY3QocykgdGhhdCBoYXZlCnRoZSB2aXJ0
dWFsIHBhZ2VzIGR1cmluZyBpbnZhbGlkYXRpb246CgpzdGF0aWMgaW50IGFtZGdwdV9tbl9zeW5j
X3BhZ2V0YWJsZXNfZ2Z4KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCiAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBobW1fdXBkYXRlICp1cGRhdGUpCnsKICAgICAgICBpdCA9
IGludGVydmFsX3RyZWVfaXRlcl9maXJzdCgmYW1uLT5vYmplY3RzLCBzdGFydCwgZW5kKTsKICAg
ICAgICB3aGlsZSAoaXQpIHsKICAgICAgICAgICAgICAgIFsuLl0KICAgICAgICAgICAgICAgIGFt
ZGdwdV9tbl9pbnZhbGlkYXRlX25vZGUobm9kZSwgc3RhcnQsIGVuZCk7CgpBbmQgZm9sbG93aW5n
IHRoZSBPRFAgbW9kZWwgdGhlcmUgc2hvdWxkIGJlIGEgc2luZ2xlIGhtbV9taXJyb3IgcGVyLW1t
Cih1c2VyIGNhbiBmb3JrIGFuZCBzdHVmZiwgdGhpcyBpcyBzb21ldGhpbmcgSSB3YW50IHRvIGhh
dmUgY29yZSBjb2RlCmhlbHAgd2l0aCkuIAoKVGhlIGhtbV9taXJyb3IgY2FuIGVpdGhlciBleGlz
dCBzbyBsb25nIGFzIG9iamVjdHMgZXhpc3QsIG9yIGl0IGNhbgpleGlzdCB1bnRpbCB0aGUgY2hh
cmRldiBpcyBjbG9zZWQgLSBidXQgbmV2ZXIgbG9uZ2VyIHRoYW4gdGhlCmNoYXJkZXYncyBsaWZl
dGltZS4KCk1heWJlIHdlIHNob3VsZCBiZSBjb25zaWRlcmluZyBwcm92aWRpbmcgYSBtbXUgbm90
aWZpZXIgJiBpbnRlcnZhbAp0cmVlICYgbG9jayBhYnN0cmFjdGlvbiBzaW5jZSBPRFAgJiBBTUQg
YXJlIHZlcnkgc2ltaWxhciBoZXJlLi4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
