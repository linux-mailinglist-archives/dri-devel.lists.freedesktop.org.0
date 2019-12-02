Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D397010EA78
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 14:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C35A89EB1;
	Mon,  2 Dec 2019 13:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7712889EB1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 13:05:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D613B309;
 Mon,  2 Dec 2019 14:05:06 +0100 (CET)
Date: Mon, 2 Dec 2019 15:04:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20191202130459.GH4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-3-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575291907;
 bh=jpdUZBJ94BkaUSvrghCoziBgf7hZdGXnWFPN0xjfpDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLsj2sdLye0pP/jjzjSxLcYCOAd9e01HPIgUZtM5w5z22NAxYK10LWcgLDTGeGgAc
 NoIGREOc2e6D3TfGyflpynGabb5K5Vr413Awh4KltJwU01UvePoTUY6SOGsP9Gtg+b
 1ISWWfjXerUX9uVRhQTT5jvrj4Dodi9r6bNqmdII=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBOb3YgMTQsIDIwMTkg
YXQgMTE6Mzk6NDlBTSArMDIwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gcGFuZWwtc2ltcGxl
IG5vdyBoYW5kbGVkIHBhbmVsIG9zZDA3MHQxNzE4LTE5dHMsIGFuZCB3ZSBubyBsb25nZXIgbmVl
ZAo+IHRoZSBwYW5lbCB0aW1pbmdzIGluIHRoZSBEVCBmaWxlLiBTbyByZW1vdmUgdGhlbS4KClNo
b3VsZCB5b3UgaW4gdGhhdCBjYXNlIGRyb3AgdGhlIHBhbmVsLWRwaSBjb21wYXRpYmxlIHN0cmlu
ZyB0b28sIGFzIHRoZQpwYW5lbC1kcGkgYmluZGluZ3MgcmVxdWlyZSBwYW5lbCB0aW1pbmdzIGlu
IERUID8KCj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMgIHwgMTYg
LS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9hbTQzeC1lcG9zLWV2bS5kdHMg
fCAxNiAtLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1ncC1ldm0uZHRzIGIv
YXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMKPiBpbmRleCA4MTFjOGNhZTMxNWIu
LjA0MDQwMzA0OWNlYSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTQzN3gtZ3At
ZXZtLmR0cwo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1ncC1ldm0uZHRzCj4gQEAg
LTkxLDIyICs5MSw2IEBACj4gIAo+ICAJCWJhY2tsaWdodCA9IDwmbGNkX2JsPjsKPiAgCj4gLQkJ
cGFuZWwtdGltaW5nIHsKPiAtCQkJY2xvY2stZnJlcXVlbmN5ID0gPDMzMDAwMDAwPjsKPiAtCQkJ
aGFjdGl2ZSA9IDw4MDA+Owo+IC0JCQl2YWN0aXZlID0gPDQ4MD47Cj4gLQkJCWhmcm9udC1wb3Jj
aCA9IDwyMTA+Owo+IC0JCQloYmFjay1wb3JjaCA9IDwxNj47Cj4gLQkJCWhzeW5jLWxlbiA9IDwz
MD47Cj4gLQkJCXZiYWNrLXBvcmNoID0gPDEwPjsKPiAtCQkJdmZyb250LXBvcmNoID0gPDIyPjsK
PiAtCQkJdnN5bmMtbGVuID0gPDEzPjsKPiAtCQkJaHN5bmMtYWN0aXZlID0gPDA+Owo+IC0JCQl2
c3luYy1hY3RpdmUgPSA8MD47Cj4gLQkJCWRlLWFjdGl2ZSA9IDwxPjsKPiAtCQkJcGl4ZWxjbGst
YWN0aXZlID0gPDE+Owo+IC0JCX07Cj4gLQo+ICAJCXBvcnQgewo+ICAJCQlsY2RfaW46IGVuZHBv
aW50IHsKPiAgCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4LWVwb3MtZXZtLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2FtNDN4LWVwb3MtZXZtLmR0cwo+IGluZGV4IDA3OGNiNDczZmE3ZC4uMzMwZmNlMDYwZThiIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4LWVwb3MtZXZtLmR0cwo+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4LWVwb3MtZXZtLmR0cwo+IEBAIC00NywyMiArNDcsNiBA
QAo+ICAKPiAgCQliYWNrbGlnaHQgPSA8JmxjZF9ibD47Cj4gIAo+IC0JCXBhbmVsLXRpbWluZyB7
Cj4gLQkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwzMzAwMDAwMD47Cj4gLQkJCWhhY3RpdmUgPSA8ODAw
PjsKPiAtCQkJdmFjdGl2ZSA9IDw0ODA+Owo+IC0JCQloZnJvbnQtcG9yY2ggPSA8MjEwPjsKPiAt
CQkJaGJhY2stcG9yY2ggPSA8MTY+Owo+IC0JCQloc3luYy1sZW4gPSA8MzA+Owo+IC0JCQl2YmFj
ay1wb3JjaCA9IDwxMD47Cj4gLQkJCXZmcm9udC1wb3JjaCA9IDwyMj47Cj4gLQkJCXZzeW5jLWxl
biA9IDwxMz47Cj4gLQkJCWhzeW5jLWFjdGl2ZSA9IDwwPjsKPiAtCQkJdnN5bmMtYWN0aXZlID0g
PDA+Owo+IC0JCQlkZS1hY3RpdmUgPSA8MT47Cj4gLQkJCXBpeGVsY2xrLWFjdGl2ZSA9IDwxPjsK
PiAtCQl9Owo+IC0KPiAgCQlwb3J0IHsKPiAgCQkJbGNkX2luOiBlbmRwb2ludCB7Cj4gIAkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+OwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
