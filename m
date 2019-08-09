Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D75881A3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 19:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151DE6EE5F;
	Fri,  9 Aug 2019 17:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5D46EE5F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 17:51:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63BF5CC;
 Fri,  9 Aug 2019 19:51:14 +0200 (CEST)
Date: Fri, 9 Aug 2019 20:51:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 24/60] drm/panel: Add driver for the Toppology TD043MTEA1
 panel
Message-ID: <20190809175111.GA5007@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-21-laurent.pinchart@ideasonboard.com>
 <20190710130917.GA11170@ravnborg.org>
 <20190808155454.GS6055@pendragon.ideasonboard.com>
 <20190809133308.GA19924@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809133308.GA19924@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565373074;
 bh=0Rd/uPrGXcN8MRNLKqcGtvwwM8qYhVMonsgKvXXWEcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KjaWaKoX45TNFLE3nES5O2Srg9f7L34vwqmseqK9eHz7SMJRzAg5KqxhC4MYprth5
 Ci8U2uEXyeMn0bH9e52JCKfAFPJRmOZBmxruQDVNwE4Y3BviKul4c0wybxpU4XKt/i
 c9B42SHehvtkMDK8Gw8n8vBR05MzVICesjcDHCRE=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDM6MzM6MDhQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4gCj4gPiA+ID4gK3N0YXRpYyBpbnQgdGQwNDNt
dGVhMV9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ID4gPiA+ICt7Cj4gPiA+ID4g
KwlzdHJ1Y3QgdGQwNDNtdGVhMV9kZXZpY2UgKmxjZCA9IHRvX3RkMDQzbXRlYTFfZGV2aWNlKHBh
bmVsKTsKPiA+ID4gPiArCj4gPiA+ID4gKwlpZiAoIWxjZC0+c3BpX3N1c3BlbmRlZCkKPiA+ID4g
PiArCQl0ZDA0M210ZWExX3Bvd2VyX29mZihsY2QpOwo+ID4gPiA+ICsKPiA+ID4gPiArCXJldHVy
biAwOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgaW50IHRkMDQzbXRlYTFf
ZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwlzdHJ1
Y3QgdGQwNDNtdGVhMV9kZXZpY2UgKmxjZCA9IHRvX3RkMDQzbXRlYTFfZGV2aWNlKHBhbmVsKTsK
PiA+ID4gPiArCWludCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJLyoKPiA+ID4gPiArCSAqIElm
IHdlIGFyZSByZXN1bWluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLCBTUEkgbWlnaHQgbm90IGJlIGVu
YWJsZWQKPiA+ID4gPiArCSAqIHlldCwgc28gd2UnbGwgcHJvZ3JhbSB0aGUgTENEIGZyb20gU1BJ
IFBNIHJlc3VtZSBjYWxsYmFjay4KPiA+ID4gPiArCSAqLwo+ID4gPiA+ICsJaWYgKGxjZC0+c3Bp
X3N1c3BlbmRlZCkKPiA+ID4gPiArCQlyZXR1cm4gMDsKPiA+ID4gCj4gPiA+IEkgZG8gbm90IHJl
Y2FsbCB0aGlzIGlzIG5lZWRlZCBpbiBvdGhlciBwYW5lbCBkcml2ZXJzLCBzbyBsb29rIGF0IHdo
YXQKPiA+ID4gb3RoZXIgc3BpIGJhc2VkIHBhbmVscyBkbyBoZXJlLgo+ID4gPiBJIHRoaW5rIHRo
aXMgaXMgc29tZXRoaW5nIHRoYXQgdG9kYXkgaXMgbm90IHJlcXVpcmVkLgo+ID4gCj4gPiBUaGUg
cHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhlIGRpc3BsYXkgY29udHJvbGxlciBtYXkgYmUgcmVzdW1l
ZCBiZWZvcmUKPiA+IHRoZSBTUEkgYnVzLiBIYXMgdGhhdCBiZWVuIHNvbHZlZCBzb21ld2hlcmUg
aW4gY29yZSBjb2RlID8KPiAKPiBJIGR1bm5vLiBTbyB0aGUgY29uY2x1c2lvbiBpcyB0byBrZWVw
IGl0IGFzIGlzLCBhbmQgYW55IGNoYW5nZQo+IHdpbGwgd2FpdCB1bnRpbCBzb21lb25lIHdpdGgg
SFcgY2FuIHN0ZXAgdXAuCgpHcmVhdCwgdGhhbmtzLgoKPiBBcyBmb3IgYWxsIHlvdXIgb3RoZXIg
ZmVlZGJhY2sgdG8gdGhpcyBhbmQgdGhlIG90aGVyIHBhbmVsIGRyaXZlcnMKPiB0aGV5IGRpZCBu
b3QgdHJpZ2dlciBhbnkgcmVwc29uc2UgZnJvbSBtZS4KPiAKPiBMb29rcyBmb3J3YXJkIGZvciBu
ZXh0IGl0ZXJhdGlvbiBvZiB0aGlzIG5pY2Ugc2V0IG9mIHBhdGNoZXMuCj4gQ2FuIHdlIG1heWJl
IGdldCB0aGUgcGFuZWwgZHJpdmVycyBpbiBiZWZvcmUgc29tZSBvZiB0aGUgaW5mcmFzdHJ1Y3R1
cmUKPiB3b3JrPwo+IEkga25vdyB0aGUgdXNlcnMgdGhlbiBtYXkgY29tZSBhIGJpdCBsYXRlciwg
YnV0IEkgdGhpbmsgdGhhdHMgT0suCgpTdXJlLiBJJ2xsIHBvc3QgdGhlIG5leHQgdmVyc2lvbiBz
b29uLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
