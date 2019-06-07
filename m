Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271338975
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4364689024;
	Fri,  7 Jun 2019 11:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B4289D87
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:55:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F1CCB91;
 Fri,  7 Jun 2019 13:55:27 +0200 (CEST)
Date: Fri, 7 Jun 2019 14:55:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 18/20] drm: rcar-du: group: Enable DU's CMM extension
Message-ID: <20190607115513.GG7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-19-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-19-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559908527;
 bh=f4IcuPAfvdFAu7Z4BDYW1kHQDCa3MFndDR+AG3MCt+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tT7XutRp0wnnEFrCbFHyD8wvd/Ih78T4+TTjkFHMHi0QOXrIrH5YxuNZoMNumbIW6
 S0pJgv0lBbOH2kFFmh3pWqQsssRBhjJfXCGgetWBm+Nwoo5mf5KXx0McdSmQRMrf+e
 tVEghr3/O5TniRlbMN4seVaRbIqUtj2H3t9atqpw=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjoxOFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gRW5hYmxlIHRoZSBD
TU0gdW5pdHMgdGhyb3VnaCB0aGUgZGlzcGxheSB1bml0IGV4dGVuc2lvbmFsIGZ1bmN0aW9uIGNv
bnRyb2wKPiBncm91cCByZWdpc3RlciBERUZSNy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYyB8IDggKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9yZWdzLmggIHwgNSArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9ncm91cC5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5j
Cj4gaW5kZXggOWVlZTQ3OTY5ZTc3Li5kMjUyYzliYjk4MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9ncm91cC5jCj4gQEAgLTE0Nyw2ICsxNDcsMTQgQEAgc3RhdGljIHZv
aWQgcmNhcl9kdV9ncm91cF9zZXR1cChzdHJ1Y3QgcmNhcl9kdV9ncm91cCAqcmdycCkKPiAgCj4g
IAlyY2FyX2R1X2dyb3VwX3NldHVwX3BpbnMocmdycCk7Cj4gIAo+ICsJaWYgKHJjYXJfZHVfaGFz
KHJjZHUsIFJDQVJfRFVfRkVBVFVSRV9DTU0pKSB7CgpUaGlzIGlzIGEgZ29vZCBlbm91Z2ggcmVh
c29uIHRvIGtlZXAgUkNBUl9EVV9GRUFUVVJFX0NNTSA6LS8KCj4gKwkJdTMyIGRlZnI3ID0gREVG
UjdfQ09ERSB8Cj4gKwkJCSAgICAocmdycC0+Y21tc19tYXNrICYgQklUKDEpID8gREVGUjdfQ01N
RTEgOiAwKSB8Cj4gKwkJCSAgICAocmdycC0+Y21tc19tYXNrICYgQklUKDApID8gREVGUjdfQ01N
RTAgOiAwKTsKPiArCj4gKwkJcmNhcl9kdV9ncm91cF93cml0ZShyZ3JwLCBERUZSNywgZGVmcjcp
OwoKSXQgd291bGQgYmUgbmljZSB0byBkaXNhYmxlIHRoZSBDTU0gd2hlbiB0aGUgTFVUIGlzbid0
IHVzZWQsIGJ1dCB0aGF0CndvdWxkIGJlIGRpZmZpY3VsdCBhdCB0aGUgbW9tZW50LiBXZSBjYW4g
cmV2aXNpdCB0aGlzIHdoZW4gS2llcmFuJ3MgRFUKZ3JvdXAgaGFuZGxpbmcgc2VyaWVzIHdpbGwg
bGFuZC4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cgo+ICsJfQo+ICsKPiAgCWlmIChyY2R1LT5pbmZvLT5nZW4gPj0gMikg
ewo+ICAJCXJjYXJfZHVfZ3JvdXBfc2V0dXBfZGVmcjgocmdycCk7Cj4gIAkJcmNhcl9kdV9ncm91
cF9zZXR1cF9kaWRzcihyZ3JwKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3JlZ3Mu
aAo+IGluZGV4IGJjODdmMDgwYjE3MC4uZmI5OTY0OTQ5MzY4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9yZWdzLmgKPiBAQCAtMTk3LDYgKzE5NywxMSBAQAo+ICAjZGVmaW5l
IERFRlI2X01MT1MxCQkoMSA8PCAyKQo+ICAjZGVmaW5lIERFRlI2X0RFRkFVTFQJCShERUZSNl9D
T0RFIHwgREVGUjZfVENORTEpCj4gIAo+ICsjZGVmaW5lIERFRlI3CQkJMHgwMDBlYwo+ICsjZGVm
aW5lIERFRlI3X0NPREUJCSgweDc3NzkgPDwgMTYpCj4gKyNkZWZpbmUgREVGUjdfQ01NRTEJCUJJ
VCg2KQo+ICsjZGVmaW5lIERFRlI3X0NNTUUwCQlCSVQoNCkKPiArCj4gIC8qIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gICAqIFI4QTc3OTAtb25seSBDb250cm9sIFJlZ2lzdGVycwo+ICAgKi8KCi0t
IApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
