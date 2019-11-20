Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EB104CF9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3976EB68;
	Thu, 21 Nov 2019 07:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD05A6E802;
 Wed, 20 Nov 2019 21:54:31 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::5a22]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXXvi-0003DB-TU; Wed, 20 Nov 2019 21:54:30 +0000
Subject: Re: [Intel-gfx] linux-next: Tree for Nov 19 (i915)
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <1d30acd4-9947-d228-967f-c4e76ebca832@infradead.org>
 <87k17uwmlv.fsf@intel.com>
 <157426899658.13839.6346197595846229766@skylake-alporthouse-com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fd7a54c4-99b4-abb2-15d1-96324fdff111@infradead.org>
Date: Wed, 20 Nov 2019 13:54:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157426899658.13839.6346197595846229766@skylake-alporthouse-com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jA44cDlCYtFxTSE0zLSv7o10kem9ZSkmgN7lwhPboHE=; b=cfJhrH4+1dDqhuhuXQgOY0X9q
 /P+s6xpxhX8Skj8CX0KgqC4mTqkcoOVOG8vZXBlwTOb9CHb/EoMG2TuuexfOE25yB1/5p953c2N1U
 JcPjGb92UgJ/RXjCtHBtNlzBuU58+ctFBZ1u8T+pzEwfpa05lzqiyCiGoWzfhmwpSRbqu1wGiTzng
 R7Xx4UpX5q8JA308lBpyR66MrZKZ0PjZANMpq3SzKHZ6oSJkR6xF1IBqHxBC4cCwtmWRHPFrHNZoM
 SNxmmvk/KCeY3j+RiYuvDhJt2VI5ZZYURPOGl3cvp0Ypn8M68wyY5hOvrDom+tqUo8mOvisgrEUFL
 ergq6QRhQ==;
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjAvMTkgODo1NiBBTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgSmFuaSBO
aWt1bGEgKDIwMTktMTEtMjAgMTY6MTU6MDgpCj4+IE9uIFR1ZSwgMTkgTm92IDIwMTksIFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPj4+IE9uIDExLzE5LzE5IDEy
OjQ2IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+Pj4+IEhpIGFsbCwKPj4+Pgo+Pj4+IENo
YW5nZXMgc2luY2UgMjAxOTExMTg6Cj4+Pgo+Pj4KPj4+IG9uIHg4Nl82NDoKPj4+Cj4+PiBFUlJP
UjogInBtX3N1c3BlbmRfdGFyZ2V0X3N0YXRlIiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNS5r
b10gdW5kZWZpbmVkIQo+Pj4KPj4+ICMgQ09ORklHX1NVU1BFTkQgaXMgbm90IHNldAo+Pgo+PiBh
NzBhOWU5OThlOGUgKCJkcm0vaTkxNTogRGVmZXIgcmM2IHNodXRkb3duIHRvIHN1c3BlbmRfbGF0
ZSIpCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3Bt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9wbS5jCj4gaW5kZXggMDYwZWUw
ZjQ0YzcwLi45ODIwNDBlY2JkMDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfZ3RfcG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0
X3BtLmMKPiBAQCAtMjc1LDcgKzI3NSw3IEBAIHZvaWQgaW50ZWxfZ3Rfc3VzcGVuZF9wcmVwYXJl
KHN0cnVjdCBpbnRlbF9ndCAqZ3QpCj4gCj4gIHN0YXRpYyBzdXNwZW5kX3N0YXRlX3QgcG1fc3Vz
cGVuZF90YXJnZXQodm9pZCkKPiAgewo+IC0jaWYgSVNfRU5BQkxFRChDT05GSUdfUE1fU0xFRVAp
Cj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19TVVNQRU5EKSAmJiBJU19FTkFCTEVEKENPTkZJR19Q
TV9TTEVFUCkKPiAKPiBEZWNsYXJlZCB1bmRlciBQTV9TTEVFUC4KPiBEZWZpbmVkIHVuZGVyIFNV
U1BFTkQuCj4gLUNocmlzCgpBc2lkZSBmcm9tIGJlaW5nIGEgc2xpZ2h0bHkgaW5jb21wbGV0ZSBw
YXRjaCAobWlzc2luZyAzIGVuZGluZyBjb250ZXh0IGxpbmVzKSwKdGhpcyB3b3JrcyBmaW5lLiAg
VGhhbmtzLgoKQWNrZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiAj
IGJ1aWxkLXRlc3RlZAoKLS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
