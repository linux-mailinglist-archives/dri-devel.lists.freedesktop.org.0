Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2992C417
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D85889C19;
	Tue, 28 May 2019 10:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545089C19
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:16:28 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVZ9d-0002aD-U9; Tue, 28 May 2019 12:16:25 +0200
Message-ID: <1559038585.4039.13.camel@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host
 controller support
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 28 May 2019 12:16:25 +0200
In-Reply-To: <20190528100449.GA15992@fsr-ub1664-121>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de> <20190528013800.GB6885@dragon>
 <1559031596.4039.8.camel@pengutronix.de>
 <CAKMK7uFTrBTxOH-nFTJqu88BWzGC5BE49MJT3iREL4+AwCAZuw@mail.gmail.com>
 <20190528100449.GA15992@fsr-ub1664-121>
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
Cc: David Airlie <airlied@linux.ie>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudGl1LAoKQW0gRGllbnN0YWcsIGRlbiAyOC4wNS4yMDE5LCAxMDowNCArMDAwMCBz
Y2hyaWViIExhdXJlbnRpdSBQYWxjdToKPiBMdWNhcyBhbmQgRGFuaWVsLAoKWy4uLl0KCj4gPiA+
IEl0J3MgYSB0b3RhbGx5IGRpZmZlcmVudCBoYXJkd2FyZSwgd2l0aCB2ZXJ5IGRpZmZlcmVudCBi
ZWhhdmlvciwgc28KPiA+ID4gdGhlcmUgaXMgYmFzaWNhbGx5IG5vIHBvdGVudGlhbCBmb3IgYW55
IGNvZGUgc2hhcmluZy4gVGhlIGRvd25zdHJlYW0KPiA+ID4gZHJpdmVyIGlzIGEgaGVsbCBvZiAi
b2gsIHRoaW5ncyBhcmUgZGlmZmVyZW50IGhlcmUsIGxldCdzIGludHJvZHVjZSB5ZXQKPiA+ID4g
YW5vdGhlciBmdW5jdGlvbiBwb2ludGVyIHRvIG1ha2UgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4g
dGhlIEhXIi4gSXQKPiA+ID4gY29tcGxpY2F0ZXMgdGhlIGlteC1kcm0gZm9yIG5vIGdvb2QgcmVh
c29uLiBPdXIgZXhwZXJpZW5jZSB3aXRoIGlteC1kcm0KPiA+ID4gaXMgdGhhdCBpdCBpcyBhbHJl
YWR5IGF0IGEgY29tcGxleGl0eSBsZXZlbCB0aGF0IG1ha2VzIGl0IGhhcmQgdG8KPiA+ID4gcmVh
c29uIGFib3V0IHRoaW5ncyB3aGVuIGh1bnRpbmcgYnVncy4KPiA+ID4gCj4gPiA+IFRoZSBib2ls
ZXIgcGxhdGUgcmVxdWlyZWQgdG8gd3JpdGUgYSBhdG9taWMgS01TIGRyaXZlciBpcyBub3QgdGhh
dAo+ID4gPiBtdWNoLCBzbyBJIHdvdWxkIHJhdGhlciBoYXZlIGEgY2xlYW4gc3BsaXQgYmV0d2Vl
biB0aGUgdHdvIGhhcmR3YXJlCj4gPiA+IGRyaXZlcnMuIEZyYW5rbHkgdGhleSBkb24ndCBzaGFy
ZSBhbnl0aGluZyBleGNlcHQgYm90aCBiZWluZyBhIGF0b21pYwo+ID4gPiBLTVMgZHJpdmVyIGFu
ZCBydW5uaW5nIG9uIGEgU29DIGNhbGxlZCBpLk1YLgo+ID4gCj4gPiBXZSd2ZSBhbHNvIG1hZGUg
bG90cyBvZiBpbXByb3ZlbWVudHMgaW4gdGhlIGhlbHBlcnMsIEkgdGhpbmsgYSBjbGVhbgo+ID4g
ZHJpdmVyIHdpbGwgYmUgcXVpZXQgYSBiaXQgc21hbGxlciB0aGFuIGFuIGlteCBiYXNlZCBvbmUu
IEFSTSBpcyBkb2luZwo+ID4gdGhlIHNhbWUgd2l0aCBrb21lZGEgYW5kIHRoZSBtYWxpZHAgZHJp
dmVyIGJ0dy4gQW5vdGhlciBvcHRpb24gd291bGQKPiA+IGJlIDIga21zIGRyaXZlcnMgaW4gb25l
IC5rbywgd2hpY2ggaXMgd2hhdCBub3V2ZWF1IGRvZXMgd2l0aCBwcmUtbnY1MAo+ID4gYW5kIHBv
c3QtbnY1MC4gQnV0IHRoYXQgb25seSBtYWtlcyBzZW5zZSBpZiB5b3UgaGF2ZSBhbHNvIHRoZSBy
ZW5kZXIKPiA+IHNpZGUgaW4gdGhlIHNhbWUgZHJpdmVyIGJlY2F1c2UgaXQncyBhbGwgZnJvbSB0
aGUgc2FtZSB2ZW5kb3IuIG1zbSBpcwo+ID4gc2ltaWxhciwgd2l0aCBtc200IHZzIG1zbTUuCj4g
PiAKPiA+IEJ1dCBmb3Igc29jIGRpc3BsYXktb25seSBJIHRoaW5rIHR3byBzZXBhcmF0ZSBkcml2
ZXJzLCBpZiB0aGUgaHcKPiA+IHJlYWxseSBjaGFuZ2VkIGVub3VnaCwgaXMgdGhlIGJlc3Qgb3B0
aW9uLiBZb3UgY2FuIHN0aWxsIHN0dWZmIHRoZW0KPiA+IGludG8gdGhlIHNhbWUgc3ViZGlyIG9m
Yy4KPiAKPiBTb3VuZHMgZ29vZCB0byBtZS4gSSdsbCByZXdyaXRlIHRoZSBEQ1NTIGRyaXZlciBh
bmQgbWFrZSBpdCBzZXBhcmF0ZQo+IGZyb20gaW14LWRybS4gVGhvdWdoLCB0byBiZSBob25lc3Qs
IHRoaXMgZGVmZWF0cyB0aGUgd2hvbGUgcHVycG9zZSBvZgo+IGlteC1kcm0gaW4gdGhlIGZpcnN0
IHBsYWNlLi4uIFdhc24ndCB0aGlzIHN1cHBvc2VkIHRvIGFjdCBsaWtlIGEgZ2x1ZQo+IGFuZCBn
YXRoZXIgYWxsIGkuTVggcmVsYXRlZCBkaXNwbGF5IGNvbnRyb2xsZXJzIHVuZGVyIHRoZSBpbXgt
ZHJtCj4gdW1icmVsbGE/CgpOb3QgcmVhbGx5LiBXZSBuZXZlciBoYWQgYSBwbGFuIHRvIHN1cHBv
cnQgYWxsIGtpbmRzIG9mIGkuTVggZGlzcGxheQpoYXJkd2FyZSBpbiBhIHNpbmdsZSBkcml2ZXIu
CgpBdCBzb21lIHBvaW50IGlteC1kcm0gYWN0ZWQgYXMgdGhlIGdsdWUgdG8gYnJpbmcgYWxsIHRo
ZSBjb21wb25lbnRzIG9mCnRoZSBpLk1YIGRpc3BsYXkgcGlwZWxpbmUgdG9nZXRoZXIsIGJ1dCBt
dWNoIG9mIHRoYXQgZnVuY3Rpb25hbGl0eSBoYXMKc2luY2UgYmVlbiBzcGxpdCBvdXQgYW5kIGlz
IG5vdyBhdmFpbGFibGUgYXMgaW5mcmFzdHJ1Y3R1cmUgaW4gdGhlCmtlcm5lbCwgbGlrZSB0aGUg
RFJNIGJyaWRnZXMsIGRldmljZXRyZWUgZ3JhcGggYmluZGluZ3MgYW5kIGRldmljZQpsaW5rcy4g
QWxsIHRob3NlIGluZnJhc3RydWN0dXJlIHBhcnRzIG1ha2UgaXQgZWFzeSB0byB3cml0ZSBhIHNl
cGFyYXRlCkRSTSBkcml2ZXIsIHdpdGhvdXQgZHVwbGljYXRpbmcgbG90cyBvZiBjb2RlIGZyb20g
aW14LWRybS4KCkl0IG1hZGUgc2Vuc2UgdG8gZXh0ZW5kIGlteC1kcm0gYXMgbG9uZyBhcyB0aGUg
aGFyZHdhcmUgd2FzIGNsb3NlCmFuZC9vciBhbiBleHRlbnNpb24gdG8gYWxyZWFkeSBleGlzdGlu
ZyBoYXJkd2FyZS4gQnV0IERDU1MgaXMgdG90YWxseQpkaWZmZXJlbnQgZnJvbSB0aGUgY3VycmVu
dGx5IHN1cHBvcnRlZCBJUFUgZGVzaWduLgoKPiBCdXQsIG9uIHRoZSBvdGhlciBoYW5kLCBJIGFn
cmVlIGl0IHdvdWxkIGJlIGJlc3QsIGdvaW5nIGZvcndhcmQsIHRvIGhhdmUKPiBpdCBzZXBhcmF0
ZS4gRWFzaWVyIHRvIG1haW50YWluIGFuZCwgbW9zdCBsaWtlbHksIHNpbXBsZXIuCgpTZWVtcyB3
ZSBhZ3JlZSBvbiB0aGUgZGlyZWN0aW9uIHRoaXMgc2hvdWxkIHRha2UuIDopCgpSZWdhcmRzLApM
dWNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
