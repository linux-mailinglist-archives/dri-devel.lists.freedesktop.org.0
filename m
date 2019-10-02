Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE99C8995
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CCA6E138;
	Wed,  2 Oct 2019 13:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1226E138
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 13:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id AE1453F4B9;
 Wed,  2 Oct 2019 15:28:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3Tlv0lnB0UB; Wed,  2 Oct 2019 15:28:12 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DC4CE3F3FF;
 Wed,  2 Oct 2019 15:28:10 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 49E1F36016A;
 Wed,  2 Oct 2019 15:28:10 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <50e83aeb-e971-f0ad-f034-ed592588eba7@shipmail.org>
 <20191002131819.asjr2tsx6lcmmbof@box>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <b574e08e-70ce-2cce-03d9-0052bb3f9f87@shipmail.org>
Date: Wed, 2 Oct 2019 15:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191002131819.asjr2tsx6lcmmbof@box>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1570022890; bh=/EBugeJrTD+nCNKHyemgWq/G9ItARTz8ze1eDBUS3kA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nVm9z/UsSusOXVV/5lmZ5iCgZMAg7oYsmpJvJCpcTBb7wuwFjhUs9DI8sKTgsAmua
 Nh+RigK157768aZhapIU3mwPUQkaHFZC8Jv37gBY9bz1lGoPZMvlNQKMt1qUkH+vJV
 Jn6xfmiBeA7HevOIv1Mf3hP+CfOLMp4yLXewUEko=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=nVm9z/Us; 
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMi8xOSAzOjE4IFBNLCBLaXJpbGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMDIsIDIwMTkgYXQgMTE6MjE6MDFBTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2Fy
ZSkgd3JvdGU6Cj4+IE9uIDkvMjYvMTkgMTA6MTYgUE0sIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+
Pj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTowOSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13
YXJlKQo+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pj4+IFRoYXQgc2FpZCwg
aWYgcGVvcGxlIGFyZSBPSyB3aXRoIG1lIG1vZGlmeWluZyB0aGUgYXNzZXJ0IGluCj4+Pj4gcHVk
X3RyYW5zX2h1Z2VfbG9jaygpIGFuZCBtYWtlIF9fd2Fsa19wYWdlX3JhbmdlIG5vbi1zdGF0aWMs
IGl0IHNob3VsZAo+Pj4+IHByb2JhYmx5IGJlIHBvc3NpYmxlIHRvIG1ha2UgaXQgd29yaywgeWVz
Lgo+Pj4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0byBtb2RpZnkgdGhhdCBhc3NlcnQgYXQgYWxs
Lgo+Pj4KPj4+IFRoYXQgdGhpbmcgb25seSBleGlzdHMgd2hlbiB0aGVyZSdzIGEgInB1ZF9lbnRy
eSIgb3AgaW4gdGhlIHdhbGtlciwKPj4+IGFuZCB0aGVuIHlvdSBhYnNvbHV0ZWx5IG5lZWQgdG8g
aGF2ZSB0aGF0IG1tYXBfbG9jay4KPj4+Cj4+PiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgeW91IGZ1
bmRhbWVudGFsbHkgb25seSBldmVyIHdvcmsgb24gYSBwdGUgbGV2ZWwKPj4+IGluIHlvdXIgYWRk
cmVzcyBzcGFjZSB3YWxrZXIgYWxyZWFkeSBhbmQgYWN0dWFsbHkgaGF2ZSBhIFdBUk5fT04oKSBv
bgo+Pj4gdGhlIHB1ZF9odWdlIHRoaW5nLCBzbyBubyBwdWQgZW50cnkgY2FuIHBvc3NpYmx5IGFw
cGx5Lgo+Pj4KPj4+IFNvIG5vLCB0aGUgYXNzZXJ0IGluIHB1ZF90cmFuc19odWdlX2xvY2soKSBk
b2VzIG5vdCBzZWVtIHRvIGJlIGEKPj4+IHJlYXNvbiBub3QgdG8ganVzdCB1c2UgdGhlIGV4aXN0
aW5nIHBhZ2UgdGFibGUgd2Fsa2Vycy4KPj4+Cj4+PiBBbmQgb25jZSB5b3UgZ2V0IHJpZCBvZiB0
aGUgd2Fsa2luZywgd2hhdCBpcyBsZWZ0PyBKdXN0IHRoZSAiaXRlcmF0ZQo+Pj4gb3ZlciB0aGUg
aW5vZGUgbWFwcGluZ3MiIHBhcnQuIFdoaWNoIGNvdWxkIGp1c3QgYmUgZG9uZSBpbgo+Pj4gbW0v
cGFnZXdhbGsuYywgYW5kIHRoZW4geW91IGRvbid0IGV2ZW4gbmVlZCB0byByZW1vdmUgdGhlIHN0
YXRpYy4KPj4+Cj4+PiBTbyBtYWtpbmcgaXQgYmUganVzdCBhbm90aGVyIHdhbGtpbmcgaW4gcGFn
ZXdhbGsuYyB3b3VsZCBzZWVtIHRvIGJlCj4+PiB0aGUgc2ltcGxlc3QgbW9kZWwuCj4+Pgo+Pj4g
Q2FsbCBpdCAid2Fsa19wYWdlX21hcHBpbmcoKSIuIEFuZCB0YWxrIGV4dGVuc2l2ZWx5IGFib3V0
IGhvdyB0aGUKPj4+IGxvY2tpbmcgZGlmZmVycyBhIGxvdCBmcm9tIHRoZSB1c3VhbCAid2Fsa19w
YWdlX3ZtYSgpIiB0aGluZ3MuCj4+Pgo+Pj4gVGhlIHRoZW4gYWN0dWFsICJhcHBseSIgZnVuY3Rp
b25zICh3aGF0IGEgaG9ycmlkIG5hbWUpIGNvdWxkIGJlIGluIHRoZQo+Pj4gdXNlcnMuIFRoZXkg
c2hvdWxkbid0IGJlIG1peGVkIGluIHdpdGggdGhlIHdhbGtpbmcgZnVuY3Rpb25zIGFueXdheS4K
Pj4+IFRoZXkgYXJlIGNhbGxiYWNrcywgbm90IHdhbGtlcnMuCj4+Pgo+Pj4gICAgICAgICAgICAg
ICAgTGludXMKPj4gTGludXMsIEtpcmlsbAo+Pgo+PiBJJ3ZlIHB1c2hlZCBhIHJld29ya2VkIHZl
cnNpb24gYmFzZWQgb24gdGhlIHBhZ2V3YWxrIGNvZGUgaGVyZToKPj4KPj4gaHR0cHM6Ly9jZ2l0
LmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eC9sb2cvP2g9cGFnZXdhbGsKPj4KPj4gKHRv
cCB0aHJlZSBwYXRjaGVkKQo+Pgo+PiB3aXRoIHVzZXJzIGluY2x1ZGVkIGhlcmU6Cj4+Cj4+IGh0
dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfnRob21hc2gvbGludXgvbG9nLz9oPWNvaGVyZW50
LXJlYmFzZWQKPj4KPj4gRG8geW91IHRoaW5rIHRoaXMgY291bGQgd29yaz8gVGhlIHJlYXNvbiB0
aGF0IHRoZSAibW06IEFkZCB3cml0ZS1wcm90ZWN0IGFuZAo+PiBjbGVhbi4uIiBjb2RlIGlzIHN0
aWxsIGluIG1tIGFzIGEgc2V0IG9mIGhlbHBlcnMsIGlzIG9mIGNvdXJzZSB0aGF0IG11Y2ggb2YK
Pj4gdGhlIG5lZWRlZCBmdW5jdGlvbmFsaXR5IGlzIG5vdCBleHBvcnRlZCwgcHJlc3VtYWJseSBz
aW5jZSB3ZSB3YW50IHRvIGtlZXAKPj4gcGFnZSB0YWJsZSBtYW5pcHVsYXRpb24gaW4gbW0uCj4g
Q291bGQgeW91IHBvc3QgaXQgdG8gdGhlIG1haWxpbmcgbGlzdD8gSXQncyBlYXNpZXIgdG8gcmV2
aWV3IHRoaXMgd2F5Lgo+ClN1cmUuCgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
