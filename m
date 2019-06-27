Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4372D57F22
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 11:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEA16E83A;
	Thu, 27 Jun 2019 09:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F8F6E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 09:20:20 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hgQZk-00067w-Bx; Thu, 27 Jun 2019 11:20:16 +0200
Message-ID: <1561627215.2587.38.camel@pengutronix.de>
Subject: Re: [REGRESSION] drm/etnaviv: command buffer outside valid memory
 window
From: Lucas Stach <l.stach@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Fabio Estevam
 <festevam@gmail.com>, christian.gmeiner@gmail.com
Date: Thu, 27 Jun 2019 11:20:15 +0200
In-Reply-To: <20190622161623.eiameq5dmcysbqor@shell.armlinux.org.uk>
References: <20190622161623.eiameq5dmcysbqor@shell.armlinux.org.uk>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gU2Ftc3RhZywgZGVuIDIyLjA2LjIwMTksIDE3OjE2ICswMTAwIHNjaHJpZWIgUnVzc2VsbCBL
aW5nIC0gQVJNIExpbnV4IGFkbWluOgo+IFdoaWxlIHVwZGF0aW5nIG15IHZhcmlvdXMgc3lzdGVt
cyBmb3IgdGhlIFRDUCBTQUNLIGlzc3VlLCBJIG5vdGljZQo+IHRoYXQgd2hpbGUgbW9zdCBwbGF0
Zm9ybXMgYXJlIGhhcHB5LCB0aGUgQ3Vib3gtaTQgaXMgbm90LsKgwqBEdXJpbmcKPiBib290LCB3
ZSBnZXQ6Cj4gCj4gW8KgwqDCoMKgMC4wMDAwMDBdIGNtYTogUmVzZXJ2ZWQgMjU2IE1pQiBhdCAw
eDMwMDAwMDAwCj4gLi4uCj4gW8KgwqDCoMKgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6
IGNvbnNvbGU9dHR5bXhjMCwxMTUyMDBuOCBjb25zb2xlPXR0eTEgdmlkZW89bXhjZmIwOmRldj1o
ZG1pIHJvb3Q9L2Rldi9uZnMgcncgY21hPTI1Nk0gYWhjaV9pbXguaG90cGx1Zz0xIHNwbGFzaCBy
ZXN1bWU9L2Rldi9zZGExCj4gW8KgwqDCoMKgMC4wMDAwMDBdIERlbnRyeSBjYWNoZSBoYXNoIHRh
YmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDcsIDUyNDI4OCBieXRlcykKPiBbwqDCoMKgwqAw
LjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA2NTUzNiAob3JkZXI6IDYs
IDI2MjE0NCBieXRlcykKPiBbwqDCoMKgwqAwLjAwMDAwMF0gTWVtb3J5OiAxNzkwOTcySy8yMDk3
MTUySyBhdmFpbGFibGUgKDg0NzFLIGtlcm5lbCBjb2RlLCA2OTNLIHJ3ZGF0YSwgMjg0NEsgcm9k
YXRhLCA1MDBLIGluaXQsIDgwNjJLIGJzcywgNDQwMzZLIHJlc2VydmVkLCAyNjIxNDRLIGNtYS1y
ZXNlcnZlZCwgMTMxMDcyMEsgaGlnaG1lbSkKPiAuLi4KPiBbwqDCoMKgMTMuMTAxMDk4XSBldG5h
dml2LWdwdSAxMzAwMDAuZ3B1OiBjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkIG1lbW9yeSB3
aW5kb3cKPiBbwqDCoMKgMTMuMTcxOTYzXSBldG5hdml2LWdwdSAxMzQwMDAuZ3B1OiBjb21tYW5k
IGJ1ZmZlciBvdXRzaWRlIHZhbGlkIG1lbW9yeSB3aW5kb3cKClllcywgdGhhdCdzIGEgcmVncmVz
c2lvbiBkdWUgdG8gZGlmZmVyZW50IGRlZmF1bHQgQ01BIGFyZWEgcGxhY2VtZW50CmFuZCBldG5h
dml2IG5vdCBiZWluZyBzbWFydCBlbm91Z2ggdG8gbW92ZSB0aGUgbGluZWFyIHdpbmRvdyB0byB0
aGUKcmlnaHQgb2Zmc2V0LgoKUGF0Y2hlcyB0byBmaXggdGhpcyAoYnV0IGhhdmUgcmlnaHRmdWxs
eSBiZWVuIHNob3QgZG93biwgZHVlIHRvCmxheWVyaW5nIHZpb2xhdGlvbnMpIGFyZSAiW1BBVENI
IDEvMl0gbW06IGNtYTogZXhwb3J0IGZ1bmN0aW9ucyB0byBnZXQKQ01BIGJhc2UgYW5kIHNpemUi
IGFuZCAiW1BBVENIIDIvMl0gZHJtL2V0bmF2aXY6IHVzZSBDTUEgYXJlYSB0bwpjb21wdXRlIGxp
bmVhciB3aW5kb3cgb2Zmc2V0IGlmIHBvc3NpYmxlIi4KCj4gYW5kIHNob3J0bHkgYWZ0ZXIgdGhl
IGxvZ2luIHByb21wdCBhcHBlYXJzLCB0aGUgZW50aXJlIFNvQyBhcHBlYXJzIHRvCj4gbG9jayB1
cCAtIGl0IGJlY29tZXMgdW5yZXNwb25zaXZlIG9uIHRoZSBuZXR3b3JrLCBvciB2aWEgc2VyaWFs
IGNvbnNvbGUKPiB0byBzeXNycSByZXF1ZXN0cy4KPiAKPiBJIHN1c3BlY3QgdGhlIEdQVSBlbmRz
IHVwIHNjcmliYmxpbmcgb3ZlciB0aGUgQ1BVJ3MgdmVjdG9yIHBhZ2Uva2VybmVsCj4gYXMgYSBy
ZXN1bHQgb2YgdGhlIGFib3ZlIHR3byBldG5hdml2IGVycm9ycyB3aGVuIFhvcmcgYXR0ZW1wdHMg
dG8gc3RhcnQKPiB1c2luZyB0aGUgR1BVLgoKVGhpcyBzaG91bGQgbm90IGJlIHBvc3NpYmxlLiBU
aGUgZHJpdmVyIG5vdGljZXMgdGhhdCB0aGUgY29tbWFuZCBidWZmZXIKaXNuJ3QgYWNjZXNzaWJs
ZSB0byB0aGUgR1BVLCB3aGljaCBhYm9ydHMgdGhlIEdQVSBpbml0LiBXaGlsZSB0aGUKZXRuYXZp
diBEUk0gZGV2aWNlIGlzIHN0aWxsIGFjY2Vzc2libGUsIGl0IHdpbGwgbm90IGV4cG9zZSBhbnkK
ZW51bWVyYWJsZSBHUFUgY29yZXMgdG8gdXNlcnNwYWNlLiBTbyB0aGVyZSBpcyBubyB3YXkgZm9y
IHVzZXJzcGFjZSB0bwphY3R1YWxseSBzdWJtaXQgR1BVIGNvbW1hbmRzLgoKUmVnYXJkcywKTHVj
YXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
