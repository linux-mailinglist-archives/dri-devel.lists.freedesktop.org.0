Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA82B89B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 17:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406F89B65;
	Mon, 27 May 2019 15:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617B89B65
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 15:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1425A402B4;
 Mon, 27 May 2019 17:51:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYBSS75eD9Vn; Mon, 27 May 2019 17:50:56 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 27B4D402A9;
 Mon, 27 May 2019 17:50:55 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 9EE1836006D;
 Mon, 27 May 2019 17:50:55 +0200 (CEST)
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
 <20190524152648.GD8938@arch-x1c3>
 <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
 <7dd79b21d58dc74b9b2d81d6aa812fe8d4564596.camel@vmware.com>
 <20190527090826.GA13920@arch-x1c3>
 <c12af67b4b730a0f8b7d61a349e8e5845b14be1d.camel@vmware.com>
 <20190527123552.GD15067@arch-x1c3>
 <813d9634-445e-9e1c-aec3-002d2a460e3d@shipmail.org>
 <20190527152715.GJ15067@arch-x1c3>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <da6358a4-b892-241a-31e8-35b571822b15@shipmail.org>
Date: Mon, 27 May 2019 17:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527152715.GJ15067@arch-x1c3>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558972255; bh=T5IjAAGVPPfwDAj+b2KP8LRS/3QP98rFZ0IZ4qOaIQ4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=earm/CMt5nCEh9NaGhOHdiq2vO6EU5KhUbIWTdTZEcjesF1ySjNtEtT/gcNxfkal/
 o8vXFz9aB/NeU7JiemYX0gH7MloBD1/RUNSsoeGYwjIHKIBVmtXAZif/YV2hC3tyaB
 kbB9Kju4wd0usYN07YhLSr/ZR7C5ZdDLPZUGjT1g=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=earm/CMt; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yNy8xOSA1OjI3IFBNLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gT24gMjAxOS8wNS8yNywg
VGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPj4gT24gNS8yNy8xOSAyOjM1IFBNLCBFbWlsIFZlbGlr
b3Ygd3JvdGU6Cj4+PiBIaSBUaG9tYXMsCj4+Pgo+Pj4gT24gMjAxOS8wNS8yNywgVGhvbWFzIEhl
bGxzdHJvbSB3cm90ZToKPj4+Cj4+Pj4+IEkgdGhpbmsgd2UgbWlnaHQgYmUgdGFsa2luZyBwYXN0
IGVhY2ggb3RoZXIsIGxldCdzIHRha2UgYSBzdGVwIGJhY2s6Cj4+Pj4+Cj4+Pj4+ICAgIC0gYXMg
b2YgcHJldmlvdXMgcGF0Y2gsIGFsbCBvZiB2bXdnZnggaW9jdGxzIHNpemUgaXMgY29uc2lzdGVu
dGx5Cj4+Pj4+IGhhbmRsZWQgYnkgdGhlIGNvcmUKPj4+PiBJIGRvbid0IHRoaW5rIEkgZm9sbG93
IHlvdSBoZXJlLCBBRkFJQ1QgcGF0Y2ggMy81IG9ubHkgYWZmZWN0cyBhbmQKPj4+PiByZWxheGVz
IHRoZSBleGVjYnVmIGNoZWNraW5nIChhbmQgaW4gZmFjdCBhIGxpdHRsZSBtb3JlIHRoYW4gSSB3
b3VsZAo+Pj4+IGxpa2UpPwo+Pj4+Cj4+PiBQcmVjaXNlbHksIGl0IG1ha2VzIGV4ZWNidWYgaW9j
dGwgYmVoYXZlIGxpa2UgYWxsIG90aGVyIGlvY3RscyAtIGJvdGgKPj4+IHZtd2dmeCBhbmQgcmVz
dCBvZiBkcm0uCj4+IEJ1dCB3ZSdyZSBzdGlsbCBlbmZvcmNpbmcgYSBub24tcmVsYXhlZCBzaXpl
IGNoZWNrIGZvciB0aGUgb3RoZXIgdm13Z2Z4Cj4+IHByaXZhdGUgaW9jdGxzLCByaWdodD8gV2hp
Y2ggaXMgcmVsYXhlZCwgdG9nZXRoZXIgd2l0aCB0aGUgZGlyZWN0aW9ucywgaW4KPj4gdGhpcyBj
b21taXQ/Cj4+Cj4gUmVnYXJkbGVzcyBvZiB0aGUgcGF0Y2gsIGFsbCAhZXhlY2J1ZiB2bXdnZngg
aW9jdGxzIHVzZSB0aGUgcmVsYXRlZCBzaXplCj4gY2hlY2tpbmcgZnJvbSBjb3JlIGRybS4KCldl
bGwgaXQgZG9lcywgYnV0IHNpbmNlIHdlIChiZWZvcmUgdGhpcyBwYXRjaCkgZW5mb3JjZSBpb2N0
bC0+Y21kID09IApjbWQsIHdlIGFsc28gZW5mb3JjZQpfSU9DX1NJWkUoaW9jdGwtPmNtZCkgPT0g
X0lPQ19TSVpFKGNtZCksIHdoaWNoIG1ha2VzIHRoZSBjb3JlIGNoZWNrIApwb2ludGxlc3MsIG9y
IGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cgo+Cj4+IChOb3QgdGhhdCBpdCBtYXR0ZXJzIG11Y2gg
dG8gdGhlIGRpc2N1c3Npb24sIHRob3VnaCkuCj4+Cj4gQWdyZWVkLgo+Cj4+PgouLi4KPj4+IENh
biB5b3UgcHJvdmlkZSBhIGNvbmNyZXRlIGV4YW1wbGUsIHBsZWFzZT8KPj4gT0ssIGxldCdzIHNh
eSB5b3Ugd2VyZSBkZXZlbG9waW5nIGZlbmNlIHdhaXQgZnVuY3Rpb25hbGl0eS4gTGlrZQo+PiB2
bXdfZmVuY2Vfb2JqX3dhaXQgaW9jdGwuIFRoZW4gc3VkZGVubHkgeW91IHN0YXJ0ZWQgdG8gd29u
ZGVyIHdoeSB0aGUgd2FpdAo+PiBuZXZlciB0aW1lZCBvdXQgYXMgaXQgc2hvdWxkLiBUaGUgcmVh
c29uIHR1cm4gb3V0IHRvIGJlIHRoYXQgc2lnbmFscyB3ZXJlCj4+IHJlc3RhcnRpbmcgdGhlIHdh
aXRzIHdpdGggdGhlIG9yaWdpbmFsIHRpbWVvdXQuIFNvIHlvdSBjaGFuZ2UgdGhlIGlvY3RsIGZy
b20KPj4gVyB0byBSVyBhbmQgYWRkIGEga2VybmVsLWNvbXB1dGVkIHRpbWUgdG8gdGhlIGFyZ3Vt
ZW50LiBFdmVyeXRoaW5nIGlzIGZpbmUsCj4+IGV4Y2VwdCB0aGF0IHlvdSBmb3JnZXQgdG8gY2hh
bmdlIHRoaXMgaW4gYSB1c2VyLXNwYWNlIGFwcGxpY2F0aW9uIHNvbWV3aGVyZS4KPj4KPj4gU28g
bm93IHdoYXQgaGFwcGVucywgaXMgdGhhdCB0aGF0IHVzZXItc3BhY2UgYnVnIGNhbiBsaXZlIG9u
IHVuZGV0ZWN0ZWQgYXMKPj4gaW4gMSksIGFuZCB0aGF0IG1lYW5zIHlvdSBjYW4gbmV2ZXIgZ28g
YmFjayBhbmQgaW1wbGVtZW50IGEgc3RyaWN0ZXIgY2hlY2sKPj4gYmVjYXVzZSB0aGF0IHdvdWxk
IGNvbXBsZXRlbHkgYnJlYWsgb2xkIHVzZXItc3BhY2UuCj4+Cj4gSWYgSSB1bmRlcnN0YW5kIHlv
dSBjb3JyZWN0bHksIHRoZSBXIC0+IFJXIGNoYW5nZSBpbiB1bm5lY2Vzc2FyeS4gWWV0Cj4gdGhl
IG9ubHkgbmVnYXRpdmUgZWZmZWN0IHRoYXQgSSBjYW4gc2VlIGlzIHRoZSBjb3B5X3RvX3VzZXIo
KSBvdmVyaGVhZC4KPgo+IFRoZSBjb3B5IHNob3VsZCBiZSBuZWdsaWdpYmxlLCB5ZXQgaXQgImZl
ZWxzIiBzaWxseS4KPgo+IElzIHRoZXJlIGFueXRoaW5nIG1vcmUgc2VyaW91cyB0aGF0IEkndmUg
bWlzc2VkPwoKV2VsbCB0aGUgcG9pbnQgaXMgaW4gdGhpcyBjYXNlLCB0aGF0IHRoZSB3cml0ZSB3
YXMgbmVjZXNzYXJ5LCBidXQgdGhlIApjb2RlIHdvdWxkIHdvcmsgc29ydCBvZiBPSyBhbnl3YXku
IEl0IHVwZGF0ZWQgYSBrZXJuZWwgImNvb2tpZSIgdG8gbWFrZSAKc3VyZSB0aGUgdGltZW91dCB3
b3VsZCBiZSBjb3JyZWN0IGV2ZW4gd2l0aCB0aGUgbmV4dCBjYWxsIHJlcGV0aXRpb24uIApOb3cg
aWYgYW4gb2xkIGhlYWRlciB3YXMgZmxvYXRpbmcgYXJvdW5kLCB0aGVyZSBtaWdodCBiZSBjbGll
bnRzIHVzaW5nIAppdC4gQW5kIHdpdGggdGhlIGN1cnJlbnQgY29yZSBjaGVja3MgdGhhdCB0eXBp
Y2FsbHkgd291bGRuJ3QgZ2V0IApub3RpY2VkLiBXaXRoIHRoZSBjaGVjayB3ZSdkIGltbWVkaWF0
ZWx5IG5vdGljZSBhbmQgYWJvcnQuIEl0IGZlZWxzIGEgCmxpdHRsZSBsaWtlIG1vdmluZyBmcm9t
IEFOU0kgQyB0byBLJlIuLi4gOi0pCgo+Cj4KPiBIYXZpbmcgYSBjbG9zZXIgbG9vayAtIHZtd2dm
eCAoZXQgYWwpIHNlZW1zIHRvIHN0YW5kIG91dCwgc3VjaCB0aGF0IGl0Cj4gZG9lcyBub3QgcHJv
dmlkZSBhIFVBQkkgZGVmaW5lIGluY2x1ZGluZyB0aGUgZW5jb2RpbmcuIEhlbmNlIGl0IHNvcnQg
b2YKPiBkdXBsaWNhdGVzIHRoYXQgaW4gdXNlcnNwYWNlLCBieSB1c2luZyB0aGUgZXhwbGljaXQg
ZHJtQ29tbWFuZCoKPgo+IEd1ZXNzIEkgY291bGQgZm9sbG93IHRoZSBzdWdnZXN0aW9uIGluIHZt
d2dmeF9kcnYuYyBtb3ZlIHRoZSBkZWZpbmVzIHRvCj4gVUFCSSwgc3luYyBoZWFkZXIgYW5kIHVw
ZGF0ZSBtZXNhL3hmODYtdmlkZW8tdm13Z2Z4Lgo+Cj4gV2hhdCBkbyB5b3UgdGhpbmsgLSB5ZXMs
IG9yIHBsZWFzZSBkb24ndD8KClBsZWFzZSBob2xkIG9uIGZvciBhIHdoaWxlLCBhbmQgSSdsbCBk
aXNjdXNzIGl0IGludGVybmFsbHkuCgo+Cj4+IFRoZSBjdXJyZW50IGNvZGUgd2lsbCB0cmFwIChh
bmQgaGFzIGhpc3RvcmljYWxseSB0cmFwcGVkKSBjb2RlIGxpa2UgdGhpcy4KPj4gVGhhdCdzIG1h
aW5seSB3aHkgSSdtIHJlbHVjdGFudCB0byBnaXZlIGl0IHVwLCBidXQgSSBndWVzcyBpdCBjYW4g
YmUKPj4gY29uZGl0aW9uYWxseSBjb21waWxlZCBpbiBmb3IgZGVidWcgcHVycG9zZXMuCj4+Cj4g
VGhpcyBwaWVjZSBoZXJlLCBpcyB0aGUgaG9sbHkgZ3JhaWwuIEknbGwgZ28gZnVydGhlciBhbmQg
c3VnZ2VzdDoKPgo+ICAgLSBhZGQgYSBzdHJpY3QgZW5jb2RpbmcgYW5kIHNpemUgY2hlY2ssIGJl
aGluZCBhIGNvbmZpZyB0b2dnbGUKPiAgIC0gbWFrZSBpdCBhIGNvcmUgZHJtIHRoaW5nIGFuZCBk
cm9wIHRoZSBjdXN0b20gdm13Z2Z4IG9uZQo+Cj4gV2lsbCBrZWVwIGl0IGRpc2FibGVkIGJ5IGRl
ZmF1bHQgLSBidXQgd2lsbCBjbGVhcmx5IGRvY3VtZW50IEtjb25maWcgYW5kCj4gZG9jcyB0aGF0
IGRldnMgc2hvdWxkIHRvZ2dsZSBpdCB0byBjYXRjaCBidWdzLgoKU291bmRzIGdvb2QsIGJ1dCBJ
SVJDIHRoZSByZWFzb24gd2h5IEkga2VwdCBpdCBvbmx5IHRvIGRyaXZlci1wcml2YXRlIAppb2N0
bHMsIGlzIHRoYXQgdGhlcmUgd2VyZSBlcnJvcnMgd2l0aCB0aGUgZHJtIGlvY3Rscy4gQnV0IHRo
YXQgd2FzIGEgCmxvbmcgdGltZSBhZ28gc28gSSBtaWdodCByZW1lbWJlciBpbmNvcnJlY3RseSwg
b3IgdXNlci1zcGFjZSBoYXMgYmVlbiBmaXhlZC4KCj4KPj4+PiAyKSBDYXRjaCBhIGxvdCBvZiBm
dXp6ZXIgY29tYmluYXRpb25zIGFuZCBlcnJvciBvdXQgZWFybHkgaW5zdGVhZCBvZgo+Pj4+IGZv
cndhcmRpbmcgdGhlbSB0byB0aGUgaW9jdGwgZnVuY3Rpb24gd2hlcmUgdGhleSBtYXkgY2F1c2Ug
aGFybS4KPj4+Pgo+Pj4gU3RydWdnbGluZyB0byBzZWUgd2h5IHRoaXMgaXMgYSBwcm9ibGVtPyBB
dCBzb21lIHBvaW50IHRoZSBmdXp6ZXIgd2lsbAo+Pj4gZ2V0IHBhc3QgdGhpcyBmaXJzdCBsaW5l
IG9mIGRlZmVuY2UsIHNvIHdlIHdhbnQgdG8gbWFrZSB0aGUgcmVzdCBvZiB0aGUKPj4+IGlvY3Rs
IGlzIHJvYnVzdC4KPj4+Cj4+Pgo+Pj4+IEkgdGhpbmsgdGhlIG5ldyB1c2VyLXNwYWNlIHZzIG9s
ZCBrZXJuZWwgY2FuIGJlIGhhbmRsZWQgbmljZWx5IGluIHVzZXItCj4+Pj4gc3BhY2Ugd2l0aCBm
ZWF0dXJlIGZsYWdzIG9yIEFQSSB2ZXJzaW9ucy4gVGhhdCdzIHRoZSB3YXkgd2UndmUgaGFuZGxl
ZAo+Pj4+IHRoZW0gdXAgdG8gbm93Pwo+Pj4+Cj4+PiBIb3cgaXMgYSBmZWF0dXJlIGZsYWcgZG9p
bmcgdG8gaGVscCBpZiB0aGUgZW5jb2RpbmcgY2hhbmdlcyBmcm9tIF9JT1cKPj4+IHRvIF9JT1JX
Pwo+PiBBaCwgeW91J3JlIHJlZmVycmluZyB0byBvbGQgdXNlci1zcGFjZSBuZXcga2VybmVsPyBZ
ZXMsIEkgd2FzIHByb2JhYmx5Cj4+IHJlYWRpbmcgYSBiaXQgdG9vIGZhc3QuIFNvcnJ5IGFib3V0
IHRoYXQuCj4+Cj4+IFNvIHdlJ3JlIGJhc2ljYWxseSBsYW5kaW5nIGluIGEgdHJhZGVvZmYgYmV0
d2VlbiB0cmFwcGluZyBwcm9ibGVtcyBsaWtlCj4+IGFib3ZlLCBhbmQgaGF6emxlLWZyZWUgaW9j
dGwgYXJndW1lbnQgZGVmaW5pdGlvbiBjaGFuZ2UuCj4+Cj4+IE9LLCBzbyBJJ20gb2sgd2l0aCB0
aGF0IGFzIGxvbmcgYXMgdGhlcmUgaXMgYSB3YXkgd2UgY2FuIGNvbXBpbGUgaW4gc3RyaWN0Cj4+
IGNoZWNraW5nLCB3aGljaCB3aWxsIGxpa2VseSBoYXMgdG8gYmUgYXMgYSB2bXdnZngtc3BlY2lm
aWMgd3JhcHBlci4KPj4KPiBBY2ssIEknbGwgcHJvY2VlZCB3aXRoIHRoZSBkZWJ1ZyB0b2dnbGUg
c3VnZ2VzdGlvbi4KCkdyZWF0LgoKCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBpbnNpZ2h0ZnVsIGlu
cHV0Lgo+IEVtaWwKClRoYW5rcywKClRob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
