Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72392A1CE0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50536E140;
	Thu, 29 Aug 2019 14:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A766E140
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:33:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-67-152-nat.elisa-mobile.fi
 [85.76.67.152])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 723932E5;
 Thu, 29 Aug 2019 16:33:04 +0200 (CEST)
Date: Thu, 29 Aug 2019 17:32:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
Message-ID: <20190829143247.GA5875@pendragon.ideasonboard.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567089185;
 bh=LLFnNWi8+xe8IFUm2uC6E4KdDBHIapI6l0mBjCKYGQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1IZWYl214YobUT+kDlLhT8Z+WGbNEUZKAs2UeOAkMXKFpJIcJ0+jo2pycxMlv3FL
 dufELA9j3jTRLxSTRUbk5dOQ7jNMcUOyeR/vvKQKsddb+vBOE6FNIXQH8lplFwM/E8
 P9/ma5NLQgzSyNNdWgW/zEFAGTKunSrOcqNtDd3k=
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
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, xu_shunji@hoperun.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, ebiharaml@si-linux.co.jp,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgQXVnIDI5LCAy
MDE5IGF0IDEyOjM4OjMyUE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBBZGQgYmlu
ZGluZyBmb3IgdGhlIGlkay0xMTEwd3IgTFZEUyBwYW5lbCBmcm9tIEFkdmFudGVjaC4KPiAKPiBT
b21lIHBhbmVsLXNwZWNpZmljIGRvY3VtZW50YXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6Cj4gaHR0
cHM6Ly9idXkuYWR2YW50ZWNoLmV1L0Rpc3BsYXlzL0VtYmVkZGVkLUxDRC1LaXRzLUxDRC1LaXQt
TW9kdWxlcy9tb2RlbC1JREstMTExMFdSLTU1V1NBMUUuaHRtCj4gCj4gU2lnbmVkLW9mZi1ieTog
RmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgoKPiAtLS0KPiB2MS0+djI6Cj4gKiBubyBjaGFuZ2UKPiAKPiAgLi4uL2Rpc3BsYXkvcGFuZWwv
YWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbCAgICAgICAgfCA2OSArKysrKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZh
bnRlY2gsaWRrLTExMTB3ci55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRl
Y2gsaWRrLTExMTB3ci55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
Li5lNWZkYWEwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwKPiBAQCAt
MCwwICsxLDY5IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArJVlB
TUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3Bs
YXkvcGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogQWR2YW50
ZWNoIElESy0xMTEwV1IgMTAuMSIgV1NWR0EgTFZEUyBEaXNwbGF5IFBhbmVsCj4gKwo+ICttYWlu
dGFpbmVyczoKPiArICAtIEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVz
YXMuY29tPgo+ICsgIC0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4K
PiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogbHZkcy55YW1sIwo+ICsKPiArcHJvcGVydGllczoK
PiArICBjb21wYXRpYmxlOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IGFkdmFudGVj
aCxpZGstMTExMHdyCj4gKyAgICAgIC0ge30gIyBwYW5lbC1sdmRzLCBidXQgbm90IGxpc3RlZCBo
ZXJlIHRvIGF2b2lkIGZhbHNlIHNlbGVjdAo+ICsKPiArICBkYXRhLW1hcHBpbmc6Cj4gKyAgICBj
b25zdDogamVpZGEtMjQKPiArCj4gKyAgd2lkdGgtbW06Cj4gKyAgICBjb25zdDogMjIzCj4gKwo+
ICsgIGhlaWdodC1tbToKPiArICAgIGNvbnN0OiAxMjUKPiArCj4gKyAgcGFuZWwtdGltaW5nOiB0
cnVlCj4gKyAgcG9ydDogdHJ1ZQo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4g
Kwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0g
fCsKPiArICAgIHBhbmVsIHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gsaWRrLTEx
MTB3ciIsICJwYW5lbC1sdmRzIjsKPiArCj4gKyAgICAgIHdpZHRoLW1tID0gPDIyMz47Cj4gKyAg
ICAgIGhlaWdodC1tbSA9IDwxMjU+Owo+ICsKPiArICAgICAgZGF0YS1tYXBwaW5nID0gImplaWRh
LTI0IjsKPiArCj4gKyAgICAgIHBhbmVsLXRpbWluZyB7Cj4gKyAgICAgICAgLyogMTAyNHg2MDAg
QDYwSHogKi8KPiArICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NTEyMDAwMDA+Owo+ICsgICAg
ICAgIGhhY3RpdmUgPSA8MTAyND47Cj4gKyAgICAgICAgdmFjdGl2ZSA9IDw2MDA+Owo+ICsgICAg
ICAgIGhzeW5jLWxlbiA9IDwyNDA+Owo+ICsgICAgICAgIGhmcm9udC1wb3JjaCA9IDw0MD47Cj4g
KyAgICAgICAgaGJhY2stcG9yY2ggPSA8NDA+Owo+ICsgICAgICAgIHZzeW5jLWxlbiA9IDwxMD47
Cj4gKyAgICAgICAgdmZyb250LXBvcmNoID0gPDE1PjsKPiArICAgICAgICB2YmFjay1wb3JjaCA9
IDwxMD47Cj4gKyAgICAgIH07Cj4gKwo+ICsgICAgICBwb3J0IHsKPiArICAgICAgICBwYW5lbF9p
bjogZW5kcG9pbnQgewo+ICsgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX2VuY29k
ZXI+Owo+ICsgICAgICAgIH07Cj4gKyAgICAgIH07Cj4gKyAgICB9Owo+ICsKPiArLi4uCgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
