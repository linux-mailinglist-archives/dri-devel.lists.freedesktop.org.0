Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B83BFEBB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 07:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAC06EE43;
	Fri, 27 Sep 2019 05:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898016EE43
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B74DB3F5EE;
 Fri, 27 Sep 2019 07:55:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8eK5aOG190Hn; Fri, 27 Sep 2019 07:55:21 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 1C6F13F5A8;
 Fri, 27 Sep 2019 07:55:14 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4A2BA3600A4;
 Fri, 27 Sep 2019 07:55:14 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <c58cdb3d-4f5e-7bfc-06b3-58c27676d101@shipmail.org>
 <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <e8954bda-671c-c680-8d0e-8993c0085401@shipmail.org>
Date: Fri, 27 Sep 2019 07:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569563714; bh=81SUoy+FGjlC5Z9P5D0VsyvsR3Dkq5T9B6228Tm+9JA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lsuGNLoVh2MiV7muekN2KlaEhlx8yOtHdScNzz9hVWQ88tazuxZhFvckn8qTWpKRB
 8JBzN3YgnNW0GAgQwCZk/bl8xbiPsJAqEfE71uT4o23dZWB5i5HuK7PQxLUfHxMdM8
 IMirgPB8ozo+nPJG6T6Lay6AkX+rPaOok8jM41fk=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="lsuGNLoV";
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

