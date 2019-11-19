Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01C100FB5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290656E573;
	Tue, 19 Nov 2019 00:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FEF6E573
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:09:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BE54563;
 Tue, 19 Nov 2019 01:09:16 +0100 (CET)
Date: Tue, 19 Nov 2019 02:09:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: lvds-codec:
 Document ti,ds90cf384a
Message-ID: <20191119000905.GI5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574122157;
 bh=WFDh7Jt24vKBHqEMGj5iIObfGc2t6wMRVwF9YoiLCe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zzvrcf0wY9PR/c+3JtciKxelAYq1PYTWMGTVOmKqY5WSVBx3h8olJozdVXB8Jt2Gm
 cFcGowLlLcOz4Tp94xs4vYZBKTC/YbLm7pPkdUZSGbjppr2e7Ws+q6KEWAZ/LGWBuR
 4MJN50z5ddhpuwIvjTYKZeQv9yzlo59nOddB0On0=
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
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDAzOjUxOjI4UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgRFM5
MENGMzg0QSBmcm9tIFRJIGlzIGEgdHJhbnNwYXJlbnQgTFZEUyByZWNlaXZlciAoZGVjb2Rlciks
Cj4gYW5kIHRoZXJlZm9yZSBpdCBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGx2ZHMtY29kZWMgZHJp
dmVyIGFuZAo+IGJpbmRpbmdzLgo+IAo+IERvY3VtZW50IHRoZSB0aSxkczkwY2YzODRhIGNvbXBh
dGlibGUgc3RyaW5nIHdpdGggdGhlIGR0LWJpbmRpbmdzLgo+IE5vIGRyaXZlciBjaGFuZ2UgcmVx
dWlyZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0
cm9AYnAucmVuZXNhcy5jb20+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiB2My0+djQ6Cj4gKiBOZXcgcGF0
Y2gKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2x2ZHMtY29kZWMueWFtbCB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMu
eWFtbAo+IGluZGV4IDBlY2M4YTQuLjIxZjhjNmUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRz
LWNvZGVjLnlhbWwKPiBAQCAtNDAsNyArNDAsMTAgQEAgcHJvcGVydGllczoKPiAgICAgICAgICAg
IC0gdGksZHM5MGMxODcgICAgICAgIyBGb3IgdGhlIFRJIERTOTBDMTg3IEZQRC1MaW5rIFNlcmlh
bGl6ZXIKPiAgICAgICAgICAgIC0gdGksc243NWx2ZHM4MyAgICAgIyBGb3IgdGhlIFRJIFNONzVM
VkRTODMgRmxhdExpbmsgdHJhbnNtaXR0ZXIKPiAgICAgICAgICAtIGNvbnN0OiBsdmRzLWVuY29k
ZXIgIyBHZW5lcmljIExWRFMgZW5jb2RlciBjb21wYXRpYmxlIGZhbGxiYWNrCj4gLSAgICAgIC0g
Y29uc3Q6IGx2ZHMtZGVjb2RlciAgICMgR2VuZXJpYyBMVkRTIGRlY29kZXJzIGNvbXBhdGlibGUg
ZmFsbGJhY2sKPiArICAgICAgLSBpdGVtczoKPiArICAgICAgICAtIGVudW06Cj4gKyAgICAgICAg
ICAtIHRpLGRzOTBjZjM4NGEgICAgICMgRm9yIHRoZSBEUzkwQ0YzODRBIEZQRC1MaW5rIExWRFMg
UmVjZWl2ZXIKPiArICAgICAgICAtIGNvbnN0OiBsdmRzLWRlY29kZXIgIyBHZW5lcmljIExWRFMg
ZGVjb2RlcnMgY29tcGF0aWJsZSBmYWxsYmFjawo+ICAKPiAgICBwb3J0czoKPiAgICAgIHR5cGU6
IG9iamVjdAo+IEBAIC0xMDIsNyArMTA1LDcgQEAgZXhhbXBsZXM6Cj4gIAo+ICAgIC0gfAo+ICAg
ICAgbHZkcy1kZWNvZGVyIHsKPiAtICAgICAgY29tcGF0aWJsZSA9ICJsdmRzLWRlY29kZXIiOwo+
ICsgICAgICBjb21wYXRpYmxlID0gInRpLGRzOTBjZjM4NGEiLCAibHZkcy1kZWNvZGVyIjsKPiAg
Cj4gICAgICAgIHBvcnRzIHsKPiAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKCi0tIApS
ZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
