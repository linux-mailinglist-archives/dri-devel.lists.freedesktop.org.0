Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F12499968
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 18:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9206E53E;
	Thu, 22 Aug 2019 16:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383016E53E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 16:39:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EE232B2;
 Thu, 22 Aug 2019 18:39:41 +0200 (CEST)
Date: Thu, 22 Aug 2019 19:39:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 11/50] drm/bridge: Add bridge driver for display
 connectors
Message-ID: <20190822163935.GF5027@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-12-laurent.pinchart@ideasonboard.com>
 <20190822180520.2a65eebb@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822180520.2a65eebb@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566491981;
 bh=5dAXTYnQaRCegiya3YCyEzZN4B99OhNohet1UuVgqyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4RU6yBkRIyJsV8h5gHSCnLCEAm1mVQwzpnfP6AJAVfeGmwlAuoNjqrIrCIKU08HD
 dCCzIlxsNRWZzBNUIGyq5yJXu21MUEeBrsU7ZB6kpxd8WA/KujCK+KM33FRC/1pfUQ
 jn/OwZZla4j0LdUpk+3tW0+L40wopzM30ABRlPoY=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAwNjowNToyMFBNICswMjAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0MiArMDMwMCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IAo+ID4gKwkvKgo+ID4gKwkgKiBHZXQgdGhlIEhQRCBH
UElPIGZvciBEVkkgYW5kIEhETUkgY29ubmVjdG9ycy4gSWYgdGhlIEdQSU8gY2FuIHByb3ZpZGUK
PiA+ICsJICogaW50ZXJydXB0cywgcmVnaXN0ZXIgYW4gaW50ZXJydXB0IGhhbmRsZXIuCj4gPiAr
CSAqLwo+ID4gKwlpZiAodHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfRFZJSSB8fAo+ID4gKwkg
ICAgdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpIHsKPiA+ICsJCWNvbm4tPmhwZF9n
cGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwgImhwZCIsCj4gPiArCQkJ
CQkJCSBHUElPRF9JTik7Cj4gPiArCQlpZiAoSVNfRVJSKGNvbm4tPmhwZF9ncGlvKSkgewo+ID4g
KwkJCWlmIChQVFJfRVJSKGNvbm4tPmhwZF9ncGlvKSAhPSAtRVBST0JFX0RFRkVSKQo+ID4gKwkJ
CQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gPiArCQkJCQkiVW5hYmxlIHRvIHJldHJpZXZlIEhQRCBH
UElPXG4iKTsKPiA+ICsJCQlyZXR1cm4gUFRSX0VSUihjb25uLT5ocGRfZ3Bpbyk7Cj4gPiArCQl9
Cj4gPiArCj4gPiArCQljb25uLT5ocGRfaXJxID0gZ3Bpb2RfdG9faXJxKGNvbm4tPmhwZF9ncGlv
KTsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJCWNvbm4tPmhwZF9pcnEgPSAtRUlOVkFMOwo+ID4gKwl9
Cj4gPiArCj4gPiArCWlmIChjb25uLT5ocGRfaXJxID49IDApIHsKPiA+ICsJCXJldCA9IGRldm1f
cmVxdWVzdF90aHJlYWRlZF9pcnEoJnBkZXYtPmRldiwgY29ubi0+aHBkX2lycSwKPiA+ICsJCQkJ
CQlOVUxMLCBkaXNwbGF5X2Nvbm5lY3Rvcl9ocGRfaXJxLAo+ID4gKwkJCQkJCUlSUUZfVFJJR0dF
Ul9SSVNJTkcgfAo+ID4gKwkJCQkJCUlSUUZfVFJJR0dFUl9GQUxMSU5HIHwKPiA+ICsJCQkJCQlJ
UlFGX09ORVNIT1QsCj4gPiArCQkJCQkJIkhQRCIsIGNvbm4pOwo+ID4gKwkJaWYgKHJldCkgewo+
ID4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwKPiA+ICsJCQkJIkZhaWxlZCB0byByZXF1ZXN0IEhQ
RCBpbnRlcnJ1cHRcbiIpOwo+ID4gKwkJCXJldHVybiByZXQ7Cj4gCj4gSXMgdGhlcmUgYW55dGhp
bmcgdGhhdCBtYW5kYXRlcyBzdXBwb3J0IG9mIGVkZ2UgZXZlbnRzIG9uIEdQSU8gY2hpcHM/Cj4g
SSBrbm93IGl0J3MgcXVpdGUgY29tbW9uLCBidXQgbWF5YmUgd2Ugc2hvdWxkIGZhbGxiYWNrIHRv
IHBvbGxpbmcKPiBtb2RlIHdoZW4gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgpIGZhaWxzLgoK
VGhhdCdzIGEgZ29vZCBwb2ludCwgSSdsbCBjaGFuZ2UgdGhpcy4KCj4gPiArCQl9Cj4gPiArCX0K
PiA+ICsKPiA+ICsJLyogUmV0cmlldmUgdGhlIEREQyBJMkMgYWRhcHRlciBmb3IgRFZJLCBIRE1J
IGFuZCBWR0EgY29ubmVjdG9ycy4gKi8KPiA+ICsJaWYgKHR5cGUgPT0gRFJNX01PREVfQ09OTkVD
VE9SX0RWSUkgfHwKPiA+ICsJICAgIHR5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBIHx8
Cj4gPiArCSAgICB0eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EpIHsKPiA+ICsJCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqcGhhbmRsZTsKPiA+ICsKPiA+ICsJCXBoYW5kbGUgPSBvZl9wYXJzZV9w
aGFuZGxlKHBkZXYtPmRldi5vZl9ub2RlLCAiZGRjLWkyYy1idXMiLCAwKTsKPiA+ICsJCWlmIChw
aGFuZGxlKSB7Cj4gPiArCQkJY29ubi0+YnJpZGdlLmRkYyA9IG9mX2dldF9pMmNfYWRhcHRlcl9i
eV9ub2RlKHBoYW5kbGUpOwo+ID4gKwkJCW9mX25vZGVfcHV0KHBoYW5kbGUpOwo+ID4gKwkJCWlm
ICghY29ubi0+YnJpZGdlLmRkYykKPiA+ICsJCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gPiAr
CQl9IGVsc2Ugewo+ID4gKwkJCWRldl9kYmcoJnBkZXYtPmRldiwKPiA+ICsJCQkJIk5vIEkyQyBi
dXMgc3BlY2lmaWVkLCBkaXNhYmxpbmcgRURJRCByZWFkb3V0XG4iKTsKPiA+ICsJCX0KPiA+ICsJ
fQo+ID4gKwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
