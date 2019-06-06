Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB333855E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425D489AEA;
	Fri,  7 Jun 2019 07:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEE989745
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 15:11:50 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i125so1659209qkd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 08:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nICKSnPmhBfa22i4P79WKNgPDXW8CuF04HSSgn2bQQY=;
 b=BJj6m4qNBSfEuUdgc/3DEEJbZdkE1sdIjp2qVtXaJEtNqhuFEKtQkTrYShqKOJiQCw
 CLstcdf5wIoeznzdG3KBxddgvF2E93QHZosD6xDrv877PDWP2XYb4FYi5fsXyftaETHd
 qWXRiiRjPlCnRLMwfMBlfz7TwJNJaBzD6/uJf9Y7I199fRy6Jz3F6qXqqPD4mDdEYOF+
 Gdtl0q9ktHqva9KAFEwevN8+Blj1MUYsL14AWYoS53G4SPzuUv2z9sB+bANxebxsP7Zm
 1cn2UpKOP04FaFN5506znGd4UROEcJJcaeXL2drlmo6Hl+aBrs0/cA+0DBTfOlgghYpI
 ENDQ==
X-Gm-Message-State: APjAAAUdhehVPLvioFQxB2vZ11Xyaz0ULz/EArfDM/BF1qyxkAKz/g+3
 qhc/Ycrj5p3QTcWmwLpp0mo9bw==
X-Google-Smtp-Source: APXvYqy5ivrotzxuZe8QOGBrIM3TV0bm3INrqHp1amDu/ICmE/db2M65ncX/se2X7oSEYpSC21pIxQ==
X-Received: by 2002:a05:620a:142:: with SMTP id
 e2mr22505206qkn.191.1559833910114; 
 Thu, 06 Jun 2019 08:11:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 39sm1244005qtx.71.2019.06.06.08.11.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 08:11:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYu3R-0003Bi-8D; Thu, 06 Jun 2019 12:11:49 -0300
