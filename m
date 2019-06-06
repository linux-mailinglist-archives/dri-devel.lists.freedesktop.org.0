Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B107437A63
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB920893A4;
	Thu,  6 Jun 2019 17:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BF7893A4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:00:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C041E33B;
 Thu,  6 Jun 2019 18:59:59 +0200 (CEST)
Date: Thu, 6 Jun 2019 19:59:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 06/20] clk: renesas: r8a77965: Add CMM clocks
Message-ID: <20190606165945.GM12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-7-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840399;
 bh=5X4XDtwWOlQt05zyhRZuWjlaeJCoBpyM3GZhcMPznXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=raeumGqFAlTVMCr+owMwwJa/2Wngo6TIzylT8fOqd35r9LEGs1YViIc4zVedGRC+R
 obs1iDnmH//4ElvAmMWLUIpKz/wJ8ROuxSzZt4IOdiX2abflHKB8hMmZRBv9MN5iuU
 +fMSJj2Y4GtUlf4dZoLhV8O3LNDSGStY1+XLcnUU=
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
OSBhdCAwNDoyMjowNlBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIGNsb2NrIGRl
ZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIE0zLU4uCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoK
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NjUtY3BnLW1zc3Iu
YyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk2NS1jcGctbXNzci5jIGIvZHJpdmVycy9j
bGsvcmVuZXNhcy9yOGE3Nzk2NS1jcGctbXNzci5jCj4gaW5kZXggZWIxY2NhNThhMWUxLi41OGY3
NWIwM2M4YmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk2NS1jcGct
bXNzci5jCj4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk2NS1jcGctbXNzci5jCj4g
QEAgLTE3OCw2ICsxNzgsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3
Nzk2NV9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gewo+ICAJREVGX01PRCgiZWhjaTEiLAkJNzAy
LAlSOEE3Nzk2NV9DTEtfUzNENCksCj4gIAlERUZfTU9EKCJlaGNpMCIsCQk3MDMsCVI4QTc3OTY1
X0NMS19TM0Q0KSwKPiAgCURFRl9NT0QoImhzdXNiIiwJCTcwNCwJUjhBNzc5NjVfQ0xLX1MzRDQp
LAo+ICsJREVGX01PRCgiY21tMyIsCQkJNzA4LAlSOEE3Nzk2NV9DTEtfUzJEMSksCj4gKwlERUZf
TU9EKCJjbW0xIiwJCQk3MTAsCVI4QTc3OTY1X0NMS19TMkQxKSwKPiArCURFRl9NT0QoImNtbTAi
LAkJCTcxMSwJUjhBNzc5NjVfQ0xLX1MyRDEpLAo+ICAJREVGX01PRCgiY3NpMjAiLAkJNzE0LAlS
OEE3Nzk2NV9DTEtfQ1NJMCksCj4gIAlERUZfTU9EKCJjc2k0MCIsCQk3MTYsCVI4QTc3OTY1X0NM
S19DU0kwKSwKPiAgCURFRl9NT0QoImR1MyIsCQkJNzIxLAlSOEE3Nzk2NV9DTEtfUzJEMSksCgot
LSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
