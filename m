Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201DE37A6C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3A388C4C;
	Thu,  6 Jun 2019 17:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB788C4C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:01:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AD6A33B;
 Thu,  6 Jun 2019 19:01:06 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:00:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 08/20] clk: renesas: r8a77995: Add CMM clocks
Message-ID: <20190606170052.GO12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-9-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-9-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840466;
 bh=MF218gquzWXC4u+to0JZZATVETWWKvUN/hjgtdzhRHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWChOf+jAdJEpUYNt3YTObfW+jdZN2XRVZ9iFVcj7KROMxw2+zg4flsuAQ1aU824z
 wjJdJifzSaxyyctcEACpA5AAHcrVbQgO/ApyWcBefBxXs9Whe78SA74Qr/ceH/IGhA
 j0LyGRKn8ssxNtqzQCVgjQSnxTYkPTVTEFR9IFQ4=
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
OSBhdCAwNDoyMjowOFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIGNsb2NrIGRl
ZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIEQzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KClJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTk1LWNwZy1tc3NyLmMg
fCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5NS1jcGctbXNzci5jIGIvZHJpdmVycy9jbGsv
cmVuZXNhcy9yOGE3Nzk5NS1jcGctbXNzci5jCj4gaW5kZXggZWVlMzg3NDg2NWE5Li5hY2Q1ZmFi
Yjc4NWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5NS1jcGctbXNz
ci5jCj4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk5NS1jcGctbXNzci5jCj4gQEAg
LTE0Niw2ICsxNDYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3Nzk5
NV9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gewo+ICAJREVGX01PRCgidnNwYnMiLAkJIDYyNywJ
UjhBNzc5OTVfQ0xLX1MwRDEpLAo+ICAJREVGX01PRCgiZWhjaTAiLAkJIDcwMywJUjhBNzc5OTVf
Q0xLX1MzRDIpLAo+ICAJREVGX01PRCgiaHN1c2IiLAkJIDcwNCwJUjhBNzc5OTVfQ0xLX1MzRDIp
LAo+ICsJREVGX01PRCgiY21tMSIsCQkJIDcxMCwJUjhBNzc5OTVfQ0xLX1MxRDEpLAo+ICsJREVG
X01PRCgiY21tMCIsCQkJIDcxMSwJUjhBNzc5OTVfQ0xLX1MxRDEpLAo+ICAJREVGX01PRCgiZHUx
IiwJCQkgNzIzLAlSOEE3Nzk5NV9DTEtfUzFEMSksCj4gIAlERUZfTU9EKCJkdTAiLAkJCSA3MjQs
CVI4QTc3OTk1X0NMS19TMUQxKSwKPiAgCURFRl9NT0QoImx2ZHMiLAkJCSA3MjcsCVI4QTc3OTk1
X0NMS19TMkQxKSwKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
