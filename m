Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2427EE33
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0C6ECE4;
	Fri,  2 Aug 2019 08:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFC76ECE4
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:00:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36C14CC;
 Fri,  2 Aug 2019 10:00:24 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:00:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 03/12] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Message-ID: <20190802080014.GD5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564732824;
 bh=fHqUhHxv+dowCFnK+aKicU4wDKUIzOBIeuo7dm5vB4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ByplI92xC0wpHm5YCI11P+eb6h5qb4wIW9Qa2sdGhh8DVpMeKRCCmToK9LYCrxMqH
 DeTROF2bfKL3qiHRKLuxTdZU160cqtSOqWxn1p00W8L3Yio92VqXMLj0Nr8PiSXKtO
 ksTIKB9MAbKL3K4fVcWbAogOppUFhyMG1uq1fEHQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjAwQU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBEdWFsLWxp
bmsgTFZEUyBkaXNwbGF5cyBoYXZlIHR3byBwb3J0cywgdGhlcmVmb3JlIGRvY3VtZW50IHRoaXMK
PiB3aXRoIHRoZSBiaW5kaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwtbHZkcy50eHQgICAgICAgICAgfCA5MSArKysrKysrKysrKysrKysr
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwtbHZkcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dAo+IGluZGV4IDI1MDg1MGEuLjA3Nzk1
NDQxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3BhbmVsLWx2ZHMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtbHZkcy50eHQKPiBAQCAtNDEsNyArNDEsOCBA
QCBSZXF1aXJlZCBub2RlczoKPiAgCj4gIC0gcGFuZWwtdGltaW5nOiBTZWUgcGFuZWwtY29tbW9u
LnR4dC4KPiAgLSBwb3J0czogU2VlIHBhbmVsLWNvbW1vbi50eHQuIFRoZXNlIGJpbmRpbmdzIHJl
cXVpcmUgYSBzaW5nbGUgcG9ydCBzdWJub2RlCj4gLSAgY29ycmVzcG9uZGluZyB0byB0aGUgcGFu
ZWwgTFZEUyBpbnB1dC4KPiArICAoZm9yIGEgc2luZ2xlIGxpbmsgZGlzcGxheSkgb3IgdHdvIHBv
cnQgc3Vibm9kZXMgKGZvciBhIGR1YWwgbGluayBkaXNwbGF5KQo+ICsgIGNvcnJlc3BvbmRpbmcg
dG8gdGhlIHBhbmVsIExWRFMgaW5wdXQocykuCgpJIHRoaW5rIHlvdSBzaG91bGQgZXhwYW5kIHRo
aXMgYSBiaXQgdG8gZXhwbGFpbiB3aGF0IHRoZSBwb3J0cwpjb3JyZXNwb25kIHRvIGluIHRoZSBk
dWFsIGxpbmsgbW9kZS4KCj4gIExWRFMgZGF0YSBtYXBwaW5ncyBhcmUgZGVmaW5lZCBhcyBmb2xs
b3dzLgo+IEBAIC05MiwzMCArOTMsNzIgQEAgQ1RMMzogMAo+ICBFeGFtcGxlCj4gIC0tLS0tLS0K
PiAgCj4gLXBhbmVsIHsKPiAtCWNvbXBhdGlibGUgPSAibWl0c3ViaXNoaSxhYTEyMXRkMDEiLCAi
cGFuZWwtbHZkcyI7Cj4gLQo+IC0Jd2lkdGgtbW0gPSA8MjYxPjsKPiAtCWhlaWdodC1tbSA9IDwx
NjM+Owo+IC0KPiAtCWRhdGEtbWFwcGluZyA9ICJqZWlkYS0yNCI7Cj4gLQo+IC0JcGFuZWwtdGlt
aW5nIHsKPiAtCQkvKiAxMjgweDgwMCBANjBIeiAqLwo+IC0JCWNsb2NrLWZyZXF1ZW5jeSA9IDw3
MTAwMDAwMD47Cj4gLQkJaGFjdGl2ZSA9IDwxMjgwPjsKPiAtCQl2YWN0aXZlID0gPDgwMD47Cj4g
LQkJaHN5bmMtbGVuID0gPDcwPjsKPiAtCQloZnJvbnQtcG9yY2ggPSA8MjA+Owo+IC0JCWhiYWNr
LXBvcmNoID0gPDcwPjsKPiAtCQl2c3luYy1sZW4gPSA8NT47Cj4gLQkJdmZyb250LXBvcmNoID0g
PDM+Owo+IC0JCXZiYWNrLXBvcmNoID0gPDE1PjsKPiArU2luZ2xlIHBvcnQ6Cj4gKwlwYW5lbCB7
Cj4gKwkJY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMTIxdGQwMSIsICJwYW5lbC1sdmRzIjsK
PiArCj4gKwkJd2lkdGgtbW0gPSA8MjYxPjsKPiArCQloZWlnaHQtbW0gPSA8MTYzPjsKPiArCj4g
KwkJZGF0YS1tYXBwaW5nID0gImplaWRhLTI0IjsKPiArCj4gKwkJcGFuZWwtdGltaW5nIHsKPiAr
CQkJLyogMTI4MHg4MDAgQDYwSHogKi8KPiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDcxMDAwMDAw
PjsKPiArCQkJaGFjdGl2ZSA9IDwxMjgwPjsKPiArCQkJdmFjdGl2ZSA9IDw4MDA+Owo+ICsJCQlo
c3luYy1sZW4gPSA8NzA+Owo+ICsJCQloZnJvbnQtcG9yY2ggPSA8MjA+Owo+ICsJCQloYmFjay1w
b3JjaCA9IDw3MD47Cj4gKwkJCXZzeW5jLWxlbiA9IDw1PjsKPiArCQkJdmZyb250LXBvcmNoID0g
PDM+Owo+ICsJCQl2YmFjay1wb3JjaCA9IDwxNT47Cj4gKwkJfTsKPiArCj4gKwkJcG9ydCB7Cj4g
KwkJCXBhbmVsX2luOiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNf
ZW5jb2Rlcj47Cj4gKwkJCX07Cj4gKwkJfTsKPiAgCX07Cj4gIAo+IC0JcG9ydCB7Cj4gLQkJcGFu
ZWxfaW46IGVuZHBvaW50IHsKPiAtCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX2VuY29kZXI+
Owo+ICtUd28gcG9ydHM6Cj4gKwlwYW5lbCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gs
aWRrLTIxMjF3ciIsICJwYW5lbC1sdmRzIjsKPiArCj4gKwkJd2lkdGgtbW0gPSA8NDc2PjsKPiAr
CQloZWlnaHQtbW0gPSA8MjY4PjsKPiArCj4gKwkJZGF0YS1tYXBwaW5nID0gInZlc2EtMjQiOwo+
ICsKPiArCQlwYW5lbC10aW1pbmcgewo+ICsJCQljbG9jay1mcmVxdWVuY3kgPSA8MTQ4NTAwMDAw
PjsKPiArCQkJaGFjdGl2ZSA9IDwxOTIwPjsKPiArCQkJdmFjdGl2ZSA9IDwxMDgwPjsKPiArCQkJ
aHN5bmMtbGVuID0gPDQ0PjsKPiArCQkJaGZyb250LXBvcmNoID0gPDg4PjsKPiArCQkJaGJhY2st
cG9yY2ggPSA8MTQ4PjsKPiArCQkJdmZyb250LXBvcmNoID0gPDQ+Owo+ICsJCQl2YmFjay1wb3Jj
aCA9IDwzNj47Cj4gKwkJCXZzeW5jLWxlbiA9IDw1PjsKPiArCQl9Owo+ICsKPiArCQlwb3J0cyB7
Cj4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiAr
Cj4gKwkJCXBvcnRAMCB7Cj4gKwkJCQlyZWcgPSA8MD47Cj4gKwkJCQlsdmRzMF9wYW5lbF9pbjog
ZW5kcG9pbnQgewoKSSB3b3VsZCBuYW1lIHRoZSBsYWJlbCBwYW5lbF9pbjAgYW5kIHBhbmVsX2lu
MSBiZWxvdyB0byBoYXZlIGEgY29tbW9uCnByZWZpeCBzaG93aW5nIHRoYXQgYm90aCByZWZlciB0
byB0aGUgc2FtZSBwYW5lbC4KCj4gKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+
Owo+ICsJCQkJfTsKPiArCQkJfTsKPiArCj4gKwkJCXBvcnRAMSB7Cj4gKwkJCQlyZWcgPSA8MT47
Cj4gKwkJCQlsdmRzMV9wYW5lbF9pbjogZW5kcG9pbnQgewo+ICsJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmbHZkczFfb3V0PjsKPiArCQkJCX07Cj4gKwkJCX07Cj4gIAkJfTsKPiAgCX07Cj4gLX07
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
