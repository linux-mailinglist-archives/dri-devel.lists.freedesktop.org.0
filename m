Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C7343C9B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBE089DE6;
	Mon, 22 Mar 2021 09:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB15689DE6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:20:48 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lOGju-0006zZ-G0; Mon, 22 Mar 2021 10:20:46 +0100
Message-ID: <4f96f825f90836066dd89ab33e0c71e3cb922d91.camel@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Mon, 22 Mar 2021 10:20:45 +0100
In-Reply-To: <CAH9NwWeYO_WsYTtsri6E5dRfWYhD0FrUohK99jx_gZHVHJRukA@mail.gmail.com>
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
 <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
 <CAH9NwWeYO_WsYTtsri6E5dRfWYhD0FrUohK99jx_gZHVHJRukA@mail.gmail.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKQW0gTW9udGFnLCBkZW0gMjIuMDMuMjAyMSB1bSAwOTo1NCArMDEwMCBz
Y2hyaWViIENocmlzdGlhbiBHbWVpbmVyOgo+IEFtIFNhLiwgMjAuIE3DpHJ6IDIwMjEgdW0gMjA6
MTEgVWhyIHNjaHJpZWIgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjoKPiA+IAo+ID4g
T24gU2F0LCBNYXIgMjAsIDIwMjEgYXQgMTA6MjggQU0gQ2hyaXN0aWFuIEdtZWluZXIKPiA+IDxj
aHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiAKPiA+ID4gSGkgTHVjYXMK
PiA+ID4gCj4gPiA+IEFtIEZyLiwgMTkuIE3DpHJ6IDIwMjEgdW0gMjA6MDYgVWhyIHNjaHJpZWIg
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ogo+ID4gPiA+IAo+ID4gPiA+IFZp
dmFudGUgVFMgKHRpbGUtc3RhdHVzKSBidWZmZXIgbW9kaWZpZXJzLiBUaGV5IGNhbiBiZSBjb21i
aW5lZCB3aXRoIGFsbCBvZgo+ID4gPiA+IHRoZSBWaXZhbnRlIGNvbG9yIGJ1ZmZlciB0aWxpbmcg
bW9kaWZpZXJzLCBzbyB0aGV5IGFyZSBraW5kIG9mIGEgbW9kaWZpZXIKPiA+ID4gPiBtb2RpZmll
ci4gSWYgYSBUUyBtb2RpZmllciBpcyBwcmVzZW50IHdlIGhhdmUgYSBhZGRpdGlvbmFsIHBsYW5l
IGZvciB0aGUKPiA+ID4gPiBUUyBidWZmZXIgYW5kIHRoZSBtb2RpZmllciBkZWZpbmVzIHRoZSBs
YXlvdXQgb2YgdGhpcyBUUyBidWZmZXIuCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBJIGFtIHVuc3Vy
ZSB3aHkgeW91IHdhbnQgdG8gaGF2ZSB0aGUgVFMgbW9kaWZpZXJzIGluIGRybV9mb3VyY2MuaC4g
Q2FuCj4gPiA+IHlvdSBzaGFyZSBzb21lIGluc2lnaHQgb24gdGhpcz8KPiA+IAo+ID4gSXQncyB0
aGUgb2ZmaWNpYWwgcmVnaXN0cnkgZm9yIGRybV9mb3VyY2MgY29kZXMgYW5kIGRybSBtb2RpZmll
cnMuCj4gPiBXaGV0aGVyIHRoZSBrZXJuZWwgZXZlciB1c2VzIGl0IG9yIG5vdCBkb2Vzbid0IG1h
dHRlci4KPiAKPiBGYWlyIHBvaW50Li4gYnV0IEkgZG8gbm90IHNlZSBhbnkgdXNhZ2Ugb2YgdGhl
c2UgVFMgbW9kaWZpZXJzIGluIG1lc2EKPiAtIHRoYXQncyB3aHkgSSBhbSBhc2tpbmcuCgpJIGhh
dmUgYSBNZXNhIHNlcmllcyB1c2luZyB0aG9zZSBtb2RpZmllcnMsIHdoaWNoIEknbSBjdXJyZW50
bHkKcmViYXNpbmcgYW5kIHdpbGwgYmUgcG9zdGVkIHNob3J0bHkuIEhvd2V2ZXIsIHRoZSB3YXkg
dGhpbmdzIHdvcmsgaXM6CmZpcnN0IGdldCB0aGUgbW9kaWZpZXIgaW50byBkcm1fZm91cmNjLmgs
IHRoZW4gbWVyZ2UgYW55IGNvZGUgdXNpbmcgdGhlCm5ldyBtb2RpZmllcnMsIHNvIEkgZmlndXJl
ZCBpdCB3b3VsZCBiZSBmYWlyIGdhbWUgdG8gcG9zdCB0aGlzIHBhdGNoCmJlZm9yZSBJIGZ1bGx5
IGZpbmlzaGVkIHJld29ya2luZyB0aGUgTWVzYSBzZXJpZXMuCgpSZWdhcmRzLApMdWNhcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