T24gOS8yNy8xOSAxMjoyMCBBTSwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjYsIDIwMTkgYXQgMTo1NSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKQo+IDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4gV2VsbCwgd2UncmUgd29ya2luZyBvbiBzdXBwb3J0
aW5nIGh1Z2UgcHVkcyBhbmQgcG1kcyBpbiB0aGUgZ3JhcGhpY3MKPj4gVk1BcywgYWx0aG91Z2gg
aW4gdGhlIHdyaXRlLW5vdGlmeSBjYXNlcyB3ZSdyZSBsb29raW5nIGF0IGhlcmUsIHdlIHdvdWxk
Cj4+IHByb2JhYmx5IHdhbnQgdG8gc3BsaXQgdGhlbSBkb3duIHRvIFBURSBsZXZlbC4KPiBXZWxs
LCB0aGF0J3Mgd2hhdCB0aGUgZXhpc3Rpbmcgd2Fsa2VyIGNvZGUgZG9lcyBpZiB5b3UgZG9uJ3Qg
aGF2ZSB0aGF0Cj4gInB1ZF9lbnRyeSgpIiBjYWxsYmFjay4KPgo+IFRoYXQgc2FpZCwgSSBhc3N1
bWUgeW91IHdvdWxkICpub3QqIHdhbnQgdG8gZG8gdGhhdCBpZiB0aGUgaHVnZQo+IHB1ZC9wbWQg
aXMgYWxyZWFkeSBjbGVhbiBhbmQgcmVhZC1vbmx5LCBidXQganVzdCBjb250aW51ZS4KPgo+IFNv
IHlvdSBtYXkgd2FudCB0byBoYXZlIGEgc3BlY2lhbCBwdWRfZW50cnkoKSB0aGF0IGhhbmRsZXMg
dGhhdCBjYXNlLgo+IEV2ZW50dWFsbHkuIE1heWJlLiBBbHRob3VnaCBob25lc3RseSwgaWYgeW91
J3JlIGRvaW5nIGRpcnR5IHRyYWNraW5nLAo+IEkgZG91YnQgaXQgbWFrZXMgbXVjaCBzZW5zZSB0
byB1c2UgbGFyZ2VwYWdlcy4KClRoZSBhcHByb2FjaCB3ZSdyZSBsb29raW5nIGF0IGluIHRoaXMg
Y2FzZSBpcyB0byBrZWVwIGh1Z2UgZW50cmllcyAKd3JpdGUtcHJvdGVjdGVkIGFuZCBzcGxpdCB0
aGVtIGluIHRoZSB3cF9odWdlX3h4eCgpIGNvZGUncyBmYWxsYmFjayBwYXRoIAp3aXRoIHRoZSBt
bWFwX3NlbSBoZWxkLiBUaGlzIG1lYW5zIHRoYXQgdGhlcmUgd2lsbCBhY3R1YWxseSBiZSBodWdl
IAplbnRyaWVzIGluIHRoZSBwYWdlLXdhbGtpbmcgY29kZSBzb29uLCBidXQgYXMgeW91IHNheSwg
b25seSBlbnRyaWVzIHRoYXQgCndlIHdhbnQgdG8gaWdub3JlIGFuZCBub3Qgc3BsaXQuIFNvIHdl
J2QgYWxzbyBuZWVkIGEgd2F5IHRvIGF2b2lkIHRoZSAKcGFnZXdhbGsgc3BsaXR0aW5nIGZvciB0
aGUgc2l0dWF0aW9uIHdoZW4gc29tZW9uZSBmYXVsdHMgYSBodWdlIGVudHJ5IGluIApqdXN0IGJl
Zm9yZSB0aGUgY2FsbCB0byBzcGxpdF9odWdlX3h4eC4KCj4KPj4gTG9va2luZyBhdCB6YXBfcHVk
X3JhbmdlKCkgd2hpY2ggd2hlbiBjYWxsZWQgZnJvbSB1bm1hcF9tYXBwaW5nX3BhZ2VzKCkKPj4g
dXNlcyBpZGVudGljYWwgbG9ja2luZyAobm8gbW1hcF9zZW0pLCBpdCBzZWVtcyB3ZSBzaG91bGQg
YmUgYWJsZSB0byBnZXQKPj4gYXdheSB3aXRoIGlfbW1hcF9sb2NrKCksIG1ha2luZyBzdXJlIHRo
ZSB3aG9sZSBwYWdlIHRhYmxlIGRvZXNuJ3QKPj4gZGlzYXBwZWFyIHVuZGVyIHVzLiBTbyBpdCdz
IG5vdCBjbGVhciB0byBtZSB3aHkgdGhlIG1tYXBfc2VtIGlzIHN0cmljdGx5Cj4+IG5lZWRlZCBo
ZXJlLiBCZXR0ZXIgdG8gc29ydCB0aG9zZSByZXN0cmljdGlvbnMgb3V0IG5vdyByYXRoZXIgdGhh
biB3aGVuCj4+IGh1Z2UgZW50cmllcyBzdGFydCBhcHBlYXJpbmcuCj4gemFwX3B1ZF9yYW5nZSgp
YWN0dWFsbHkgZG9lcyBoYXZlIHRoYXQKPgo+ICAgICAgICAgICAgICAgICBWTV9CVUdfT05fVk1B
KCFyd3NlbV9pc19sb2NrZWQoJnRsYi0+bW0tPm1tYXBfc2VtKSwgdm1hKTsKPgo+IGV4YWN0bHkg
Zm9yIHRoZSBjYXNlIHdoZXJlIGl0IG1pZ2h0IGhhdmUgdG8gc3BsaXQgdGhlIHB1ZCBlbnRyeS4K
Clllcy4gTXkgdGFrZSBvbiB0aGlzIGlzIHRoYXQgbG9ja2luZyB0aGUgUFVEIHB0bCBjYW4gYmUg
ZG9uZSBlaXRoZXIgd2l0aCAKdGhlIG1tYXBfc2VtIG9yIHRoZSBpX21tYXBfbG9jayBpZiBwcmVz
ZW50IGFuZCB0aGF0IHdlIHNob3VsZCB1cGRhdGUgdGhlIAphc3NlcnRzIGluIHh4eF90cmFuc19o
dWdlX2xvY2sgdG8gcmVmbGVjdCB0aGF0LiBCdXQgd2hlbiBhY3R1YWxseSAKc3BsaXR0aW5nIHRy
YW5zaHVnZSBwYWdlcyB5b3UgZG9uJ3Qgd2FudCB0byByYWNlIHdpdGgga2h1Z2VwYWdlZCwgc28g
eW91IApuZWVkIHRoZSBtbWFwX3NlbS4gRm9yIHRoZSBncmFwaGljcyBWTUFzIChNSVhFRE1BUCks
IGtodWdlcGFnZWQgbmV2ZXIgCnRvdWNoZXMgdGhlbS4gWWV0LgoKPgo+IEl0J3Mgd2h5IHRoZXkn
dmUgbmV2ZXIgZ290dGVuIHRyYW5zbGF0ZWQgdG8gdXNlIHRoZSBnZW5lcmljIHdhbGtlciBjb2Rl
LgoKT0suIFllcyB0aGVyZSBhcmUgYSBudW1iZXIgb2YgdmFyaW91cyBzcGVjaWFsaXplZCBwYWdl
d2Fsa3MgYWxsIG92ZXIgdGhlIAptbSBjb2RlLgoKQnV0IGFub3RoZXIgdGhpbmcgdGhhdCB3b3Jy
aWVzIG1lIGlzIHRoYXQgdGhlIHBhZ2UtdGFibGUgbW9kaWZpY2F0aW9ucyAKdGhhdCBoYXBwZW4g
aW4gdGhlIGNhbGxiYWNrIHVzZSBmdW5jdGlvbmFsaXR5IHRoYXQgaXMgbm90IGd1YXJhbnRlZWQg
dG8gCmJlIGV4cG9ydGVkLCBhbmQgdGhhdCBtbSBwZW9wbGUgZG9uJ3Qgd2FudCB0aGVtIHRvIGJl
IGV4cG9ydGVkIGJlY2F1c2UgCnlvdSBkb24ndCB3YW50IHRoZSBkcml2ZXJzIHRvIGdvIGhhY2tp
bmcgYXJvdW5kIGluIHBhZ2UgdGFibGVzLCB3aGljaCAKbWVhbnMgdGhhdCB0aGUgdHdvIGNhbGxi
YWNrcyB1c2VkIGhlcmUgd291bGQgbmVlZCB0byBiZSBhIHNldCBvZiBjb3JlIApoZWxwZXJzIGFu
eXdheS4KClNvIEkgZmlndXJlIHdoYXQgSSB3b3VsZCBlbmQgdXAgd2l0aCB3b3VsZCBhY3R1YWxs
eSBiZSBhbiBleHRlcm4gCl9fd2Fsa19wYWdlX3JhbmdlIGFueXdheSwgYW5kIHNsaWdodGx5IG1v
ZGlmaWVkIGFzc2VydHMuIERvIHlvdSB0aGluayAKdGhhdCBjb3VsZCBiZSBhY2NlcHRpYmxlPwoK
VGhhbmtzLAoKVGhvbWFzCgoKPgo+ICAgICAgICAgICAgIExpbnVzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
