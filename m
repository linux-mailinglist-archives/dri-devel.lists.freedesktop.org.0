Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC7C0245
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329F96EED6;
	Fri, 27 Sep 2019 09:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4A86EED6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 85F7E3F4B6;
 Fri, 27 Sep 2019 11:27:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnsC5UR0WgFA; Fri, 27 Sep 2019 11:27:08 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 98AE13F36B;
 Fri, 27 Sep 2019 11:27:07 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0FDA53600A4;
 Fri, 27 Sep 2019 11:27:07 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <c58cdb3d-4f5e-7bfc-06b3-58c27676d101@shipmail.org>
 <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
 <e8954bda-671c-c680-8d0e-8993c0085401@shipmail.org>
Organization: VMware Inc.
Message-ID: <e809a1f3-cf80-87f9-4337-03e92af73bc9@shipmail.org>
Date: Fri, 27 Sep 2019 11:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e8954bda-671c-c680-8d0e-8993c0085401@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569576427; bh=XRuI+mdK64UN9f0IeE6ubS+3LhYSwvzPKVNTt/eWvTo=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=aVVJqjzHaKb9eBsNDILfQZF2R14j+nRA+RRDjqzGB9Ej0EE7hrJHuKL3+ulcpRIfB
 XjiX9tOA6tJtNW2ryPe5tnZqjd+uax5e5edCN+eNbz3Y8EwMEviyf+l3tCW3su16IG
 NXyLR9s7+TVF4PZqCiB99XcOuPUXLkpPjgp/DvMk=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=aVVJqjzH; 
 dkim-atps=neutral
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

