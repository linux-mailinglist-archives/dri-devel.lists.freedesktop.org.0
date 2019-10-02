Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C70C4A7E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 11:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936E86E921;
	Wed,  2 Oct 2019 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341946E921
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 09:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CE6BC3F6BA;
 Wed,  2 Oct 2019 11:21:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IS1Y-KJ7u8fr; Wed,  2 Oct 2019 11:21:08 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id BD2D53F6AE;
 Wed,  2 Oct 2019 11:21:02 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3ED77360058;
 Wed,  2 Oct 2019 11:21:02 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <50e83aeb-e971-f0ad-f034-ed592588eba7@shipmail.org>
Date: Wed, 2 Oct 2019 11:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1570008062; bh=Rg6OP4o/QDF7kwct9j3Hp3SgvBNu7Bw7IgByIFeVLSM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lG5wyc8lQDIxcnSs7OriVvn1LeHWxFlMWPeukWdSGkuyjj7G3P4OCiWue0gORAIUf
 LZx/cvGYLNTw2DPdP/ZnO6ZB2sUiXQxbFZArSNSGR7GR31+0pqmpK6HXOx5tasvq4J
 ZmqJkQcWgNu4G84gb9KrSb21Ls+TXeQiSMgYaBIA=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lG5wyc8l; 
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
cnkgY2FuIHBvc3NpYmx5IGFwcGx5Lgo+Cj4gU28gbm8sIHRoZSBhc3NlcnQgaW4gcHVkX3RyYW5z
X2h1Z2VfbG9jaygpIGRvZXMgbm90IHNlZW0gdG8gYmUgYQo+IHJlYXNvbiBub3QgdG8ganVzdCB1
c2UgdGhlIGV4aXN0aW5nIHBhZ2UgdGFibGUgd2Fsa2Vycy4KPgo+IEFuZCBvbmNlIHlvdSBnZXQg
cmlkIG9mIHRoZSB3YWxraW5nLCB3aGF0IGlzIGxlZnQ/IEp1c3QgdGhlICJpdGVyYXRlCj4gb3Zl
ciB0aGUgaW5vZGUgbWFwcGluZ3MiIHBhcnQuIFdoaWNoIGNvdWxkIGp1c3QgYmUgZG9uZSBpbgo+
IG1tL3BhZ2V3YWxrLmMsIGFuZCB0aGVuIHlvdSBkb24ndCBldmVuIG5lZWQgdG8gcmVtb3ZlIHRo
ZSBzdGF0aWMuCj4KPiBTbyBtYWtpbmcgaXQgYmUganVzdCBhbm90aGVyIHdhbGtpbmcgaW4gcGFn
ZXdhbGsuYyB3b3VsZCBzZWVtIHRvIGJlCj4gdGhlIHNpbXBsZXN0IG1vZGVsLgo+Cj4gQ2FsbCBp
dCAid2Fsa19wYWdlX21hcHBpbmcoKSIuIEFuZCB0YWxrIGV4dGVuc2l2ZWx5IGFib3V0IGhvdyB0
aGUKPiBsb2NraW5nIGRpZmZlcnMgYSBsb3QgZnJvbSB0aGUgdXN1YWwgIndhbGtfcGFnZV92bWEo
KSIgdGhpbmdzLgo+Cj4gVGhlIHRoZW4gYWN0dWFsICJhcHBseSIgZnVuY3Rpb25zICh3aGF0IGEg
aG9ycmlkIG5hbWUpIGNvdWxkIGJlIGluIHRoZQo+IHVzZXJzLiBUaGV5IHNob3VsZG4ndCBiZSBt
aXhlZCBpbiB3aXRoIHRoZSB3YWxraW5nIGZ1bmN0aW9ucyBhbnl3YXkuCj4gVGhleSBhcmUgY2Fs
bGJhY2tzLCBub3Qgd2Fsa2Vycy4KPgo+ICAgICAgICAgICAgICAgTGludXMKCkxpbnVzLCBLaXJp
bGwKCkkndmUgcHVzaGVkIGEgcmV3b3JrZWQgdmVyc2lvbiBiYXNlZCBvbiB0aGUgcGFnZXdhbGsg
Y29kZSBoZXJlOgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eC9s
b2cvP2g9cGFnZXdhbGsKCih0b3AgdGhyZWUgcGF0Y2hlZCkKCndpdGggdXNlcnMgaW5jbHVkZWQg
aGVyZToKCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfnRob21hc2gvbGludXgvbG9nLz9o
PWNvaGVyZW50LXJlYmFzZWQKCkRvIHlvdSB0aGluayB0aGlzIGNvdWxkIHdvcms/IFRoZSByZWFz
b24gdGhhdCB0aGUgIm1tOiBBZGQgd3JpdGUtcHJvdGVjdCAKYW5kIGNsZWFuLi4iIGNvZGUgaXMg
c3RpbGwgaW4gbW0gYXMgYSBzZXQgb2YgaGVscGVycywgaXMgb2YgY291cnNlIHRoYXQgCm11Y2gg
b2YgdGhlIG5lZWRlZCBmdW5jdGlvbmFsaXR5IGlzIG5vdCBleHBvcnRlZCwgcHJlc3VtYWJseSBz
aW5jZSB3ZSAKd2FudCB0byBrZWVwIHBhZ2UgdGFibGUgbWFuaXB1bGF0aW9uIGluIG1tLgoKVGhh
bmtzLAoKVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
