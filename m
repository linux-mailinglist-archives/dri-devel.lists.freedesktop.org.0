Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065937A68
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D689415;
	Thu,  6 Jun 2019 17:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937489415
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:00:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F77533B;
 Thu,  6 Jun 2019 19:00:44 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:00:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 07/20] clk: renesas: r8a77990: Add CMM clocks
Message-ID: <20190606170030.GN12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-8-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840444;
 bh=PU8fsFA4LR5gjN8p9jDNP2JzGYDseNa3weTfGFWVzZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t6sBGV44VxSNtAeLVoAPNvH3ANJ2suLeeoOQOY9O3sh6HUEvSLTsNSy88Td1yV8Fp
 mWGdWwuEhrxNf7WUGAtdsshqdPUICEIOb6DGA8t6tmZjor3EyRj4w5kP49kAoQAu/n
 BKfRJP4nd7Ovh+Wa1aep6lgAz+EPTO5wSPeCRTYM=
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
OSBhdCAwNDoyMjowN1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIGNsb2NrIGRl
ZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIEUzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KClJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTkwLWNwZy1tc3NyLmMg
fCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5MC1jcGctbXNzci5jIGIvZHJpdmVycy9jbGsv
cmVuZXNhcy9yOGE3Nzk5MC1jcGctbXNzci5jCj4gaW5kZXggOWEyNzhjNzVjOTE4Li44Y2RkMGU2
ZmI3NGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5MC1jcGctbXNz
ci5jCj4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5MC1jcGctbXNzci5jCj4gQEAg
LTE4Miw2ICsxODIsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3Nzk5
MF9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gewo+ICAKPiAgCURFRl9NT0QoImVoY2kwIiwJCSA3
MDMsCVI4QTc3OTkwX0NMS19TM0Q0KSwKPiAgCURFRl9NT0QoImhzdXNiIiwJCSA3MDQsCVI4QTc3
OTkwX0NMS19TM0Q0KSwKPiArCURFRl9NT0QoImNtbTEiLAkJCSA3MTAsCVI4QTc3OTkwX0NMS19T
MUQxKSwKPiArCURFRl9NT0QoImNtbTAiLAkJCSA3MTEsCVI4QTc3OTkwX0NMS19TMUQxKSwKPiAg
CURFRl9NT0QoImNzaTQwIiwJCSA3MTYsCVI4QTc3OTkwX0NMS19DU0kwKSwKPiAgCURFRl9NT0Qo
ImR1MSIsCQkJIDcyMywJUjhBNzc5OTBfQ0xLX1MxRDEpLAo+ICAJREVGX01PRCgiZHUwIiwJCQkg
NzI0LAlSOEE3Nzk5MF9DTEtfUzFEMSksCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
