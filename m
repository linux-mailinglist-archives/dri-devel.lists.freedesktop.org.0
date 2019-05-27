Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E92B6BF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56846E200;
	Mon, 27 May 2019 13:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148606E200
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 55B053FB0E;
 Mon, 27 May 2019 15:44:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LObA56TXgF54; Mon, 27 May 2019 15:44:29 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E241D3F954;
 Mon, 27 May 2019 15:44:28 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 551053602FD;
 Mon, 27 May 2019 15:44:28 +0200 (CEST)
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Hellstrom <thellstrom@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
 <20190524152648.GD8938@arch-x1c3>
 <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
 <7dd79b21d58dc74b9b2d81d6aa812fe8d4564596.camel@vmware.com>
 <20190527090826.GA13920@arch-x1c3>
 <c12af67b4b730a0f8b7d61a349e8e5845b14be1d.camel@vmware.com>
 <20190527123552.GD15067@arch-x1c3>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <813d9634-445e-9e1c-aec3-002d2a460e3d@shipmail.org>
Date: Mon, 27 May 2019 15:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527123552.GD15067@arch-x1c3>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558964668; bh=oD11kJtmGUqO1Ubib+LHK/WdqP2WNKtQ+Qgvdp4KENY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iQeChzDPJ2lq9Kd1XYyT1GG7algL+aIJwS4j0dIsJBDUI7JHZTQDn53hmndw2q08T
 9+Psxrlchq9as8PBSJ6HaVNtMeqpxbBbkpVzuRPNLfEPL8DTXfi/MCUfZNY9RHZBn9
 T6YMihDSziRDH57DC/qsx39zzQHUk6TUbuKLw5Kc=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iQeChzDP; 
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yNy8xOSAyOjM1IFBNLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gSGkgVGhvbWFzLAo+Cj4g
T24gMjAxOS8wNS8yNywgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPgo+Pj4gSSB0aGluayB3ZSBt
aWdodCBiZSB0YWxraW5nIHBhc3QgZWFjaCBvdGhlciwgbGV0J3MgdGFrZSBhIHN0ZXAgYmFjazoK
Pj4+Cj4+PiAgIC0gYXMgb2YgcHJldmlvdXMgcGF0Y2gsIGFsbCBvZiB2bXdnZnggaW9jdGxzIHNp
emUgaXMgY29uc2lzdGVudGx5Cj4+PiBoYW5kbGVkIGJ5IHRoZSBjb3JlCj4+IEkgZG9uJ3QgdGhp
bmsgSSBmb2xsb3cgeW91IGhlcmUsIEFGQUlDVCBwYXRjaCAzLzUgb25seSBhZmZlY3RzIGFuZAo+
PiByZWxheGVzIHRoZSBleGVjYnVmIGNoZWNraW5nIChhbmQgaW4gZmFjdCBhIGxpdHRsZSBtb3Jl
IHRoYW4gSSB3b3VsZAo+PiBsaWtlKT8KPj4KPiBQcmVjaXNlbHksIGl0IG1ha2VzIGV4ZWNidWYg
aW9jdGwgYmVoYXZlIGxpa2UgYWxsIG90aGVyIGlvY3RscyAtIGJvdGgKPiB2bXdnZnggYW5kIHJl
c3Qgb2YgZHJtLgoKQnV0IHdlJ3JlIHN0aWxsIGVuZm9yY2luZyBhIG5vbi1yZWxheGVkIHNpemUg
Y2hlY2sgZm9yIHRoZSBvdGhlciB2bXdnZnggCnByaXZhdGUgaW9jdGxzLCByaWdodD8gV2hpY2gg
aXMgcmVsYXhlZCwgdG9nZXRoZXIgd2l0aCB0aGUgZGlyZWN0aW9ucywgCmluIHRoaXMgY29tbWl0
PwoKKE5vdCB0aGF0IGl0IG1hdHRlcnMgbXVjaCB0byB0aGUgZGlzY3Vzc2lvbiwgdGhvdWdoKS4K
Cj4KPj4+ICAgLSBoYW5kbGluZyBvZiBmZWF0dWUgZmxhZ3MsIGFzIGFsd2F5cywgaXMgcmVzcG9u
c2liaWxpdHkgb2YgdGhlCj4+PiBkcml2ZXIKPj4+IGlmc2VsZgo+Pj4gICAtIHdpdGggdGhpcyBw
YXRjaCwgaW9jdGwgZGlyZWN0aW9uIGlzIGFsc28gaGFuZGxlZCBieSBjb3JlLgo+Pj4KPj4+IEhl
cmUgY29yZSBlbnN1cmVzIHdlIG9ubHkgY29weSBpbi9vdXQgYXMgbXVjaCBkYXRhIGFzIHRoZSBr
ZXJuZWwKPj4+IGltcGxlbWVudGF0aW9uIGNhbiBoYW5kbGUuCj4+Pgo+Pj4KPj4+IExldCdzIGNv
bnNpZGVyIHRoZSBmb2xsb3dpbmcgcmVhbCB3b3JsZCBleGFtcGxlIC0gbXNtIGFuZCB2aXJ0aW9f
Z3B1Lgo+Pj4KPj4+IEFuIGluIGZpZWxkIG9mIGFuIF9JT1cgaW9jdGwgYmVjb21lcyBpbi9vdXQg
YWthIF9JT1JXIGlvY3RsLgo+Pj4gICAtIHdlIGFkZCBhIGZsYWcgdG8gYW5ub3RhdGUvcmVxdWVz
dCB0aGUgb3V0LCBhcyBhbHdheXMgaW52YWxpZCBmbGFncwo+Pj4gYXJlIHJldHVybiAtRUlOVkFM
Cj4+PiAgIC0gd2UgY2hhbmdlIHRoZSBpb2N0bCBlbmNvZGluZwo+Pj4KPj4+IEFzIGN1cnJlbnRs
eSBoYW5kbGVkIGJ5IGNvcmUgRFJNLCBvbGQga2VybmVsL25ldyB1c2Vyc3BhY2UgYW5kCj4+PiB2
aWNlLXZlcnNhIHdvcmtzIGp1c3QgZmluZS4gU2FkbHksIHZtd2dmeCB3aWxsIGVycm9yIG91dCwg
d2hpbGUgaXQKPj4+IGNvdWxkCj4+PiBiZSBhdm9pZGVkLgo+PiBJTU8gYmFzaWNhbGx5IHdlIGhh
dmUgYSB0cmFkZW9mZiBiZXR3ZWVuIHN0cmljdCBjaGVja2luZyBpbiB0aGlzIGNhc2UsCj4+IGFu
ZCBuZXcgdXNlci1zcGFjZSB2cyBvbGQga2VybmVsICJoYXp6bGUtZnJlZSIgdHJhbnNpdGlvbiBp
biB0aGUKPj4gcmVsYXhlZCBjYXNlLgo+Pgo+IFByZWNpc2VseS4gSWYgSSByZWFkIHRoZSBjb2Rl
IGNvcnJlY3RseSwgQVRNIG5ldyB1c2Vyc3BhY2Ugd2lsbCBmYWlsCj4gYWdhaW5zdCBvbGQga2Vy
bmVscy4gVW5sZXNzIHVzZXJzcGFjZSB3cml0ZXMgdHdvIHZlcnNpb25zIG9mIHRoZSBpb2N0bCAt
Cj4gd2l0aCB3aXRoIGVhY2ggZW5jb2RpbmcuCj4KPj4+IEFzIHNhaWQgYWJvdmUsIEknbGwgZ2xh
ZGx5IGFkanVzdCBjb3JlIGFuZC9vciBvdGhlcnMsIGlmIHRoaXMgcmVsYXhlZAo+Pj4gYXBwcm9h
Y2ggY2F1c2VzIGFuIGlzc3VlIHNvbWV3aGVyZS4gQSBzcGVjaWZpYyB1c2UtY2FzZSwgcmVhbCBv
cgo+Pj4gaHlwb3RoZXRpY2FsIHdpbGwgYmUgYXBwcmVjaWF0ZWQuCj4+IFRvIG1lIHRoZXJlIGFy
ZSB0d28gaW1wb3J0YW50IHJlYXNvbnMgdG8ga2VlcCB0aGUgc3RyaWN0IGFwcHJvYWNoLgo+Pgo+
PiAxKSBBdm9pZCB1c2VyLXNwYWNlIG1pc3Rha2VzIGVhcmx5IGluIHRoZSBkZXZlbG9wbWVudCBj
eWNsZS4gV2UgY2FuJ3QKPj4gZGlzdGluZ3Vpc2ggYmV0d2VlbiBidWdneSB1c2VyLXNwYWNlIGFu
ZCAibmV3IiB1c2VyLXNwYWNlLiBUaGlzIGlzCj4+IGltcG9ydGFudCBiZWNhdXNlIG9mIFthXSkg
YmVsb3cuCj4+Cj4gQ2FuIHlvdSBwcm92aWRlIGEgY29uY3JldGUgZXhhbXBsZSwgcGxlYXNlPwoK
T0ssIGxldCdzIHNheSB5b3Ugd2VyZSBkZXZlbG9waW5nIGZlbmNlIHdhaXQgZnVuY3Rpb25hbGl0
eS4gTGlrZSAKdm13X2ZlbmNlX29ial93YWl0IGlvY3RsLiBUaGVuIHN1ZGRlbmx5IHlvdSBzdGFy
dGVkIHRvIHdvbmRlciB3aHkgdGhlIAp3YWl0IG5ldmVyIHRpbWVkIG91dCBhcyBpdCBzaG91bGQu
IFRoZSByZWFzb24gdHVybiBvdXQgdG8gYmUgdGhhdCAKc2lnbmFscyB3ZXJlIHJlc3RhcnRpbmcg
dGhlIHdhaXRzIHdpdGggdGhlIG9yaWdpbmFsIHRpbWVvdXQuIFNvIHlvdSAKY2hhbmdlIHRoZSBp
b2N0bCBmcm9tIFcgdG8gUlcgYW5kIGFkZCBhIGtlcm5lbC1jb21wdXRlZCB0aW1lIHRvIHRoZSAK
YXJndW1lbnQuIEV2ZXJ5dGhpbmcgaXMgZmluZSwgZXhjZXB0IHRoYXQgeW91IGZvcmdldCB0byBj
aGFuZ2UgdGhpcyBpbiBhIAp1c2VyLXNwYWNlIGFwcGxpY2F0aW9uIHNvbWV3aGVyZS4KClNvIG5v
dyB3aGF0IGhhcHBlbnMsIGlzIHRoYXQgdGhhdCB1c2VyLXNwYWNlIGJ1ZyBjYW4gbGl2ZSBvbiB1
bmRldGVjdGVkIAphcyBpbiAxKSwgYW5kIHRoYXQgbWVhbnMgeW91IGNhbiBuZXZlciBnbyBiYWNr
IGFuZCBpbXBsZW1lbnQgYSBzdHJpY3RlciAKY2hlY2sgYmVjYXVzZSB0aGF0IHdvdWxkIGNvbXBs
ZXRlbHkgYnJlYWsgb2xkIHVzZXItc3BhY2UuCgpUaGUgY3VycmVudCBjb2RlIHdpbGwgdHJhcCAo
YW5kIGhhcyBoaXN0b3JpY2FsbHkgdHJhcHBlZCkgY29kZSBsaWtlIAp0aGlzLiBUaGF0J3MgbWFp
bmx5IHdoeSBJJ20gcmVsdWN0YW50IHRvIGdpdmUgaXQgdXAsIGJ1dCBJIGd1ZXNzIGl0IGNhbiAK
YmUgY29uZGl0aW9uYWxseSBjb21waWxlZCBpbiBmb3IgZGVidWcgcHVycG9zZXMuCgo+Cj4+IDIp
IENhdGNoIGEgbG90IG9mIGZ1enplciBjb21iaW5hdGlvbnMgYW5kIGVycm9yIG91dCBlYXJseSBp
bnN0ZWFkIG9mCj4+IGZvcndhcmRpbmcgdGhlbSB0byB0aGUgaW9jdGwgZnVuY3Rpb24gd2hlcmUg
dGhleSBtYXkgY2F1c2UgaGFybS4KPj4KPiBTdHJ1Z2dsaW5nIHRvIHNlZSB3aHkgdGhpcyBpcyBh
IHByb2JsZW0/IEF0IHNvbWUgcG9pbnQgdGhlIGZ1enplciB3aWxsCj4gZ2V0IHBhc3QgdGhpcyBm
aXJzdCBsaW5lIG9mIGRlZmVuY2UsIHNvIHdlIHdhbnQgdG8gbWFrZSB0aGUgcmVzdCBvZiB0aGUK
PiBpb2N0bCBpcyByb2J1c3QuCj4KPgo+PiBJIHRoaW5rIHRoZSBuZXcgdXNlci1zcGFjZSB2cyBv
bGQga2VybmVsIGNhbiBiZSBoYW5kbGVkIG5pY2VseSBpbiB1c2VyLQo+PiBzcGFjZSB3aXRoIGZl
YXR1cmUgZmxhZ3Mgb3IgQVBJIHZlcnNpb25zLiBUaGF0J3MgdGhlIHdheSB3ZSd2ZSBoYW5kbGVk
Cj4+IHRoZW0gdXAgdG8gbm93Pwo+Pgo+IEhvdyBpcyBhIGZlYXR1cmUgZmxhZyBkb2luZyB0byBo
ZWxwIGlmIHRoZSBlbmNvZGluZyBjaGFuZ2VzIGZyb20gX0lPVwo+IHRvIF9JT1JXPwoKQWgsIHlv
dSdyZSByZWZlcnJpbmcgdG8gb2xkIHVzZXItc3BhY2UgbmV3IGtlcm5lbD8gWWVzLCBJIHdhcyBw
cm9iYWJseSAKcmVhZGluZyBhIGJpdCB0b28gZmFzdC4gU29ycnkgYWJvdXQgdGhhdC4KClNvIHdl
J3JlIGJhc2ljYWxseSBsYW5kaW5nIGluIGEgdHJhZGVvZmYgYmV0d2VlbiB0cmFwcGluZyBwcm9i
bGVtcyBsaWtlIAphYm92ZSwgYW5kIGhhenpsZS1mcmVlIGlvY3RsIGFyZ3VtZW50IGRlZmluaXRp
b24gY2hhbmdlLgoKT0ssIHNvIEknbSBvayB3aXRoIHRoYXQgYXMgbG9uZyBhcyB0aGVyZSBpcyBh
IHdheSB3ZSBjYW4gY29tcGlsZSBpbiAKc3RyaWN0IGNoZWNraW5nLCB3aGljaCB3aWxsIGxpa2Vs
eSBoYXMgdG8gYmUgYXMgYSB2bXdnZngtc3BlY2lmaWMgd3JhcHBlci4KCi9UaG9tYXMKCgo+Cj4K
PiBUaGFua3MKPiBFbWlsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
