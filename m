Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643E8E797
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 11:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B46E1F5;
	Thu, 15 Aug 2019 09:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8450C6E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 09:01:32 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hyBdS-0002C9-Tb; Thu, 15 Aug 2019 11:01:30 +0200
Message-ID: <1565859690.3011.4.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] gpu: ipu-v3: enable remaining 32-bit RGB V4L2 pixel
 formats
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 15 Aug 2019 11:01:30 +0200
In-Reply-To: <20190815063653.rxo7werudf4nxngj@pengutronix.de>
References: <20190814151059.8846-1-p.zabel@pengutronix.de>
 <20190815063653.rxo7werudf4nxngj@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyY28sCgpPbiBUaHUsIDIwMTktMDgtMTUgYXQgMDg6MzYgKzAyMDAsIE1hcmNvIEZlbHNj
aCB3cm90ZToKPiBIaSBQaGlsaXBwLAo+IAo+IE9uIDE5LTA4LTE0IDE3OjEwLCBQaGlsaXBwIFph
YmVsIHdyb3RlOgo+ID4gU3VwcG9ydCBpcyBhbHJlYWR5IGltcGxlbWVudGVkIGZvciB0aGUgY29y
cmVzcG9uZGluZyBEUk0gZm9ybWF0cywKPiA+IGp1c3QgaG9vayB1cCB0aGUgcmVtYWluaW5nIFY0
TDIgcGl4ZWwgZm9ybWF0cy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2lwdS12My9p
cHUtY29tbW9uLmMgfCAxNiArKysrKysrKysrLS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvaXB1LXYz
L2lwdS1jcG1lbS5jICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1jb21tb24uYyBiL2RyaXZlcnMvZ3B1L2lw
dS12My9pcHUtY29tbW9uLmMKPiA+IGluZGV4IDYzODZlMmZlMmZmNy4uZWUyYTAyNWU1NGNmIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1jb21tb24uYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1jb21tb24uYwo+ID4gQEAgLTExMywxMyArMTEzLDE3IEBA
IGVudW0gaXB1X2NvbG9yX3NwYWNlIGlwdV9waXhlbGZvcm1hdF90b19jb2xvcnNwYWNlKHUzMiBw
aXhlbGZvcm1hdCkKPiA+ICAJY2FzZSBWNEwyX1BJWF9GTVRfTlYxNjoKPiA+ICAJY2FzZSBWNEwy
X1BJWF9GTVRfTlY2MToKPiA+ICAJCXJldHVybiBJUFVWM19DT0xPUlNQQUNFX1lVVjsKPiA+IC0J
Y2FzZSBWNEwyX1BJWF9GTVRfWFJHQjMyOgo+ID4gLQljYXNlIFY0TDJfUElYX0ZNVF9YQkdSMzI6
Cj4gPiAtCWNhc2UgVjRMMl9QSVhfRk1UX1JHQjMyOgo+ID4gLQljYXNlIFY0TDJfUElYX0ZNVF9C
R1IzMjoKPiA+IC0JY2FzZSBWNEwyX1BJWF9GTVRfUkdCMjQ6Cj4gPiAtCWNhc2UgVjRMMl9QSVhf
Rk1UX0JHUjI0Ogo+ID4gIAljYXNlIFY0TDJfUElYX0ZNVF9SR0I1NjU6Cj4gPiArCWNhc2UgVjRM
Ml9QSVhfRk1UX0JHUjI0Ogo+IAo+IE5pdHBpY2s6Cj4gU2hvdWxkIHdlIGFkZCAnLyogZmFsbCB0
aHJvdWdoICovJyBjb21tZW50cz8gCgpOb3QgZm9yIHRoaXMuIC1XaW1wbGljaXQtZmFsbHRocm91
Z2ggb25seSByZXF1aXJlcyBhbm5vdGF0aW9uIGlmIHRoZXJlCmFyZSBzdGF0ZW1lbnRzIGJldHdl
ZW4gdHdvIGNhc2VzLgoKPiBGZWVsIGZyZWUgdG8gYWRkIG15Cj4gUmV2aWV3ZWQtYnk6IE1hcmNv
IEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+CgpUaGFua3MhCgpyZWdhcmRzClBoaWxp
cHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