Date: Thu, 6 Jun 2019 12:11:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 0/2] Two bug-fixes for HMM
Message-ID: <20190606151149.GA5506@ziepe.ca>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510195258.9930-1-Felix.Kuehling@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nICKSnPmhBfa22i4P79WKNgPDXW8CuF04HSSgn2bQQY=;
 b=m6czQJ5PAH844WTRtxLEbxKdvBRpUyjJ0AXdDvZR7cSPSTSfR0mirorSbQ39kRU0M0
 dlTKVWQZJRKyKr3r9nSGUcX3MxNMl6r5VZklgbN6Mweyj1EtjYhkSrkr4JxFftGsZpNt
 3ZDbavY5Cs+QqUVJs3M5I+3Lhk0eA9yqm1rccZxh9/BIkQewigTSmoqX1o76zpcZKscf
 KAibnHC/hYQptEH+0I8AS+ZBjoop1mlii54zOfw6YJU/mAfvM08P/0KgEivUYH1Py7hB
 xR+V0om86kGyfHe84fNb6bLkzqCvdC5NAHSrbbH0UaqJbJN6jnwXBXFdjVUXcwOC/QXo
 VNcA==
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
Cc: "alex.deucher@amd.com" <alex.deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDc6NTM6MjFQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IFRoZXNlIHByb2JsZW1zIHdlcmUgZm91bmQgaW4gQU1ELWludGVybmFsIHRlc3Rp
bmcgYXMgd2UncmUgd29ya2luZyBvbgo+IGFkb3B0aW5nIEhNTS4gVGhleSBhcmUgcmViYXNlZCBh
Z2FpbnN0IGdsaXNzZS9obW0tNS4yLXYzLiBXZSdkIGxpa2UgdG8gZ2V0Cj4gdGhlbSBhcHBsaWVk
IHRvIGEgbWFpbmxpbmUgTGludXgga2VybmVsIGFzIHdlbGwgYXMgZHJtLW5leHQgYW5kCj4gYW1k
LXN0YWdpbmctZHJtLW5leHQgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLgo+IAo+IEN1cnJlbnRs
eSB0aGUgSE1NIGluIGFtZC1zdGFnaW5nLWRybS1uZXh0IGlzIHF1aXRlIGZhciBiZWhpbmQgaG1t
LTUuMi12MywKPiBidXQgdGhlIGRyaXZlciBjaGFuZ2VzIGZvciBITU0gYXJlIGV4cGVjdGVkIHRv
IGxhbmQgaW4gNS4yIGFuZCB3aWxsIG5lZWQgdG8KPiBiZSByZWJhc2VkIG9uIHRob3NlIEhNTSBj
aGFuZ2VzLgo+Cj4gSSdkIGxpa2UgdG8gd29yayBvdXQgYSBmbG93IGJldHdlZW4gSmVyb21lLCBE
YXZlLCBBbGV4IGFuZCBteXNlbGYgdGhhdAo+IGFsbG93cyB1cyB0byB0ZXN0IHRoZSBsYXRlc3Qg
dmVyc2lvbiBvZiBITU0gb24gYW1kLXN0YWdpbmctZHJtLW5leHQgc28KPiB0aGF0IGlkZWFsbHkg
ZXZlcnl0aGluZyBjb21lcyB0b2dldGhlciBpbiBtYXN0ZXIgd2l0aG91dCBtdWNoIG5lZWQgZm9y
Cj4gcmViYXNpbmcgYW5kIHJldGVzdGluZy4KCkkgdGhpbmsgd2UgaGF2ZSB0aGF0IG5vdywgSSdt
IHJ1bm5pbmcgYSBobW0uZ2l0IHRoYXQgaXMgY2xlYW4gYW5kIGNhbgpiZSB1c2VkIGZvciBtZXJn
aW5nIGludG8gRFJNIHJlbGF0ZWQgdHJlZXMgKGFuZCBSRE1BKS4gSSd2ZSBjb21taXRlZAp0byBz
ZW5kIHRoaXMgdHJlZSB0byBMaW51cyBhdCB0aGUgc3RhcnQgb2YgdGhlIG1lcmdlIHdpbmRvdy4K
ClNlZSBoZXJlOgoKIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA1MjQxMjQ0NTUu
R0IxNjg0NUB6aWVwZS5jYS8KClRoZSB0cmVlIGlzIGhlcmU6CgogaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmRtYS9yZG1hLmdpdC9sb2cvP2g9aG1tCgpI
b3dldmVyIHBsZWFzZSBjb25zdWx0IHdpdGggbWUgYmVmb3JlIG1ha2luZyBhIG1lcmdlIGNvbW1p
dCB0byBiZQpjby1vcmRpbmF0ZWQuIFRoYW5rcwoKSSBzZWUgaW4gdGhpcyB0aHJlYWQgdGhhdCBB
TURHUFUgbWlzc2VkIDUuMiBiZWFjYXVzZSBvZiB0aGUKY28tb3JkaW5hdGlvbiBwcm9ibGVtcyB0
aGlzIHRyZWUgaXMgaW50ZW5kZWQgdG8gc29sdmUsIHNvIEknbSB2ZXJ5CmhvcGVmdWwgdGhpcyB3
aWxsIGhlbHAgeW91ciB3b3JrIG1vdmUgaW50byA1LjMhCgo+IE1heWJlIGhhdmluZyBKZXJvbWUn
cyBsYXRlc3QgSE1NIGNoYW5nZXMgaW4gZHJtLW5leHQuIEhvd2V2ZXIsIHRoYXQgbWF5Cj4gY3Jl
YXRlIGRlcGVuZGVuY2llcyB3aGVyZSBKZXJvbWUgYW5kIERhdmUgbmVlZCB0byBjb29yZGluYXRl
IHRoZWlyIHB1bGwtCj4gcmVxdWVzdHMgZm9yIG1hc3Rlci4KPiAKPiBGZWxpeCBLdWVobGluZyAo
MSk6Cj4gICBtbS9obW06IE9ubHkgc2V0IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgZm9yIG5vbi1i
bG9ja2luZwo+IAo+IFBoaWxpcCBZYW5nICgxKToKPiAgIG1tL2htbTogc3VwcG9ydCBhdXRvbWF0
aWMgTlVNQSBiYWxhbmNpbmcKCkkndmUgYXBwbGllZCBib3RoIG9mIHRoZXNlIHBhdGNoZXMgd2l0
aCBKZXJvbWUncyBSZXZpZXdlZC1ieSB0bwpobW0uZ2l0IGFuZCBhZGRlZCB0aGUgbWlzc2VkIFNp
Z25lZC1vZmYtYnkKCklmIHlvdSB0ZXN0IGFuZCBjb25maXJtIEkgdGhpbmsgdGhpcyBicmFuY2gg
d291bGQgYmUgcmVhZHkgZm9yIG1lcmdpbmcKdG93YXJkIHRoZSBBTUQgdHJlZS4KClJlZ2FyZHMs
Ckphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
