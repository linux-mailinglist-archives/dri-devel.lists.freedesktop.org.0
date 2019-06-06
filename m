Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C9537A26
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707DE892F6;
	Thu,  6 Jun 2019 16:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4587892F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:54:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 349BF33B;
 Thu,  6 Jun 2019 18:54:06 +0200 (CEST)
Date: Thu, 6 Jun 2019 19:53:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 03/20] dt-bindings: display, renesas, du: Update 'vsps' in
 example
Message-ID: <20190606165352.GK12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-4-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840046;
 bh=KU7bynOWQxEsZF9wVZ4WjYDe60zWXjq617V0v2YLhFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INHNwSelSFh4Y1SFZvTpHkfgSSQEgu3FcYWWbske5+W9Bsp2Mng4FCL31uLPgKlxm
 kT+x0kfvzqYOTCozj78CSliiv2JT1NpAlsJO1+mj9S8VIxNj9r+doIiLUs7mUh0l+r
 SOhLOwmFYYKzSS5lJe7hCIanuqB4IWc0sNJKFx4k=
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
OSBhdCAwNDoyMjowM1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gVXBkYXRlIHRoZSAn
dnNwcycgcHJvcGVydHkgc3RydWN0dXJlIGluIHRoZSBkb2N1bWVudGF0aW9uIGV4YW1wbGUgdG8K
PiByZWZsZWN0IHdoYXQncyBhY3R1YWxseSBpbXBsZW1lbnRlZCBpbiB0aGUgZGV2aWNlIHRyZWUg
c291cmNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2Fz
QGptb25kaS5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUudHh0IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+IGluZGV4IDEwMDExNGVm
MTFkNS4uMjYyMDQ3MDUzZDMxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKPiBAQCAtOTIsNyArOTIs
NyBAQCBFeGFtcGxlOiBSOEE3Nzk1IChSLUNhciBIMykgRVMyLjAgRFUKPiAgCQkJIDwmY3BnIENQ
R19NT0QgNzIyPiwKPiAgCQkJIDwmY3BnIENQR19NT0QgNzIxPjsKPiAgCQljbG9jay1uYW1lcyA9
ICJkdS4wIiwgImR1LjEiLCAiZHUuMiIsICJkdS4zIjsKPiAtCQl2c3BzID0gPCZ2c3BkMCAwPiwg
PCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKPiArCQl2c3BzID0gPCZ2c3BkMCAw
ICZ2c3BkMSAwICZ2c3BkMiAgJnZzcGQwIDE+OwoKVGhlIGZvcm1lciBpcyBzaW1wbGVyIHRvIHJl
YWQgdGhhbiB0aGUgbGF0dGVyIGluIG15IG9waW5pb24uIFNob3VsZG4ndAp3ZSB1cGRhdGUgdGhl
IC5kdHNpIGZpbGVzIGluc3RlYWQgPwoKPiAgCQljbW1zID0gPCZjbW0wICZjbW0xICZjbW0yICZj
bW0zPjsKPiAgCj4gIAkJcG9ydHMgewoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
