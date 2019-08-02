Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DED7EF32
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF7A6ED30;
	Fri,  2 Aug 2019 08:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5792C6ED30
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:26:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81181CC;
 Fri,  2 Aug 2019 10:26:14 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:26:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 09/12] drm: rcar-du: lvds: Fix companion's mode
Message-ID: <20190802082613.GJ5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-10-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-10-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564734374;
 bh=aXNoGd0TIT84e+iwneFaYQWdhIReu4dkQnr3NUBLRCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZ+shzg3mcQSFxFZwnqlvNLlnhfbaRE3XAmO8zsEreBXfQu8PqTmKQ5oU163razhL
 gn2rDMncaNtYUnm+5ymz+/pl6CeXmBsbjvqsDkOF2Vqb+znPLbQGT1Uec/8Kn3Ogx0
 QR7QGGr6JFBrXWl6HRO5c01rdOTwj8UZYL1rE9zo=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjA2QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgY29t
cGFuaW9uIGVuY29kZXIgbmVlZHMgdG8gYmUgdG9sZCB0byB1c2UgdGhlIHNhbWUKPiBtb2RlIGFz
IHRoZSBwcmltYXJ5IGVuY29kZXIuCj4gCj4gRml4ZXM6IGU5ZTg3OThhYjdiOCAoImRybTogcmNh
ci1kdTogbHZkczogQWRkIHN1cHBvcnQgZm9yIGR1YWwtbGluayBtb2RlIikKPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCA2ICsrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBpbmRleCBlZGQ2M2Y1Li43OTQ0YWU5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBAQCAtNDE1LDggKzQxNSwxMiBAQCBzdGF0
aWMgdm9pZCByY2FyX2x2ZHNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIAkJ
cmV0dXJuOwo+ICAKPiAgCS8qIEVuYWJsZSB0aGUgY29tcGFuaW9uIExWRFMgZW5jb2RlciBpbiBk
dWFsLWxpbmsgbW9kZS4gKi8KPiAtCWlmIChsdmRzLT5kdWFsX2xpbmsgJiYgbHZkcy0+Y29tcGFu
aW9uKQo+ICsJaWYgKGx2ZHMtPmR1YWxfbGluayAmJiBsdmRzLT5jb21wYW5pb24pIHsKPiArCQlz
dHJ1Y3QgcmNhcl9sdmRzICpjb21wYW5pb25fbHZkcyA9IGJyaWRnZV90b19yY2FyX2x2ZHMoCj4g
KwkJCQkJCQlsdmRzLT5jb21wYW5pb24pOwo+ICsJCWNvbXBhbmlvbl9sdmRzLT5tb2RlID0gbHZk
cy0+bW9kZTsKPiAgCQlsdmRzLT5jb21wYW5pb24tPmZ1bmNzLT5lbmFibGUobHZkcy0+Y29tcGFu
aW9uKTsKPiArCX0KCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZG8gdGhpcyBpbiByY2FyX2x2ZHNf
bW9kZV9zZXQoKSBpbnN0ZWFkLCB0byBrZWVwCnRoZSBtb2RlIHNldCBjb2RlIGdyb3VwZWQgaW4g
YSBzaW5nbGUgcGxhY2UgPwoKPiAgCj4gIAkvKgo+ICAJICogSGFyZGNvZGUgdGhlIGNoYW5uZWxz
IGFuZCBjb250cm9sIHNpZ25hbHMgcm91dGluZyBmb3Igbm93LgoKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