T24gOS8yNy8xOSA3OjU1IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBP
biA5LzI3LzE5IDEyOjIwIEFNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPj4gT24gVGh1LCBTZXAg
MjYsIDIwMTkgYXQgMTo1NSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKQo+PiA8dGhvbWFz
X29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+PiBXZWxsLCB3ZSdyZSB3b3JraW5nIG9uIHN1cHBv
cnRpbmcgaHVnZSBwdWRzIGFuZCBwbWRzIGluIHRoZSBncmFwaGljcwo+Pj4gVk1BcywgYWx0aG91
Z2ggaW4gdGhlIHdyaXRlLW5vdGlmeSBjYXNlcyB3ZSdyZSBsb29raW5nIGF0IGhlcmUsIHdlIAo+
Pj4gd291bGQKPj4+IHByb2JhYmx5IHdhbnQgdG8gc3BsaXQgdGhlbSBkb3duIHRvIFBURSBsZXZl
bC4KPj4gV2VsbCwgdGhhdCdzIHdoYXQgdGhlIGV4aXN0aW5nIHdhbGtlciBjb2RlIGRvZXMgaWYg
eW91IGRvbid0IGhhdmUgdGhhdAo+PiAicHVkX2VudHJ5KCkiIGNhbGxiYWNrLgo+Pgo+PiBUaGF0
IHNhaWQsIEkgYXNzdW1lIHlvdSB3b3VsZCAqbm90KiB3YW50IHRvIGRvIHRoYXQgaWYgdGhlIGh1
Z2UKPj4gcHVkL3BtZCBpcyBhbHJlYWR5IGNsZWFuIGFuZCByZWFkLW9ubHksIGJ1dCBqdXN0IGNv
bnRpbnVlLgo+Pgo+PiBTbyB5b3UgbWF5IHdhbnQgdG8gaGF2ZSBhIHNwZWNpYWwgcHVkX2VudHJ5
KCkgdGhhdCBoYW5kbGVzIHRoYXQgY2FzZS4KPj4gRXZlbnR1YWxseS4gTWF5YmUuIEFsdGhvdWdo
IGhvbmVzdGx5LCBpZiB5b3UncmUgZG9pbmcgZGlydHkgdHJhY2tpbmcsCj4+IEkgZG91YnQgaXQg
bWFrZXMgbXVjaCBzZW5zZSB0byB1c2UgbGFyZ2VwYWdlcy4KPgo+IFRoZSBhcHByb2FjaCB3ZSdy
ZSBsb29raW5nIGF0IGluIHRoaXMgY2FzZSBpcyB0byBrZWVwIGh1Z2UgZW50cmllcyAKPiB3cml0
ZS1wcm90ZWN0ZWQgYW5kIHNwbGl0IHRoZW0gaW4gdGhlIHdwX2h1Z2VfeHh4KCkgY29kZSdzIGZh
bGxiYWNrIAo+IHBhdGggd2l0aCB0aGUgbW1hcF9zZW0gaGVsZC4gVGhpcyBtZWFucyB0aGF0IHRo
ZXJlIHdpbGwgYWN0dWFsbHkgYmUgCj4gaHVnZSBlbnRyaWVzIGluIHRoZSBwYWdlLXdhbGtpbmcg
Y29kZSBzb29uLCBidXQgYXMgeW91IHNheSwgb25seSAKPiBlbnRyaWVzIHRoYXQgd2Ugd2FudCB0
byBpZ25vcmUgYW5kIG5vdCBzcGxpdC4gU28gd2UnZCBhbHNvIG5lZWQgYSB3YXkgCj4gdG8gYXZv
aWQgdGhlIHBhZ2V3YWxrIHNwbGl0dGluZyBmb3IgdGhlIHNpdHVhdGlvbiB3aGVuIHNvbWVvbmUg
ZmF1bHRzIAo+IGEgaHVnZSBlbnRyeSBpbiBqdXN0IGJlZm9yZSB0aGUgY2FsbCB0byBzcGxpdF9o
dWdlX3h4eC4KPgo+Pgo+Pj4gTG9va2luZyBhdCB6YXBfcHVkX3JhbmdlKCkgd2hpY2ggd2hlbiBj
YWxsZWQgZnJvbSB1bm1hcF9tYXBwaW5nX3BhZ2VzKCkKPj4+IHVzZXMgaWRlbnRpY2FsIGxvY2tp
bmcgKG5vIG1tYXBfc2VtKSwgaXQgc2VlbXMgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZ2V0Cj4+PiBh
d2F5IHdpdGggaV9tbWFwX2xvY2soKSwgbWFraW5nIHN1cmUgdGhlIHdob2xlIHBhZ2UgdGFibGUg
ZG9lc24ndAo+Pj4gZGlzYXBwZWFyIHVuZGVyIHVzLiBTbyBpdCdzIG5vdCBjbGVhciB0byBtZSB3
aHkgdGhlIG1tYXBfc2VtIGlzIAo+Pj4gc3RyaWN0bHkKPj4+IG5lZWRlZCBoZXJlLiBCZXR0ZXIg
dG8gc29ydCB0aG9zZSByZXN0cmljdGlvbnMgb3V0IG5vdyByYXRoZXIgdGhhbiB3aGVuCj4+PiBo
dWdlIGVudHJpZXMgc3RhcnQgYXBwZWFyaW5nLgo+PiB6YXBfcHVkX3JhbmdlKClhY3R1YWxseSBk
b2VzIGhhdmUgdGhhdAo+Pgo+PiBWTV9CVUdfT05fVk1BKCFyd3NlbV9pc19sb2NrZWQoJnRsYi0+
bW0tPm1tYXBfc2VtKSwgdm1hKTsKPj4KPj4gZXhhY3RseSBmb3IgdGhlIGNhc2Ugd2hlcmUgaXQg
bWlnaHQgaGF2ZSB0byBzcGxpdCB0aGUgcHVkIGVudHJ5Lgo+Cj4gWWVzLiBNeSB0YWtlIG9uIHRo
aXMgaXMgdGhhdCBsb2NraW5nIHRoZSBQVUQgcHRsIGNhbiBiZSBkb25lIGVpdGhlciAKPiB3aXRo
IHRoZSBtbWFwX3NlbSBvciB0aGUgaV9tbWFwX2xvY2sgaWYgcHJlc2VudCBhbmQgdGhhdCB3ZSBz
aG91bGQgCj4gdXBkYXRlIHRoZSBhc3NlcnRzIGluIHh4eF90cmFuc19odWdlX2xvY2sgdG8gcmVm
bGVjdCB0aGF0LiBCdXQgd2hlbiAKPiBhY3R1YWxseSBzcGxpdHRpbmcgdHJhbnNodWdlIHBhZ2Vz
IHlvdSBkb24ndCB3YW50IHRvIHJhY2Ugd2l0aCAKPiBraHVnZXBhZ2VkLCBzbyB5b3UgbmVlZCB0
aGUgbW1hcF9zZW0uIEZvciB0aGUgZ3JhcGhpY3MgVk1BcyAKPiAoTUlYRURNQVApLCBraHVnZXBh
Z2VkIG5ldmVyIHRvdWNoZXMgdGhlbS4gWWV0Lgo+Cj4+Cj4+IEl0J3Mgd2h5IHRoZXkndmUgbmV2
ZXIgZ290dGVuIHRyYW5zbGF0ZWQgdG8gdXNlIHRoZSBnZW5lcmljIHdhbGtlciBjb2RlLgo+Cj4g
T0suIFllcyB0aGVyZSBhcmUgYSBudW1iZXIgb2YgdmFyaW91cyBzcGVjaWFsaXplZCBwYWdld2Fs
a3MgYWxsIG92ZXIgCj4gdGhlIG1tIGNvZGUuCj4KPiBCdXQgYW5vdGhlciB0aGluZyB0aGF0IHdv
cnJpZXMgbWUgaXMgdGhhdCB0aGUgcGFnZS10YWJsZSBtb2RpZmljYXRpb25zIAo+IHRoYXQgaGFw
cGVuIGluIHRoZSBjYWxsYmFjayB1c2UgZnVuY3Rpb25hbGl0eSB0aGF0IGlzIG5vdCBndWFyYW50
ZWVkIAo+IHRvIGJlIGV4cG9ydGVkLCBhbmQgdGhhdCBtbSBwZW9wbGUgZG9uJ3Qgd2FudCB0aGVt
IHRvIGJlIGV4cG9ydGVkIAo+IGJlY2F1c2UgeW91IGRvbid0IHdhbnQgdGhlIGRyaXZlcnMgdG8g
Z28gaGFja2luZyBhcm91bmQgaW4gcGFnZSAKPiB0YWJsZXMsIHdoaWNoIG1lYW5zIHRoYXQgdGhl
IHR3byBjYWxsYmFja3MgdXNlZCBoZXJlIHdvdWxkIG5lZWQgdG8gYmUgCj4gYSBzZXQgb2YgY29y
ZSBoZWxwZXJzIGFueXdheS4KPgo+IFNvIEkgZmlndXJlIHdoYXQgSSB3b3VsZCBlbmQgdXAgd2l0
aCB3b3VsZCBhY3R1YWxseSBiZSBhbiBleHRlcm4gCj4gX193YWxrX3BhZ2VfcmFuZ2UgYW55d2F5
LCBhbmQgc2xpZ2h0bHkgbW9kaWZpZWQgYXNzZXJ0cy4gRG8geW91IHRoaW5rIAo+IHRoYXQgY291
bGQgYmUgYWNjZXB0aWJsZT8KCgpBY3R1YWxseSwgSSdsbCBnaXZlIHlvdXIgb3JpZ2luYWwgc3Vn
Z2VzdGlvbiBhIHRyeSBhbmQgc2VlIHdoYXQgSSBjb21lIAp1cCB3aXRoLgoKVGhhbmtzLApUaG9t
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
