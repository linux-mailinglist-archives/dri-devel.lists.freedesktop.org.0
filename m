Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2BAD620
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 11:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C0389AEA;
	Mon,  9 Sep 2019 09:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5922C89AEA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 09:56:28 +0000 (UTC)
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FFE12086D;
 Mon,  9 Sep 2019 09:56:27 +0000 (UTC)
Date: Mon, 9 Sep 2019 10:56:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sreeram Veluthakkal <srrmvlt@gmail.com>
Subject: Re: [PATCH] FBTFT: fb_agm1264k: usleep_range is preferred over udelay
Message-ID: <20190909095625.GB17624@kroah.com>
References: <20190909012605.15051-1-srrmvlt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909012605.15051-1-srrmvlt@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568022988;
 bh=gZ0748sBch7IpXH/kLfqLXjMbt6zIXw46guvy3EAtDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJBfDih22n1GvUOnHveq2BfLBrerPWSYxwXF3/rHjEIxO+Qs1MJL6JrubcX6uzbcV
 6y2swciZuLTWVPnyuF5ahYPPmm1oCR1YvyW+7aOIw7pyEIoyi4YZGiZKfSj/PMPNzJ
 qBn+WvWXaW1cWPgSrRBzz5yGOsltDF8WKP3VAe8Y=
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 nishadkamdar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, payal.s.kshirsagar.98@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDg6MjY6MDVQTSAtMDUwMCwgU3JlZXJhbSBWZWx1dGhh
a2thbCB3cm90ZToKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZToKPiBGSUxFOiBkcml2ZXJz
L3N0YWdpbmcvZmJ0ZnQvZmJfYWdtMTI2NGstZmwuYzo4ODoKPiBDSEVDSzogdXNsZWVwX3Jhbmdl
IGlzIHByZWZlcnJlZCBvdmVyIHVkZWxheTsgc2VlIERvY3VtZW50YXRpb24vdGltZXJzL3RpbWVy
cy1ob3d0by5yc3QKPiArICAgICAgIHVkZWxheSgyMCk7Cj4gCj4gU2lnbmVkLW9mZi1ieTogU3Jl
ZXJhbSBWZWx1dGhha2thbCA8c3JybXZsdEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYl9hZ20xMjY0ay1mbC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL2ZidGZ0L2ZiX2FnbTEyNjRrLWZsLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfYWdt
MTI2NGstZmwuYwo+IGluZGV4IGVlZWVlYzk3YWQyNy4uMmRlY2U3MWZkM2I1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYl9hZ20xMjY0ay1mbC5jCj4gKysrIGIvZHJpdmVy
cy9zdGFnaW5nL2ZidGZ0L2ZiX2FnbTEyNjRrLWZsLmMKPiBAQCAtODUsNyArODUsNyBAQCBzdGF0
aWMgdm9pZCByZXNldChzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIpCj4gIAlkZXZfZGJnKHBhci0+aW5m
by0+ZGV2aWNlLCAiJXMoKVxuIiwgX19mdW5jX18pOwo+ICAKPiAgCWdwaW9kX3NldF92YWx1ZShw
YXItPmdwaW8ucmVzZXQsIDApOwo+IC0JdWRlbGF5KDIwKTsKPiArCXVzbGVlcF9yYW5nZSgyMCwg
NDApOwoKSXMgaXQgInNhZmUiIHRvIHdhaXQgNDA/ICBUaGlzIGtpbmQgb2YgY2hhbmdlIHlvdSBj
YW4gb25seSBkbyBpZiB5b3UKa25vdyB0aGlzIGlzIGNvcnJlY3QuICBIYXZlIHlvdSB0ZXN0ZWQg
dGhpcyB3aXRoIGhhcmR3YXJlPwoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
