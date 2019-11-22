Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0374106701
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 08:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693146E217;
	Fri, 22 Nov 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930816E217
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 07:22:48 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iY3H9-0000om-N2; Fri, 22 Nov 2019 08:22:43 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1iY3H5-0001Uh-II; Fri, 22 Nov 2019 08:22:39 +0100
Date: Fri, 22 Nov 2019 08:22:39 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
Message-ID: <20191122072239.dhbhi2uawoqsclwy@pengutronix.de>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <CAEkB2EQGCcwBO4iZBiHthUAJUeprw2Q09932GATd6XVyXqukzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEkB2EQGCcwBO4iZBiHthUAJUeprw2Q09932GATd6XVyXqukzw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:19:40 up 6 days, 22:38, 23 users, load average: 0.00, 0.00, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Navid Emamdoost <emamd001@umn.edu>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmF2aWQsCgpPbiAxOS0xMS0yMSAxMjozMSwgTmF2aWQgRW1hbWRvb3N0IHdyb3RlOgo+IE9u
IEZyaSwgT2N0IDQsIDIwMTkgYXQgMjowOSBQTSBOYXZpZCBFbWFtZG9vc3QKPiA8bmF2aWQuZW1h
bWRvb3N0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSW4gaW14X3BkX2JpbmQsIHRoZSBkdXBs
aWNhdGVkIG1lbW9yeSBmb3IgaW14cGQtPmVkaWQgdmlhIGttZW1kdXAgc2hvdWxkCj4gPiBiZSBy
ZWxlYXNlZCBpbiBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2Ugb3IgaW14X3BkX3JlZ2lzdGVy
IGZhaWwuCj4gPgo+ID4gRml4ZXM6IGViYzk0NDYxMzU2NyAoImRybTogY29udmVydCBkcml2ZXJz
IHRvIHVzZSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UiKQo+ID4gRml4ZXM6IDE5MDIyYWFh
ZTY3NyAoInN0YWdpbmc6IGRybS9pbXg6IEFkZCBwYXJhbGxlbCBkaXNwbGF5IHN1cHBvcnQiKQo+
ID4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwu
Y29tPgo+ID4gLS0tCj4gCj4gV291bGQgeW91IHBsZWFzZSByZXZpZXcgdGhpcyBwYXRjaD8KPiAK
PiBUaGFua3MsCgpJIGN1cnJlbnRseSB3b3JrIG9uIHRoZSBkcm0vaW14IGRyaXZlcihzKSB0byBh
dm9pZCBlcnJvcnMgbGlrZSBbMV0uCkhvcGVmdWxseSBJIGhhdmUgYSB3b3JraW5nIHZlcnNpb24g
dGlsbCBuZXh0IHdlZWsuIFRoZXJlIEkgZml4ZWQgdGhpcwppc3N1ZSBieSB1c2luZyB0aGUgZGV2
bV9rbWVtZHVwKCkgYW5kIGRyb3BwZWQgdGhlIGV4cGxpY2l0IGtmcmVlKCkKd2l0aGluIHVuYmlu
ZCgpLgoKWzFdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2RyaS1kZXZlbC9tc2cxODkz
ODguaHRtbAoKUmVnYXJkcywKICBNYXJjbwoKPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vaW14L3Bh
cmFsbGVsLWRpc3BsYXkuYyB8IDggKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxs
ZWwtZGlzcGxheS5jCj4gPiBpbmRleCBlN2NlMTc1MDNhZTEuLjk1MjJkMmNiMGFkNSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+ID4gQEAgLTIyNywxNCAr
MjI3LDE4IEBAIHN0YXRpYyBpbnQgaW14X3BkX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gPgo+ID4gICAgICAgICAvKiBwb3J0QDEg
aXMgdGhlIG91dHB1dCBwb3J0ICovCj4gPiAgICAgICAgIHJldCA9IGRybV9vZl9maW5kX3BhbmVs
X29yX2JyaWRnZShucCwgMSwgMCwgJmlteHBkLT5wYW5lbCwgJmlteHBkLT5icmlkZ2UpOwo+ID4g
LSAgICAgICBpZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQo+ID4gKyAgICAgICBpZiAocmV0ICYm
IHJldCAhPSAtRU5PREVWKSB7Cj4gPiArICAgICAgICAgICAgICAga2ZyZWUoaW14cGQtPmVkaWQp
Owo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgIH0KPiA+Cj4gPiAg
ICAgICAgIGlteHBkLT5kZXYgPSBkZXY7Cj4gPgo+ID4gICAgICAgICByZXQgPSBpbXhfcGRfcmVn
aXN0ZXIoZHJtLCBpbXhwZCk7Cj4gPiAtICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgIGlmIChy
ZXQpIHsKPiA+ICsgICAgICAgICAgICAgICBrZnJlZShpbXhwZC0+ZWRpZCk7Cj4gPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgZGV2X3Nl
dF9kcnZkYXRhKGRldiwgaW14cGQpOwo+ID4KPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4gCj4gCj4g
LS0gCj4gTmF2aWQuCj4gCj4gCgotLSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0
ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8g
IHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0
OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAg
ICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
