Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4269B76
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 21:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E1989906;
	Mon, 15 Jul 2019 19:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9C889906
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 19:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7137B3F407;
 Mon, 15 Jul 2019 21:35:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-dmPFBDnjrU; Mon, 15 Jul 2019 21:35:47 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 529403F21A;
 Mon, 15 Jul 2019 21:35:46 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B24A5360135;
 Mon, 15 Jul 2019 21:35:45 +0200 (CEST)
Subject: Re: drm pull for v5.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas@shipmail.org>
Organization: VMware Inc.
Message-ID: <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
Date: Mon, 15 Jul 2019 21:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1563219345; bh=VuZsef8kEtw5XdYAWdiDMOKT/1YZxnwCnurJDOo/s/U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VCxYJEsnAvHrlrlOgHSCZdBAhXwpucfsMiLKp5FF6z/uAWF5vlAs7kG52g4HJQzzE
 Dj7mVm88s8PLkQriDlsmox+NCU38ZIU+DUF7C5F20+Ez45FW7E0R1V8K70+lGx3mU1
 1QsDX3sVv5G/MGN6hg3+eQM3B7UpBkGxNfnKAhgk=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=VCxYJEsn; 
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEFsbC4KCk9uIDcvMTUvMTkgODowMCBQTSwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4gT24g
TW9uLCBKdWwgMTUsIDIwMTkgYXQgMTA6MzcgQU0gTGludXMgVG9ydmFsZHMKPiA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+PiBJJ20gbm90IHB1bGxpbmcgdGhpcy4gV2h5
IGRpZCB5b3UgbWVyZ2UgaXQgaW50byB5b3VyIHRyZWUsIHdoZW4KPj4gYXBwYXJlbnRseSB5b3Ug
d2VyZSBhd2FyZSBvZiBob3cgcXVlc3Rpb25hYmxlIGl0IGlzIGp1ZGdpbmcgYnkgdGhlIGRybQo+
PiBwdWxsIHJlcXVlc3QuCj4gTG9va2luZyBhdCBzb21lIG9mIHRoZSBmYWxsb3V0LCBJIGFsc28g
c2VlIHRoYXQgeW91IHRoZW4gYWRkZWQgdGhhdAo+ICJhZGp1c3QgYXBwbHlfdG9fcGZuX3Jhbmdl
IGludGVyZmFjZSBmb3IgZHJvcHBlZCB0b2tlbiIgcGF0Y2ggdGhhdAo+IHNlZW1zIHRvIGJlIGZv
ciBlYXNpZXIgbWVyZ2luZyBvZiB0aGlzIGFsbC4KPgo+IEJ1dCB5b3UgcmVtb3ZlIHRoZSAndG9r
ZW4nIGVudGlyZWx5IGluIG9uZSBwbGFjZSwgYW5kIGluIGFub3RoZXIgeW91Cj4ga2VlcCBpdCBh
bmQganVzdCBzYXkgIndoYXRldmVyLCBpdCdzIHVudXNlZCwgcGFzcyBpbiBOVUxMIi4gV0hBQT8K
Pgo+IEFzIHBhcnQgb2YgbG9va2luZyBhdCB0aGlzIGFsbCwgSSBhbHNvIG5vdGUgdGhhdCBzb21l
IG9mIHRoaXMgaXMgYWxzbwo+IHZlcnkgbm9uLWtlcm5lbHkuCj4KPiBUaGUgd2hvbGUgdGhpbmcg
d2l0aCB0cnlpbmcgdG8gaW1wbGVtZW50IGEgImNsb3N1cmUiIGluIEMgaXMgc2ltcGx5Cj4gbm90
IGhvdyB3ZSBkbyB0aGluZ3MgaW4gdGhlIGtlcm5lbCAoYWx0aG91Z2ggSSd2ZSBhZG1pdHRlZGx5
IHNlZW4KPiBzaWducyBvZiBpdCBpbiBzb21lIGRyaXZlcnMpLgo+Cj4gSWYgdGhpcyBzaG91bGQg
YmUgZG9uZSBhdCBhbGwgKGFuZCB0aGF0J3MgcXVlc3Rpb25hYmxlKSwgYXQgbGVhc3QgZG8KPiBp
dCBpbiB0aGUgY2Fub25pY2FsIGtlcm5lbCB3YXk6IHBhc3MgaW4gYSBzZXBhcmF0ZSAiYWN0b3Ii
IGZ1bmN0aW9uCj4gcG9pbnRlciBhbmQgYW4gYXJndW1lbnQgYmxvY2ssIGRvbid0IHRyeSB0byBt
aXggZnVuY3Rpb24gcG9pbnRlcnMgYW5kCj4gYXJndW1lbnQgZGF0YSBhbmQgY2FsbCBpdCBhICJj
bG9zdXJlIi4KPgo+IFdlIHRyeSB0byBrZWVwIGRhdGEgYW5kIGZ1bmN0aW9ucyBzZXBhcmF0ZS4g
SXQncyBub3QgZXZlbiBmb3Igc2VjdXJpdHkKPiBjb25jZXJucyAoYWx0aG91Z2ggdGhvc2UgaGF2
ZSBjYXVzZWQgc29tZSBzcGxpdHMgaW4gdGhlIHBhc3QgLSBhdm9pZAo+IHB1dHRpbmcgZnVuY3Rp
b24gcG9pbnRlcnMgaW4gc3RydWN0dXJlcyB0aGF0IHlvdSB0aGVuIGNhbid0IG1hcmsKPiByZWFk
LW9ubHkhKSwgaXQncyBhIG1vcmUgZ2VuZXJpYyBpc3N1ZSBvZiBqdXN0IGtlZXBpbmcgYXJndW1l
bnRzIGFzCj4gYXJndW1lbnRzIC0gZXZlbiBpZiB5b3UgdGhlbiBtYWtlIGEgc3RydWN0dXJlIG9m
IHRoZW0gaW4gb3JkZXIgdG8gbm90Cj4gbWFrZSB0aGUgY2FsbGluZyBjb252ZW50aW9uIHZlcnkg
Y29tcGxpY2F0ZWQuCj4KPiAoWWVzLCB3ZSBkbyBoYXZlIHRoZSBwYXR0ZXJuIG9mIHNvbWV0aW1l
cyBtaXhpbmcgZnVuY3Rpb24gcG9pbnRlcnMKPiB3aXRoICJkZXNjcmliaW5nIGRhdGEiLCBpZSB0
aGUgInN0cnVjdCBmaWxlX29wZXJhdGlvbnMiIHN0cnVjdHVyZQo+IGlzbid0IF9qdXN0XyBhY3R1
YWwgZnVuY3Rpb24gcG9pbnRlcnMsIGl0IGFsc28gY29udGFpbnMgdGhlIG1vZHVsZQo+IG93bmVy
LCBmb3IgZXhhbXBsZS4gQnV0IHRob3NlIGFyZW4ndCBhYm91dCBtaXhpbmcgZnVuY3Rpb24gcG9p
bnRlcnMKPiB3aXRoIHRoZWlyIGFyZ3VtZW50cywgaXQncyBhYm91dCBiYXNpY2FsbHkgImRlc2Ny
aWJpbmciIGFuIG9iamVjdAo+IGludGVyZmFjZSB3aXRoIG1vcmUgdGhhbiBqdXN0IHRoZSBvcGVy
YXRpb24gcG9pbnRlcnMpLgo+Cj4gU28gc29tZSBvZiB0aGlzIGNvZGUgaXMgc3R1ZmYgdGhhdCBJ
IHdvdWxkIGhhdmUgbGV0IGdvIGlmIGl0IHdhcyBpbgo+IHNvbWUgaW5kaXZpZHVhbCBkcml2ZXIg
KCJDbG9zdXJlcz8gQyBkb2Vzbid0IGhhdmUgY2xvc3VyZXMhIEJ1dAo+IHdoYXRldmVyIC0gdGhh
dCBkcml2ZXIgd3JpdGVyIGNhbWUgZnJvbSBzb21lIHBsYWNlIHRoYXQgdGF1Z2h0IGxhbWRhCj4g
Y2FsY3VsdXMgYmVmb3JlIHRlY2huaW5nIEMiKS4KPgo+IEJ1dCBpbiB0aGUgY29yZSBtbSBjb2Rl
LCBJIHdhbnQgcmV2aWV3cy4gQW5kIEkgd2FudCB0aGUgY29kZSB0byBmb2xsb3cKPiBub3JtYWwg
a2VybmVsIGNvbnZlbnRpb25zLgoKU29ycnkgZm9yIGNyZWF0aW5nIHRoaXMgbWVzcywgSSBndWVz
cyBJIG5lZWQgdG8gdGFrZSBhbm90aGVyIHNwaW4gYXQgCnRoaXMsIGJ1dCBmaXJzdCBJJ2QgbGlr
ZSB0byBzdHJhaWdodGVuIG91dCBhIGZldyBkZXRhaWxzOgoKLSBJJ3ZlIG5ldmVyIGhhZCBhbnkg
a2VybmVsIGNvZGUgbW9yZSByZXZpZXdlZCB0aGFuIHRoaXMuIEl0J3MgYmVlbiBvdXQgCm9uIExL
TUwgYW5kIG1tLWxpc3QgYW5kIG1haW50YWluZXJzIEkgdGhpbmsgOCB0aW1lcyBpbmNsdWRpbmcg
dGhlIFJGQy4gClRoZSBsYXN0IHRpbWUgSSB3YXMgZXhwbGljaXRseSBhc2tpbmcgaWYgYW55Ym9k
eSBoYWQgYW55IG9iamVjdGlvbnMgCmJlY2F1c2UgSSB3YW50ZWQgdG8gZ2V0IGl0IG1lcmdlZC4g
SXQncyBub3QgYW4gaW50ZXJuYWxseS1yZXZpZXdlZC1vbmx5IAp0aGluZy4gVGhlcmUgaGF2ZSBi
ZWVuIGEgbnVtYmVyIG9mIHBlb3BsZSBsb29raW5nIGF0IHRoZSBjb2RlIGFuZCAKbGVhdmluZyBj
b21tZW50cyBhbmQgcmVxdWVzdGluZyBmaXhlcyBpbmNsdWRpbmcgUmFscGggQ2FtcGJlbGwsIEpl
cm9tZSAKR2xpc3NlLCBTb3VwdGljayBKb2FyZGVyLCBOYWRhdiBBbWl0IGFuZCBDaHJpc3RvcGgg
SGVsbHdpZy4gUGVyaGFwcyBJIApzaG91bGQgaGF2ZSBiZWVuIG1vcmUgZXhwbGljaXQgaW4gcmVx
dWVzdGluZyBSLUJzIGFmdGVyIGZpeGluZyB1cCBhbGwgCnJldmlldyBjb21tZW50cywgYnV0IEkg
ZGlkbid0LiBOb25lIG9mIHRoZW0gaGFkIGFueSBpc3N1ZXMgc2ltaWxhciB0byAKdGhlIG9uZXMg
eW91IGRlc2NyaWJlIGFib3ZlLgoKLSBUaGUgY29tYmluZWQgY2FsbGJhY2sgLyBhcmd1bWVudCBz
dHJ1Y3Q6IEl0IHdhcyBzdHJvbmdseSBpbnNwaXJlZCBieSAKdGhlIHN0cnVjdCBtbV93YWxrICht
bS5oKSwgdGhlIHBhZ2Ugd2FsayBjb2RlIGJlaW5nIHF1aXRlIHNpbWlsYXIgaW4gCmZ1bmN0aW9u
YWxpdHkuICJDbG9zdXJlIiBpcyBwZXJoYXBzIGEgYmFkIG5hbWUuIE9yaWdpbmF0ZXMgaW4gWCBz
ZXJ2ZXIgY29kZS4KClRoYW5rcywKVGhvbWFzCgoKPiAgICAgICAgICAgICAgICAgICAgIExpbnVz
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
