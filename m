Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE20427770
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 09:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8484E89C05;
	Thu, 23 May 2019 07:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F4089B9E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 07:50:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-106-214-nat.elisa-mobile.fi
 [85.76.106.214])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B99337;
 Thu, 23 May 2019 09:50:56 +0200 (CEST)
Date: Thu, 23 May 2019 10:50:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/6] drm/bridge: extract some Analogix I2C DP common code
Message-ID: <20190523075035.GA5971@pendragon.ideasonboard.com>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065352.8FD7668B05@newverein.lst.de>
 <CAGb2v66+1+goJfnY7nWTGN2fupqMUm5o+gkPdUW6nxcwQEDwog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGb2v66+1+goJfnY7nWTGN2fupqMUm5o+gkPdUW6nxcwQEDwog@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558597857;
 bh=zsNCBZECQ0yrfz5b/Kf0LR+UbT6mYeay0fy5WNOd/V8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xy4kUdm69ph8GVhZbB3CiV/q9G0tNbpnq3bRoGsAzYQTqFj9QRoCeEk6+5pPuK8zt
 gk3ivrjSTiQ90/iwbUmZ2kErM4nCl6COVNX1ZPkLEVFqbjaQGiUBIeiPIBxSVAL5ra
 PYkGxHqqP33p+t7/trbNc4aJp7/wa3mZ9K4L9RXg=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Torsten Duwe <duwe@lst.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Harald Geyer <harald@ccbib.org>,
 Sean Paul <seanpaul@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDM6NDA6MjVQTSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdy
b3RlOgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDI6NTQgUE0gVG9yc3RlbiBEdXdlIDxkdXdl
QGxzdC5kZT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3Nj
LmlvPgo+ID4KPiA+IFNvbWUgY29kZSBjYW4gYmUgc2hhcmVkIHdpdGhpbiBkaWZmZXJlbnQgRFAg
YnJpZGdlcyBieSBBbmFsb2dpeC4KPiA+Cj4gPiBFeHRyYWN0IHRoZW0gdG8gYSBuZXcgbW9kdWxl
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4K
PiA+IFNpZ25lZC1vZmYtYnk6IFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUb3JzdGVuIER1d2UgPGR1d2VAc3VzZS5kZT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2NvbmZpZyAgICAgICAgICAgIHwg
ICA0ICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L01ha2VmaWxlICAgICAg
ICAgICB8ICAgMiArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eC1hbng3OHh4LmMgfCAxNDYgKy0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgLi4uL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy1kcHR4LmMgICAgfCAxNjkgKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgLi4uL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy1kcHR4
LmggICAgfCAgIDIgKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTc4IGluc2VydGlvbnMoKyksIDE0
NSBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5jCj4gPgo+IAo+IC4uLgo+IAo+ID4gIHN0
YXRpYyBpbnQgYW54Nzh4eF9zZXRfaHBkKHN0cnVjdCBhbng3OHh4ICphbng3OHh4KQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRw
dHguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHgu
Ywo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOWNiMzA5
NjIwMzJlCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy1kcHR4LmMKPiA+IEBAIC0wLDAgKzEsMTY5IEBACj4gPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsvKgo+ID4gKyAqIENvcHly
aWdodChjKSAyMDE3IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiA+ICsgKgo+ID4g
KyAqIEJhc2VkIG9uIGFuYWxvZ2l4LWFueDc4eHguYywgd2hpY2ggaXM6Cj4gPiArICogICBDb3B5
cmlnaHQoYykgMjAxNiwgQW5hbG9naXggU2VtaWNvbmR1Y3Rvci4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KPiAKPiBJZiB0aGlzIHdhcyBzaW1wbGUgY29kZSBtb3ZlbWVudCwgdGhlbiB0aGUgb3JpZ2lu
YWwgY29weXJpZ2h0IHN0aWxsIGFwcGxpZXMuCj4gQSBkaWZmZXJlbnQgY29weXJpZ2h0IG5vdGlj
ZSBzaG91bGQgbm90IGJlIHVzZWQuIEkgc3VwcG9zZSB0aGUgc2FtZSBhcHBsaWVzCj4gdG8gdGhl
IG1vZHVsZSBhdXRob3IuCgpBbmQgbGlrZWx5IHRvIHBhdGNoIDIvNiB0b28uCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
