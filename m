Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916AFBFAC6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 22:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48FA6EDC3;
	Thu, 26 Sep 2019 20:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1426EDC3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 20:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C92533FBDF;
 Thu, 26 Sep 2019 22:55:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCc1skLxnFSs; Thu, 26 Sep 2019 22:55:47 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 15C263FA6C;
 Thu, 26 Sep 2019 22:55:46 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 787EE3601AA;
 Thu, 26 Sep 2019 22:55:46 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <c58cdb3d-4f5e-7bfc-06b3-58c27676d101@shipmail.org>
Date: Thu, 26 Sep 2019 22:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569531346; bh=QDCzJnIw2NcRoyWGnCmx01s2V3PezimSel1iXciq1+Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iT1TWL+4cqBnl+TNn7Xu1wTe3naZCoTfhaRKoWLUMNnSy2L+J9vU1YCwN0qUQPOuP
 r+dn5uLvaChhSo65zGrWGCe6lzIgxh61AHJB3PMZIEFdAnGaU4iOhdTHNI0IH6cmKW
 PFKNh8UtHSPx96Nd6WgYKQT/5JT0kFZfuLoaAK50=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iT1TWL+4; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yNi8xOSAxMDoxNiBQTSwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjYsIDIwMTkgYXQgMTowOSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKQo+IDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4gVGhhdCBzYWlkLCBpZiBwZW9wbGUgYXJlIE9LIHdp
dGggbWUgbW9kaWZ5aW5nIHRoZSBhc3NlcnQgaW4KPj4gcHVkX3RyYW5zX2h1Z2VfbG9jaygpIGFu
ZCBtYWtlIF9fd2Fsa19wYWdlX3JhbmdlIG5vbi1zdGF0aWMsIGl0IHNob3VsZAo+PiBwcm9iYWJs
eSBiZSBwb3NzaWJsZSB0byBtYWtlIGl0IHdvcmssIHllcy4KPiBJIGRvbid0IHRoaW5rIHlvdSBu
ZWVkIHRvIG1vZGlmeSB0aGF0IGFzc2VydCBhdCBhbGwuCj4KPiBUaGF0IHRoaW5nIG9ubHkgZXhp
c3RzIHdoZW4gdGhlcmUncyBhICJwdWRfZW50cnkiIG9wIGluIHRoZSB3YWxrZXIsCj4gYW5kIHRo
ZW4geW91IGFic29sdXRlbHkgbmVlZCB0byBoYXZlIHRoYXQgbW1hcF9sb2NrLgo+Cj4gQXMgZmFy
IGFzIEkgY2FuIHRlbGwsIHlvdSBmdW5kYW1lbnRhbGx5IG9ubHkgZXZlciB3b3JrIG9uIGEgcHRl
IGxldmVsCj4gaW4geW91ciBhZGRyZXNzIHNwYWNlIHdhbGtlciBhbHJlYWR5IGFuZCBhY3R1YWxs
eSBoYXZlIGEgV0FSTl9PTigpIG9uCj4gdGhlIHB1ZF9odWdlIHRoaW5nLCBzbyBubyBwdWQgZW50
cnkgY2FuIHBvc3NpYmx5IGFwcGx5LgoKV2VsbCwgd2UncmUgd29ya2luZyBvbiBzdXBwb3J0aW5n
IGh1Z2UgcHVkcyBhbmQgcG1kcyBpbiB0aGUgZ3JhcGhpY3MgClZNQXMsIGFsdGhvdWdoIGluIHRo
ZSB3cml0ZS1ub3RpZnkgY2FzZXMgd2UncmUgbG9va2luZyBhdCBoZXJlLCB3ZSB3b3VsZCAKcHJv
YmFibHkgd2FudCB0byBzcGxpdCB0aGVtIGRvd24gdG8gUFRFIGxldmVsLiBCdXQgaWYgd2Ugd291
bGQgd2FudCB0byAKZXh0ZW5kIHRoYXQgb3IgaWYgd2Ugd291bGQgd2FudCB0byBtYWtlIHRoaXMg
aW50ZXJmYWNlIGdlbmVyYWwsIHdlJ2QgCnByb2JhYmx5IHdhbnQgdG8gc3VwcG9ydCBhbHNvIGEg
cHVkX2VudHJ5IGNhbGxiYWNrLgoKTG9va2luZyBhdCB6YXBfcHVkX3JhbmdlKCkgd2hpY2ggd2hl
biBjYWxsZWQgZnJvbSB1bm1hcF9tYXBwaW5nX3BhZ2VzKCkgCnVzZXMgaWRlbnRpY2FsIGxvY2tp
bmcgKG5vIG1tYXBfc2VtKSwgaXQgc2VlbXMgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZ2V0IAphd2F5
IHdpdGggaV9tbWFwX2xvY2soKSwgbWFraW5nIHN1cmUgdGhlIHdob2xlIHBhZ2UgdGFibGUgZG9l
c24ndCAKZGlzYXBwZWFyIHVuZGVyIHVzLiBTbyBpdCdzIG5vdCBjbGVhciB0byBtZSB3aHkgdGhl
IG1tYXBfc2VtIGlzIHN0cmljdGx5IApuZWVkZWQgaGVyZS4gQmV0dGVyIHRvIHNvcnQgdGhvc2Ug
cmVzdHJpY3Rpb25zIG91dCBub3cgcmF0aGVyIHRoYW4gd2hlbiAKaHVnZSBlbnRyaWVzIHN0YXJ0
IGFwcGVhcmluZy4KCj4KPiBTbyBubywgdGhlIGFzc2VydCBpbiBwdWRfdHJhbnNfaHVnZV9sb2Nr
KCkgZG9lcyBub3Qgc2VlbSB0byBiZSBhCj4gcmVhc29uIG5vdCB0byBqdXN0IHVzZSB0aGUgZXhp
c3RpbmcgcGFnZSB0YWJsZSB3YWxrZXJzLgo+Cj4gQW5kIG9uY2UgeW91IGdldCByaWQgb2YgdGhl
IHdhbGtpbmcsIHdoYXQgaXMgbGVmdD8gSnVzdCB0aGUgIml0ZXJhdGUKPiBvdmVyIHRoZSBpbm9k
ZSBtYXBwaW5ncyIgcGFydC4gV2hpY2ggY291bGQganVzdCBiZSBkb25lIGluCj4gbW0vcGFnZXdh
bGsuYywgYW5kIHRoZW4geW91IGRvbid0IGV2ZW4gbmVlZCB0byByZW1vdmUgdGhlIHN0YXRpYy4K
Pgo+IFNvIG1ha2luZyBpdCBiZSBqdXN0IGFub3RoZXIgd2Fsa2luZyBpbiBwYWdld2Fsay5jIHdv
dWxkIHNlZW0gdG8gYmUKPiB0aGUgc2ltcGxlc3QgbW9kZWwuCj4KPiBDYWxsIGl0ICJ3YWxrX3Bh
Z2VfbWFwcGluZygpIi4gQW5kIHRhbGsgZXh0ZW5zaXZlbHkgYWJvdXQgaG93IHRoZQo+IGxvY2tp
bmcgZGlmZmVycyBhIGxvdCBmcm9tIHRoZSB1c3VhbCAid2Fsa19wYWdlX3ZtYSgpIiB0aGluZ3Mu
CgpTdXJlLiBDYW4gZG8gdGhhdC4KClRoYW5rcywKClRob21hcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
