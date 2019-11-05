Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E5EF86C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C32D6E93F;
	Tue,  5 Nov 2019 09:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0C96E93F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:17:42 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iRuy3-0002KF-P4; Tue, 05 Nov 2019 10:17:39 +0100
Message-ID: <78b6262cf5f6e9f60746559314fc9f1912365912.camel@pengutronix.de>
Subject: Re: Overlay support in the i.MX7 display
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Vasut
 <marex@denx.de>, Stefan Agner <stefan@agner.ch>
Date: Tue, 05 Nov 2019 10:17:38 +0100
In-Reply-To: <20191101084318.GA8428@pendragon.ideasonboard.com>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIEZyaSwgMjAxOS0xMS0wMSBhdCAxMDo0MyArMDIwMCwgTGF1cmVudCBQ
aW5jaGFydCB3cm90ZToKPiBIZWxsbywKPiAKPiBJJ20gbG9va2luZyBhdCB0aGUgYXZhaWxhYmxl
IG9wdGlvbnMgdG8gc3VwcG9ydCBvdmVybGF5cyBpbiB0aGUgZGlzcGxheQo+IHBpcGVsaW5lIG9m
IHRoZSBpLk1YNy4gVGhlIExDRElGIGl0c2VsZiB1bmZvcnR1bmFsdGV5IGRvZXNuJ3Qgc3VwcG9y
dAo+IG92ZXJsYXlzLCB0aGUgZmVhdHVyZSBiZWluZyBpbXBsZW1lbnRlZCBpbiB0aGUgUFhQLiBB
IGRyaXZlciBmb3IgdGhlIFBYUAo+IGlzIGF2YWlsYWJsZSBidXQgb25seSBzdXBwb3J0cyBvbGRl
ciBTb0NzIHdob3NlIFBYUCBkb2Vzbid0IHN1cHBvcnQKPiBvdmVybGF5cy4gVGhpcyBkcml2ZXIg
aXMgaW1wbGVtZW50ZWQgYXMgYSBWNEwyIG1lbTJtZW0gZHJpdmVyLCB3aGljaAo+IG1ha2VzIHN1
cHBvcnQgb2YgYWRkaXRpb25hbCBpbnB1dCBjaGFubmVscyBpbXBvc3NpYmxlLgo+IAo+IEhlcmUg
YXJlIHRoZSBvcHRpb25zIEkgY2FuIGVudmlzaW9uOgo+IAo+IC0gRXh0ZW5kIHRoZSBleGlzdGlu
ZyBQWFAgZHJpdmVyIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2hhbm5lbHMuIFRoaXMgaXMKPiAgIHRl
Y2huaWNhbGx5IGZlYXNpYmxlLCBidXQgd2lsbCByZXF1aXJlIG1vdmluZyBhd2F5IGZyb20gdGhl
IFY0TDIKPiAgIG1lbTJtZW0gZnJhbWV3b3JrLCB3aGljaCB3b3VsZCBicmVhayB1c2Vyc3BhY2Uu
IEkgZG9uJ3QgdGhpbmsgdGhpcwo+ICAgcGF0aCBjb3VsZCBsZWFkIGFueXdoZXJlLgoKSSBtYXkg
YmUgYmlhc2VkLCBidXQgcGxlYXNlIGRvbid0IGJyZWFrIHRoZSBWNEwyIG1lbTJtZW0gdXNlY2Fz
ZSA6KQoKPiAtIFdyaXRlIGEgbmV3IFBYUCBkcml2ZXIgZm9yIHRoZSBpLk1YNywgc3RpbGwgdXNp
bmcgVjRMMiwgYnV0IHdpdGgKPiAgIG11bHRpcGxlIHZpZGVvIG5vZGVzLiBUaGlzIHdvdWxkIGFs
bG93IGJsZW5kaW5nIG11bHRpcGxlIGxheWVycywgYnV0Cj4gICB3b3VsZCByZXF1aXJlIHdyaXRp
bmcgdGhlIG91dHB1dCB0byBtZW1vcnksIHdoaWxlIHRoZSBQWFAgaGFzIHN1cHBvcnQKPiAgIGZv
ciBkaXJlY3QgY29ubmVjdGlvbnMgdG8gdGhlIExDRElGICh0aHJvdWdoIHNtYWxsIFNSQU0gYnVm
ZmVycykuCj4gICBQZXJmb3JtYW5jZXMgd291bGQgdGh1cyBiZSBzdWJvcHRpbWFsLiBUaGUgQVBJ
IHdvdWxkIGFsc28gYmUgYXdrd2FyZCwKPiAgIGFzIHVzaW5nIHRoZSBQWFAgZm9yIGRpc3BsYXkg
d291bGQgcmVxdWlyZSB1c2FnZSBvZiBWNEwyIGluCj4gICBhcHBsaWNhdGlvbnMuCgpJJ20gbm90
IHN1cmUgVjRMMiBpcyB0aGUgYmVzdCBBUEkgZm9yIG11bHRpLXBhc3MgMkQgY29tcG9zaXRpb24s
CmVzcGVjaWFsbHkgYXMgdGhlIFBYUCBpcyBhYmxlIHRvIGJsaXQgYW4gb3ZlcmxheSBvbnRvIGEg
YmFja2dyb3VuZCBpbgpwbGFjZS4KCj4gLSBFeHRlbmQgdGhlIG14c2ZiIGRyaXZlciB3aXRoIFBY
UCBzdXBwb3J0LCBhbmQgZXhwb3NlIHRoZSBQWFAgaW5wdXRzIGFzCj4gICBLTVMgcGxhbmVzLiBU
aGUgUFhQIHdvdWxkIG9ubHkgYmUgdXNlZCB3aGVuIGF2YWlsYWJsZSwgYW5kIHdvdWxkIGJlCj4g
ICB0cmFuc3BhcmVudCB0byBhcHBsaWNhdGlvbnMuIFRoaXMgd291bGQgaG93ZXZlciBwcmV2ZW50
IHVzaW5nIGl0Cj4gICBzZXBhcmF0ZWx5IGZyb20gdGhlIGRpc3BsYXkgKHRvIHBlcmZvcm0gbXVs
dGktcGFzcyBhbHBoYSBibGVuZGluZyBmb3IKPiAgIGluc3RhbmNlKS4KCkZvciB0aGUgU1JBTSBi
bG9jayByb3cgYnVmZmVyIHBhdGggdG8gdGhlIExDRElGLCBJIHRoaW5rIHRoZSBLTVMgcGxhbmUK
YWJzdHJhY3Rpb24gaXMgdGhlIHdheSB0byBnby4gVGhlIERSTSBhbmQgVjRMMiBkcml2ZXJzIGNv
dWxkIGJlIG1hZGUgdG8KdXNlIGEgc2hhcmVkIGJhY2tlbmQsIHN1Y2ggdGhhdCBvbmx5IG9uZSBv
ZiBwbGFuZSBjb21wb3NpdGlvbiBhbmQgVjRMMgpzY2FsaW5nL0NTQyBmdW5jdGlvbnMgY2FuIHdv
cmsgYXQgdGhlIHNhbWUgdGltZS4KCj4gV2hhdCB3b3VsZCBiZSB0aGUgYmVzdCBvcHRpb24gZ29p
bmcgZm9yd2FyZCA/IFdvdWxkIGFueSBvZiB5b3UsIGJ5IGFueQo+IGNoYW5jZSwgaGF2ZSBhbHJl
YWR5IHN0YXJ0ZWQgd29yayBpbiB0aGlzIGFyZWEgPwoKSSBoYXZlIG5vdCB3b3JrZWQgb24gdGhp
cy4KCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
