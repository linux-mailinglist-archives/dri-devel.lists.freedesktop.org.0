Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5978615
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9B89CA0;
	Mon, 29 Jul 2019 07:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A025189911
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 22:52:37 +0000 (UTC)
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hr94i-0003y7-8Y; Sat, 27 Jul 2019 00:52:32 +0200
Date: Sat, 27 Jul 2019 00:52:31 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i810: Use CONFIG_PREEMPTION
In-Reply-To: <CAKMK7uGq15vhfrtaHGCRm-ReMwRFGOOuzqHK15Fsw-kvSGh3bw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907270050020.1791@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907262223280.1791@nanos.tec.linutronix.de>
 <CAKMK7uGq15vhfrtaHGCRm-ReMwRFGOOuzqHK15Fsw-kvSGh3bw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyNyBKdWwgMjAxOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEp1bCAy
NiwgMjAxOSBhdCAxMDoyNSBQTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4g
d3JvdGU6Cj4gPgo+ID4gQ09ORklHX1BSRUVNUFRJT04gaXMgc2VsZWN0ZWQgYnkgQ09ORklHX1BS
RUVNUFQgYW5kIGJ5Cj4gPiBDT05GSUdfUFJFRU1QVF9SVC4gQm90aCBQUkVFTVBUIGFuZCBQUkVF
TVBUX1JUIHJlcXVpcmUgdGhlIHNhbWUKPiA+IGZ1bmN0aW9uYWxpdHkgd2hpY2ggdG9kYXkgZGVw
ZW5kcyBvbiBDT05GSUdfUFJFRU1QVC4KPiA+Cj4gPiBDaGFuZ2UgdGhlIEtjb25maWcgZGVwZW5k
ZW5jeSBvZiBpODEwIHRvICFDT05GSUdfUFJFRU1QVElPTiBzbyB0aGUgZHJpdmVyCj4gPiBpcyBu
b3QgYWNjaWRlbnRhbGx5IGJ1aWx0IG9uIGEgUlQga2VybmVsLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+ID4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gCj4g
TXkga2VybmVsL0tjb25maWcucHJlZW1wdCBoZXJlIHN0aWxsIGhhcyB0aGF0IGFzIFBSRUVNUFQu
IERvZXMgdGhpcwo+IHBhdGNoIG5lZWQgc29tZSBvdGhlcnM/IEluIHRoYXQgY2FzZSBBY2sgZm9y
IG1lcmdpbmcgdGhyb3VnaCB3aGF0ZXZlcgo+IHRyZWUgdGhvc2UgZ28gaW4gdGhyb3VnaC4KClRo
ZSBDT05GSUdfUFJFRU1QVElPTiBjaGFuZ2UgY2FtZSBhcyBhIHJlZ3Jlc3Npb24gZml4IGFmdGVy
IHJjMSBpbnRvIExpbnVzCnRyZWUuIFRoZSBpbml0aWFsIHBsYW4gd2FzIHRvIHJlbmFtZSBQUkVF
TVBUIHRvIFBSRUVNUFRfTEwgYW5kIHNlbGVjdApQUkVFTVBUIGZyb20gYm90aCBQUkVFTVBUX1JU
IGFuZCBQUkVFTVBUX0xMLiBCdXQgdGhhdCBicm9rZSAob2xkKWRlZmNvbmZpZwphbmQgc3VjaC4g
U28gaXQgZ290IGZpeGVkIHBvc3QgcmMxLgoKSWYgeW91IGRvbid0IHdhbnQgdG8gbWVyZ2UgcmMy
IGludG8geW91ciB0cmVlLCBsZXQgbWUga25vdyBhbmQgSSdsbCBwaWNrIGl0CnVwLgoKVGhhbmtz
LAoKCXRnbHgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
